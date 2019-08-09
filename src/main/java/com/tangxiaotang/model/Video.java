package com.tangyanyan.model;

/**
 * @author 14761 视频
 */
public class Video {
	private int id;// 视频id
	private String videoUrl;// 视频播放地址
	private String videoId;// 阿里云上的视频id
	private int thirdId;// 对应的课程id
	private String videoDesc;//视频描述

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getVideoUrl() {
		return videoUrl;
	}

	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}

	public String getVideoId() {
		return videoId;
	}

	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}

	public int getThirdId() {
		return thirdId;
	}

	public void setThirdId(int thirdId) {
		this.thirdId = thirdId;
	}

	public String getVideoDesc() {
		return videoDesc;
	}

	public void setVideoDesc(String videoDesc) {
		this.videoDesc = videoDesc;
	}

	@Override
	public String toString() {
		return "Video [id=" + id + ", videoUrl=" + videoUrl + ", videoId=" + videoId + ", thirdId=" + thirdId
				+ ", videoDesc=" + videoDesc + "]";
	}
	

}
