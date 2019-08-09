package com.tangyanyan.model;

/**
 * @author 14761 用户类
 */
public class User {
	private int userId;// 用户id
	private String userName;//用户名
	private String mail;// 邮箱
	private String password;// 密码
	private int privilege;// 权限，1表示用户，2表示管理员
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getPrivilege() {
		return privilege;
	}

	public void setPrivilege(int privilege) {
		this.privilege = privilege;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", mail=" + mail + ", password=" + password
				+ ", privilege=" + privilege + "]";
	}
}
