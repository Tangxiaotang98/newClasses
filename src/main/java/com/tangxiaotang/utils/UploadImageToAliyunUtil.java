package com.tangyanyan.utils;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.ObjectMetadata;
import com.aliyun.oss.model.PutObjectResult;

@SuppressWarnings("deprecation")
public class UploadImageToAliyunUtil{
    private static String endpoint = AliyunConfig.endpoint;
    private static String accessKeyId = AliyunConfig.accessKeyId;
    private static String accessKeySecret = AliyunConfig.accessKeySecret;
    private static String bucketName = AliyunConfig.bucketName;
    private static OSSClient ossClientStatic;

    static {
        ossClientStatic = new OSSClient(endpoint, accessKeyId, accessKeySecret);
    }

    /**
     * 上传到OSS服务器 如果同名文件会覆盖服务器上的
     * @param fileName 文件名称 包括后缀名
     * @param instream 文件流
     * @return 出错返回"" ,唯一MD5数字签名
     */
    public static String upload(String fileName, InputStream instream) {
        String resultStr = "";
        try {

            // 创建上传Object的Metadata
            ObjectMetadata objectMetadata = new ObjectMetadata();
//            objectMetadata.setContentLength(instream.available());
//            objectMetadata.setCacheControl("no-cache");
//            objectMetadata.setHeader("Pragma", "no-cache");
//            objectMetadata.setContentType(getContentType(fileName.substring(fileName.lastIndexOf("."))));
//            objectMetadata.setContentDisposition("inline;filename=" + fileName);

            // 上传文件 (上传文件流的形式)
            PutObjectResult putResult = ossClientStatic.putObject(bucketName, fileName, instream, objectMetadata);
            // 解析结果
            resultStr = putResult.getETag();
            } catch (Exception e) {
            e.printStackTrace();

        } finally {
            try {
                if (instream != null) {
                    instream.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return resultStr;
    }

    /**
     * 上传图片
     *
     * @param url
     */
    public static void uploadUrl(String fileName, String url) {
        try {
            InputStream instream = new URL(url).openStream();
            upload(fileName, instream);
        } catch (Exception e) {
            e.printStackTrace();

        } finally {

        }
    }

    /**
     * 获得url链接
     *
     * @param key
     * @return
     */
    public static String getUrl(String key, String option) {
		/* if (StringUtil.isBlank(key))
		    return "";*/
    	if(key.equals("") ||key == null) {
    		return "";
    	}
        return "http://" + bucketName + "." + endpoint + "/" + option;

    }

    public static String getBaseUrl() {
        return "http://" + bucketName + "." + endpoint + "/";
    }
}