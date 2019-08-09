<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.request.contextPath}/" />
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery.min.js"></script>
<script src="js/aliyun/aliyun-upload-sdk-1.5.0.min.js"></script>
<script src="js/aliyun/es6-promise.min.js"></script>
<script src="js/aliyun/aliyun-oos-sdk-5.3.1.min.js"></script>
<style type="text/css">
.container {
	width: 1200px;
	margin: 0 auto;
}

.input-control {
	margin: 5px 0;
}

.input-control label {
	font-size: 14px;
	color: #333;
	width: 30%;
	text-align: right;
	display: inline-block;
	vertical-align: middle;
	margin-right: 10px;
}

.input-control input {
	width: 30%;
	height: 30px;
	padding: 0 5px;
}

.upload {
	padding: 30px 50px;
}

.progress {
	font-size: 14px;
}

.progress i {
	font-style: normal;
}

.upload-type {
	color: #666;
	font-size: 12px;
	padding: 10px 0;
}

.upload-type button {
	margin: 0 10px 0 20px;
}

.status {
	font-size: 14px;
	margin-left: 30px;
}

.info {
	font-size: 14px;
	padding-left: 30px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="setting">
			<div class="input-control">
				<label for="userId">阿里云账号ID:</label> <input type="text"
					value="1487664468822264" disabled class="form-control" id="userId"
					placeholder="输入阿里云账号ID"> 
			</div>
		</div>

		<div class="upload">
			<div>
				<input type="file" id="fileUpload"> <label class="status">上传状态:
					<span id="status"></span>
				</label>
			</div>
			<div class="upload-type">
				上传方式二, 使用 STSToken 上传:
				<button id="stsUpload" disabled="false">开始上传</button>
				<button id="pauseUpload">暂停</button>
				<button id="resumeUpload" disabled="false">恢复上传</button>
				<span class="progress">上传进度: <i id="sts-progress">0</i> %
				</span>
			</div>
		</div>
		<div class="info">
			点播STS参数如何获取，请查阅<a
				href="https://help.aliyun.com/document_detail/57114.html"
				target="_blakn"> 获取STS</a>
		</div>
	</div>
	<script>
  //兼容IE11
    if (!FileReader.prototype.readAsBinaryString) {
        FileReader.prototype.readAsBinaryString = function (fileData) {
           var binary = "";
           var pt = this;
           var reader = new FileReader();      
           reader.onload = function (e) {
               var bytes = new Uint8Array(reader.result);
               var length = bytes.byteLength;
               for (var i = 0; i < length; i++) {
                   binary += String.fromCharCode(bytes[i]);
               }
            //pt.result  - readonly so assign binary
            pt.content = binary;
            pt.onload()
        }
        reader.readAsArrayBuffer(fileData);
        }
    }
    $(document).ready(function () {
      /** 
       * 创建一个上传对象
       * 使用 STSToken 上传方式
       */
      function createUploader () {
        var uploader = new AliyunUpload.Vod({
          timeout: $('#timeout').val() || 60000,
          partSize: $('#partSize').val() || 1048576,
          parallel: $('#parallel').val() || 5,
          retryCount: $('#retryCount').val() || 3,
          retryDuration: $('#retryDuration').val() || 2,
          region: $('#region').val(),
          userId: $('#userId').val(),
          // 添加文件成功
          addFileSuccess: function (uploadInfo) {
            $('#stsUpload').attr('disabled', false)
            $('#resumeUpload').attr('disabled', false)
            $('#status').text('添加文件成功, 等待上传...')
            console.log("addFileSuccess: " + uploadInfo.file.name)
          },
          // 开始上传
          onUploadstarted: function (uploadInfo) {
            // 如果是 STSToken 上传方式, 需要调用 uploader.setUploadAuthAndAddress 方法
            // 用户需要自己获取 accessKeyId, accessKeySecret,secretToken
            // 下面的 URL 只是测试接口, 用于获取 测试的 accessKeyId, accessKeySecret,secretToken
            var stsUrl = 'http://demo-vod.cn-shanghai.aliyuncs.com/voddemo/CreateSecurityToken?BusinessType=vodai&TerminalType=pc&DeviceModel=iPhone9,2&UUID=67999yyuuuy&AppVersion=1.0.0'
            $.get(stsUrl, function (data) {
              var info = data.SecurityTokenInfo
              var accessKeyId = info.AccessKeyId
              var accessKeySecret = info.AccessKeySecret
              var secretToken = info.SecurityToken
              uploader.setSTSToken(uploadInfo, accessKeyId, accessKeySecret, secretToken)
            }, 'json')
            $('#status').text('文件开始上传...')
            console.log("onUploadStarted:" + uploadInfo.file.name + ", endpoint:" + uploadInfo.endpoint + ", bucket:" + uploadInfo.bucket + ", object:" + uploadInfo.object)
          },
          // 文件上传成功
          onUploadSucceed: function (uploadInfo) {
            console.log("onUploadSucceed: " + uploadInfo.file.name + ", endpoint:" + uploadInfo.endpoint + ", bucket:" + uploadInfo.bucket + ", object:" + uploadInfo.object)
            $('#status').text('文件上传成功!')
          },
          // 文件上传失败
          onUploadFailed: function (uploadInfo, code, message) {
            console.log("onUploadFailed: file:" + uploadInfo.file.name + ",code:" + code + ", message:" + message)
            $('#status').text('文件上传失败!')
          },
          // 取消文件上传
          onUploadCanceled: function (uploadInfo, code, message) {
            console.log("Canceled file: " + uploadInfo.file.name + ", code: " + code + ", message:" + message)
            $('#status').text('文件已暂停上传!')

          },
          // 文件上传进度，单位：字节, 可以在这个函数中拿到上传进度并显示在页面上
          onUploadProgress: function (uploadInfo, totalSize, progress) {
            console.log("onUploadProgress:file:" + uploadInfo.file.name + ", fileSize:" + totalSize + ", percent:" + Math.ceil(progress * 100) + "%")
            var progressPercent = Math.ceil(progress * 100)
            $('#sts-progress').text(progressPercent)
            $('#status').text('文件上传中...')

          },
          // 上传凭证超时
          onUploadTokenExpired: function (uploadInfo) {
            // 如果是上传方式二即根据 STSToken 实现时，从新获取STS临时账号用于恢复上传
            // 上传文件过大时可能在上传过程中 sts token 就会失效, 所以需要在 token 过期的回调中调用 resumeUploadWithSTSToken 方法
            // 这里是测试接口, 所以我直接获取了 STSToken
            $('#status').text('文件上传超时!')

            var stsUrl = 'http://demo-vod.cn-shanghai.aliyuncs.com/voddemo/CreateSecurityToken?BusinessType=vodai&TerminalType=pc&DeviceModel=iPhone9,2&UUID=67999yyuuuy&AppVersion=1.0.0'
            $.get(stsUrl, function (data) {
              var info = data.SecurityTokenInfo
              var accessKeyId = info.AccessKeyId
              var accessKeySecret = info.AccessKeySecret
              var secretToken = info.SecurityToken
              var expiration = info.Expiration
              uploader.resumeUploadWithSTSToken(accessKeyId, accessKeySecret, secretToken, expiration)
            }, 'json')
          },
          // 全部文件上传结束
          onUploadEnd: function (uploadInfo) {
            $('#status').text('文件上传完毕!')

            console.log("onUploadEnd: uploaded all the files")
          }
        })
        return uploader
      }

      var uploader = null

      $('#fileUpload').on('change', function (e) {
        var file = e.target.files[0]
        if (!file) {
          alert("请先选择需要上传的文件!")
          return
        }
        var Title = file.name
        var userData = '{"Vod":{}}'
        if (uploader) {
          uploader.stopUpload()
          $('#sts-progress').text('0')
          $('#status').text("")
        }
        uploader = createUploader()
        // 首先调用 uploader.addFile(event.target.files[i], null, null, null, userData)
        // console.log(userData)
        uploader.addFile(file, null, null, null, userData)
        $('#stsUpload').attr('disabled', false)
        $('#pauseUpload').attr('disabled', true)
        $('#resumeUpload').attr('disabled', true)
      })

      $('#stsUpload').on('click', function () {
        // 然后调用 startUpload 方法, 开始上传
        if (uploader !== null) {
          uploader.startUpload()        
          $('#stsUpload').attr('disabled', true)
          $('#pauseUpload').attr('disabled', false)
        }
      })

      $('#pauseUpload').on('click', function () {
        if (uploader !== null) {
          uploader.stopUpload()
          $('#resumeUpload').attr('disabled', false)
          $('#pauseUpload').attr('disabled', true)
        }
      })

      $('#resumeUpload').on('click', function () {
        if (uploader !== null) {
          uploader.startUpload()
          $('#resumeUpload').attr('disabled', true)
          $('#pauseUpload').attr('disabled', false)
        }
      })

    })
  </script>
</body>
</html>