package com.tangyanyan.model;

/**
 * @author 14761 二级分类
 */
public class ThirdDir {
	private int thirdId;// id
	private String name;// 分类名称
	private String description;// 描述
	private int secondId;//对应的firstId
	
	public int getSecondId() {
		return secondId;
	}

	public void setSecondId(int secondId) {
		this.secondId = secondId;
	}


	public int getThirdId() {
		return thirdId;
	}

	public void setThirdId(int thirdId) {
		this.thirdId = thirdId;
	}

	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "ThirdDir [thirdId=" + thirdId + ", name=" + name + ", description=" + description + ", secondId="
				+ secondId + "]";
	}

	
}
