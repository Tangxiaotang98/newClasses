package com.tangyanyan.action;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.tangyanyan.model.FirstCategory;
import com.tangyanyan.model.MyFile;
import com.tangyanyan.model.SecondCategory;
import com.tangyanyan.model.User;
import com.tangyanyan.model.UserInfor;
import com.tangyanyan.service.FirstCategoryService;
import com.tangyanyan.service.SecondCategoryService;
import com.tangyanyan.service.UserService;
import com.tangyanyan.utils.UploadImageToAliyunUtil;

public class UserAction {
	HttpServletRequest request = ServletActionContext.getRequest(); 
	ActionContext actionContext = ActionContext.getContext();
	@Autowired
	private FirstCategoryService firstCategoryService;
	@Autowired
	private SecondCategoryService secondCategoryService;
	@Autowired
	private UserService userService;
	//用户信息类
	private UserInfor userInfor;
	private Map<String, Object> map = new HashMap<>();
	private User user;// 用户类
	private String newPassword;//新密码
	private MyFile myFile;//文件类，用于上传头像
	public Map<String, Object> getMap() {
		return map;
	}
    
	public UserInfor getUserInfor() {
		return userInfor;
	}
    
	public MyFile getMyFile() {
		return myFile;
	}

	public void setMyFile(MyFile myFile) {
		this.myFile = myFile;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public void setUserInfor(UserInfor userInfor) {
		this.userInfor = userInfor;
	}

	public void setMap(Map<String, Object> map) {
		this.map = map;
	}
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	//注册
    public String register() {
    	System.out.println(user);
    	if(userService.register(user)) {
    		System.out.println("success");
    		return Action.SUCCESS;
    	}else {
    		actionContext.put("errorMsg", "内部错误，注册失败");
    		return Action.INPUT;
    	}
    }
    //登录
    public String login() {
    	HttpSession session = ServletActionContext.getRequest().getSession();
    	User queryUser = userService.login(user);
    	System.out.println(queryUser);
    	if(queryUser != null) {
    		session.setAttribute("cuser", queryUser);
    		if(queryUser .getPrivilege() == 2) {
    			return "adminSuccess";
    		}else {
    			FirstCategory firstCategory = new FirstCategory();
    			List<FirstCategory> firstList = firstCategoryService.queryCategory(firstCategory);
    			List<List<SecondCategory>> list = new ArrayList<List<SecondCategory>>();
    			for(int i=0; i<firstList.size(); i++) {
    				SecondCategory secondCategory = new SecondCategory();
    				secondCategory.setFirstId(firstList.get(i).getFirstId());
    				List<SecondCategory> secondList = secondCategoryService.queryCategory(secondCategory);
    			    list.add(secondList);
    			}
    			request.setAttribute("firstList", firstList);
    			request.setAttribute("list", list);
    			return "userSuccess";
    		}
    	}else {
    		actionContext.put("errorMsg", "账号或密码错误");
    		return Action.INPUT;
    	}
    }
    //验证用户名的唯一性
    public String checkUname() {
    	    System.out.println(user);
			if (userService.checkUname(user.getUserName())) {
				map.put("msg_code", 1);
				map.put("msg", "用户名已注册，请重新输入");
			} else {
				map.put("msg_code", 0);
			}
		return Action.SUCCESS;
	}
    //验证邮箱的唯一性
    public String checkEmail() {
			if (userService.checkMail(user.getMail())) {
				map.put("msg_code", 1);
				map.put("msg", "该邮箱已注册，请重新输入");
			} else {
				map.put("msg_code", 0);
			}
		return Action.SUCCESS;
	}
    //退出登录
    public String layout() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.invalidate();
    	return Action.SUCCESS;
    }
    //跳转到个人中心，设置用户和用户信息
    public String toPersonalCenter() {
        User queryUser = userService.getUserById(user.getUserId());
        UserInfor queryUserInfor = userService.getUserInforByUserId(user.getUserId());
        request.setAttribute("user", queryUser);
        request.setAttribute("userInfor", queryUserInfor);
    	return Action.SUCCESS;
    }
    //修改密码
    public String changePassword() {
    	User queryUser = userService.getUserById(user.getUserId());
    	if(user.getPassword().equals(queryUser.getPassword())) {
    		if(userService.changePasswordByUserId(user.getUserId(),newPassword)) {
    			map.put("msg","修改成功");
    		}else {
    			map.put("msg","修改失败");
    		}
    	}else {
    		map.put("msg","修改失败");
    	}
    	return Action.SUCCESS;
    }
    //上传头像，更新头像
    public String changeImage() {
    	System.out.println(myFile);
    	Date now = new Date();
		String filePath = myFile.getFileFileName();
		// 返回自 1970 年 1 月 1 日 00:00:00 GMT 以来此 Date 对象表示的毫秒数。
		long time = now.getTime();
		// 获取文件后缀名
		int index = filePath.indexOf(".");
		String endString = filePath.substring(index);
		String fileName = time + endString;
		InputStream fisInputStream = null;
		try {
			fisInputStream = new FileInputStream(myFile.getFile());
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String imgId = UploadImageToAliyunUtil.upload(fileName, fisInputStream);
		String src = UploadImageToAliyunUtil.getUrl(imgId, fileName);
		//图片路径
    	userInfor.setImgUrl(src);
		if (userService.updateUserInforByUserId(userInfor)) {
    		map.put("msg","更新成功");
    		map.put("src",src);
    	}else {
    		map.put("msg","更新失败");
    	}
    	return Action.SUCCESS;
    }

    public String updateUserInfor() {
    	if (userService.updateUserInforByUserId(userInfor)) {
    		map.put("msg","更新成功");
    	}else {
    		map.put("msg","更新失败");
    	}
    	return Action.SUCCESS;
    }
    public String toAdminPersonalCenter() {
    	User queryUser = userService.getUserById(user.getUserId());
        UserInfor queryUserInfor = userService.getUserInforByUserId(user.getUserId());
        request.setAttribute("user", queryUser);
        request.setAttribute("userInfor", queryUserInfor);
    	return Action.SUCCESS;
    }
}
