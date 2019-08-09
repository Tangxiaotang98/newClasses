package com.tangyanyan.action;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.Action;
import com.tangyanyan.model.FirstCategory;
import com.tangyanyan.model.MyFile;
import com.tangyanyan.model.SecondCategory;
import com.tangyanyan.service.FirstCategoryService;
import com.tangyanyan.service.SecondCategoryService;
import com.tangyanyan.utils.PageUtil;
import com.tangyanyan.utils.UploadImageToAliyunUtil;

public class SecondCategoryAction {
	private MyFile myFile;
	private Map<String, Object> map = new HashMap<String, Object>();
	HttpServletRequest request = ServletActionContext.getRequest();
	@Autowired
	private SecondCategoryService secondCategoryService;
	@Autowired
	private FirstCategoryService firstCategoryService;
	private SecondCategory secondCategory;
    private int currentPage;//当前页
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public MyFile getMyFile() {
		return myFile;
	}

	public void setMyFile(MyFile myFile) {
		this.myFile = myFile;
	}

	public SecondCategory getSecondCategory() {
		return secondCategory;
	}

	public void setSecondCategory(SecondCategory secondCategory) {
		this.secondCategory = secondCategory;
	}

	public Map<String, Object> getMap() {
		return map;
	}

	public void setMap(Map<String, Object> map) {
		this.map = map;
	}
    //显示所有的二级课程
	public String showAllSecondCategory() {
		List<SecondCategory> secondList = secondCategoryService.queryCategory(secondCategory);
		int totalPage = PageUtil.getTotalPage(secondList, currentPage);
		int currentPage1 = PageUtil.getCurrentPage(secondList, currentPage);
		List<SecondCategory> showList = PageUtil.getShowList(secondList, currentPage);
		request.setAttribute("secondList", showList);
		request.setAttribute("total", secondList.size());
		request.setAttribute("pageSize", PageUtil.PAGESIZE);
		request.setAttribute("currentPage", currentPage1);
		request.setAttribute("totalPage", totalPage);
		return Action.SUCCESS;
	}
    //获取所有的一级课程
	public String getAllFirstCategoryName() {
		FirstCategory firstCategory = new FirstCategory();
		List<FirstCategory> firstList = firstCategoryService.queryCategory(firstCategory);
		request.setAttribute("firstList", firstList);
		return Action.SUCCESS;
	}
    //添加/更新二级课程
	public String addSecondCategory() {
		String imgId = null;
		String src = null;
		System.out.println(secondCategory.getCourseUrl());
		System.out.println(secondCategory.getImgUrl());
		if(secondCategory.getImgUrl() == null ||"".equals(secondCategory.getImgUrl())) {
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
			imgId = UploadImageToAliyunUtil.upload(fileName, fisInputStream);
			src = UploadImageToAliyunUtil.getUrl(imgId, fileName);
			secondCategory.setCourseUrl(imgId);
			secondCategory.setImgUrl(src);
		}
		if (secondCategory.getSecondId() == 0) {
			if (secondCategoryService.insertSecondCategory(secondCategory)) {
				map.put("msg", "ok");
				map.put("message", "添加成功");
			} else {
				map.put("msg", "no");
			}
		}else {
			if (secondCategoryService.updateSecondCategory(secondCategory)) {
				map.put("msg", "ok");
				map.put("message", "更新成功");
			} else {
				map.put("msg", "no");
			}
		}
		return Action.SUCCESS;
	}
    //根据二级课程id获取二级课程
	public String getSecondCategoryById() {
		System.out.println(secondCategory.getSecondId());
		SecondCategory querySecondCategory = secondCategoryService
				.getSecondCategoryBySecondId(secondCategory.getSecondId());
		System.out.println(querySecondCategory);
		request.setAttribute("second", querySecondCategory);
		FirstCategory firstCategory = new FirstCategory();
		List<FirstCategory> firstList = firstCategoryService.queryCategory(firstCategory);
		request.setAttribute("firstList", firstList);
		return Action.SUCCESS;
	}
    //根据二级课程删除二级课程
	public String deleteSecondById() {
		if (secondCategoryService.deleteSecondById(secondCategory.getSecondId())) {
			map.put("msg", "ok");
		} else {
			map.put("msg", "no");
		}
		return Action.SUCCESS;
	}
}
