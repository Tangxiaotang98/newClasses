package com.tangyanyan.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.Action;
import com.tangyanyan.model.FirstCategory;
import com.tangyanyan.service.FirstCategoryService;
import com.tangyanyan.utils.PageUtil;

public class FirstCategoryAction {
	private Map<String, Object> map = new HashMap<String, Object>();
	HttpServletRequest request = ServletActionContext.getRequest(); 
	@Autowired
	private FirstCategoryService firstCategoryService;
	private FirstCategory firstCategory;
    private int currentPage;
    
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public FirstCategory getFirstCategory() {
        return firstCategory;
	}

	public void setFirstCategory(FirstCategory firstCategory) {
		this.firstCategory = firstCategory;
	}
    
	public Map<String, Object> getMap() {
		return map;
	}

	public void setMap(Map<String, Object> map) {
		this.map = map;
	}

	public String showAllFirstCategory() {
		List<FirstCategory> firstList = firstCategoryService.queryCategory(firstCategory);
		int totalPage = PageUtil.getTotalPage(firstList, currentPage);
		int currentPage1 = PageUtil.getCurrentPage(firstList, currentPage);
		List<FirstCategory> showList = PageUtil.getShowList(firstList, currentPage);
		request.setAttribute("firstList", showList);
		request.setAttribute("total", firstList.size());
		request.setAttribute("pageSize", PageUtil.PAGESIZE);
		request.setAttribute("currentPage", currentPage1);
		request.setAttribute("totalPage", totalPage);
		return Action.SUCCESS;
	}
	public String addFirstCategory() {
		System.out.println(firstCategory);
		if(firstCategory.getFirstId() == 0 ) {
			if(firstCategoryService.insertFirstCategory(firstCategory)) {
				map.put("msg", "添加成功");
			}else {
				map.put("msg", "no");
			}
		}else {
			if(firstCategoryService.updateFirstCategory(firstCategory)) {
				map.put("msg", "更新成功");
			}else {
				map.put("msg", "no");
			}
		}
		return Action.SUCCESS;
	}
	public String deleteFirstCategory() {
		if(firstCategoryService.deleteFirstCategoryById(firstCategory.getFirstId())) {
			map.put("msg", "ok");
		}else {
			map.put("msg", "no");
		}
		return Action.SUCCESS;
	}
	public String getFirstCategoryById() {
		FirstCategory queryFirstCategory = firstCategoryService.queryCategoryById(firstCategory.getFirstId());
		request.setAttribute("first", queryFirstCategory);
		return Action.SUCCESS;
	}
}
