package com.tangyanyan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tangyanyan.dao.UserDao;
import com.tangyanyan.model.User;
import com.tangyanyan.model.UserInfor;
@Service
public class UserService {
	@Autowired
     private UserDao userDao;
     public boolean register(User user) {
    	 //生成用户信息表
    	int column = userDao.register(user);
    	System.out.println(user);
    	 if(column > 0) {
    		 UserInfor userInfor= new UserInfor();
    		 userInfor.setUserId(user.getUserId());
    		 int column1 = userDao.insertUserInfor(userInfor);
    		 if(column1 > 0) {
    			 return true;
    		 }
    	 }
    	 return false;
     }
	public boolean checkUname(String userName) {
		User user = userDao.checkUname(userName);
		if(user != null) {
			return true;
		}
		return false;
	}
	public boolean checkMail(String mail) {
		User user = userDao.checkMail(mail);
		if(user != null) {
			return true;
		}
		return false;
	}
	public User login(User user) {
		
		return userDao.login(user);
	}
	public User getUserById(int userId) {
		return userDao.getUserById(userId);
	}
	public UserInfor getUserInforByUserId(int userId) {
		return userDao.getUserInforByUserId(userId);
	}
	public boolean changePasswordByUserId(int userId,String newPassword) {
		int column = userDao.changePasswordByUserId(userId,newPassword);
		if(column > 0) {
			return true;
		}
		return false;
	}

	/*	public boolean changeImage(UserInfor userInfor) {
			int column = userDao.changeImageByUserId(userInfor);
			if(column > 0) {
				return true;
			}
			return false;
		}
		public boolean updateSexByUserId(UserInfor userInfor) {
			int column = userDao.updateSexByUserId(userInfor);
			if(column > 0) {
				return true;
			}
			return false;
		}*/
	public boolean updateUserInforByUserId(UserInfor userInfor) {
		int column = userDao.updateUserInforByUserId(userInfor);
		if(column > 0) {
			return true;
		}
		return false;
	}
}
