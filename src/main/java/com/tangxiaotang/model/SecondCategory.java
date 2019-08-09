package com.tangyanyan.model;

/**
 * @author 14761
 * 二级课程表
 */
public class SecondCategory {
  private int secondId;//课程id
  private String courseName;//课程名称
  private String courseUrl;//课程地址
  private String imgUrl;//图片地址
  private String teacherName;//授课老师id
  private String courseType;//课程类型
  private int firstId;// 一级目录id
  private int userId;//创建者id
  private String description;//描述
  private String status;//阶段
	public int getFirstId() {
	return firstId;
}

public void setFirstId(int firstId) {
	this.firstId = firstId;
}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getCourseUrl() {
		return courseUrl;
	}

	public void setCourseUrl(String courseUrl) {
		this.courseUrl = courseUrl;
	}
    
	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getCourseType() {
		return courseType;
	}

	public void setCourseType(String courseType) {
		this.courseType = courseType;
	}

	public int getSecondId() {
		return secondId;
	}

	public void setSecondId(int secondId) {
		this.secondId = secondId;
	}
    
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
    
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "SecondCategory [secondId=" + secondId + ", courseName=" + courseName + ", courseUrl=" + courseUrl
				+ ", imgUrl=" + imgUrl + ", teacherName=" + teacherName + ", courseType=" + courseType + ", firstId="
				+ firstId + ", userId=" + userId + ", description=" + description + ", status=" + status + "]";
	}
	
}
