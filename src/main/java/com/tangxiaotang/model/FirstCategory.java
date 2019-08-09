package com.tangyanyan.model;

/**
 * @author 14761 二级分类
 */
public class FirstCategory {
	private int firstId;// id
	private String name;// 分类名称
	private String description;// 描述

	public int getFirstId() {
		return firstId;
	}

	public void setFirstId(int firstId) {
		this.firstId = firstId;
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
		return "FirstCategory [firstId=" + firstId + ", name=" + name + ", description=" + description + "]";
	}

	
	
}
