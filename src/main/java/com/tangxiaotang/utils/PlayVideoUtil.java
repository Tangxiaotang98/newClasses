package com.tangyanyan.utils;

import java.util.ArrayList;
import java.util.List;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.vod.model.v20170321.GetPlayInfoRequest;
import com.aliyuncs.vod.model.v20170321.GetPlayInfoResponse;

/**
 * @author 14761
  * 播放视频
 */
public class PlayVideoUtil{
	/*获取播放地址函数*/
	public static GetPlayInfoResponse getPlayInfo(DefaultAcsClient client,String videoId) throws Exception {
	    GetPlayInfoRequest request = new GetPlayInfoRequest();
	    request.setVideoId(videoId);
	    return client.getAcsResponse(request);
	}
	/*播放函数*/
	public static List<String> getPlayUrl(String videoId) {
		 List<String> playUrlList = new ArrayList<String>();
		 DefaultAcsClient client = VideoUploadUtil.initVodClient();
		    GetPlayInfoResponse response = new GetPlayInfoResponse();
		    try {
		        response = getPlayInfo(client,videoId);
		        List<GetPlayInfoResponse.PlayInfo> playInfoList = response.getPlayInfoList();
		        //播放地址
		        for (GetPlayInfoResponse.PlayInfo playInfo : playInfoList) {
		            System.out.print("PlayInfo.PlayURL = " + playInfo.getPlayURL() + "\n");
		            playUrlList.add(playInfo.getPlayURL());
		        }
		        //Base信息
		        System.out.print("VideoBase.Title = " + response.getVideoBase().getTitle() + "\n");
		    } catch (Exception e) {
		        System.out.print("ErrorMessage = " + e.getLocalizedMessage());
		    }
		    System.out.print("RequestId = " + response.getRequestId() + "\n");
		return playUrlList;
	}
}
