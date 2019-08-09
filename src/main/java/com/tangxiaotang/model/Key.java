package com.tangyanyan.model;

/**
 * @author 14761
  * 搜索词汇表
 */
public class Key {
     private int id;//id
     private String content;//内容
     private int time;//次数
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "Key [id=" + id + ", content=" + content + ", time=" + time + "]";
	}
     
}
