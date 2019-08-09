package com.tangyanyan.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.tangyanyan.model.User;
import com.tangyanyan.model.UserInfor;

@Repository
@Mapper
public interface UserDao {
    //注册
	public int register(User user);
    //验证用户名的唯一性
	public User checkUname(String userName);
    //验证邮箱的唯一性
	public User checkMail(String mail);
	//登录(可用用户名或邮箱加密码登录)
	public User login(User user);
	//根据用户id获取用户
	public User getUserById(int userId);
	//插入用户信息表
	public int insertUserInfor(UserInfor userInfor);
	//获取用户信息表
	public UserInfor getUserInforByUserId(int userId);
	//修改密码
	public int changePasswordByUserId(@Param("userId")int userId,@Param("newPassword")String newPassword);

	/*//根据用户id更改头像
	public int changeImageByUserId(UserInfor userInfor);
	//更新性别根据用户id
	public int updateSexByUserId(UserInfor userInfor);*/
	//修改用用户信息
	public int updateUserInforByUserId(UserInfor userInfor);

}
