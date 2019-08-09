package com.tangyanyan.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.Action;
import com.tangyanyan.model.FirstCategory;
import com.tangyanyan.model.Key;
import com.tangyanyan.model.SecondCategory;
import com.tangyanyan.service.FirstCategoryService;
import com.tangyanyan.service.SecondCategoryService;

public class ShowAction {
	HttpServletRequest request = ServletActionContext.getRequest(); 
	@Autowired
	private FirstCategoryService firstCategoryService;
	@Autowired
	private SecondCategoryService secondCategoryService;
	private Map<String, Object> map = new HashMap<>();
	private SecondCategory secondCategory;
	
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
	public String toShow() {
    	List<FirstCategory> firstList = new ArrayList<FirstCategory>();
    	FirstCategory firstCategory = new FirstCategory();
    	firstList = firstCategoryService.queryCategory(firstCategory);
    	SecondCategory secondCategory1 = new SecondCategory();
    	//默认设置第一个页面
    	secondCategory1.setFirstId(firstList.get(0).getFirstId());
    	List<SecondCategory> secondList = secondCategoryService.queryCategory(secondCategory1);
    	request.setAttribute("firstList", firstList);
    	request.setAttribute("secondList", secondList);
    	return Action.SUCCESS;
    }
	public String getAllSecondCategoryByFirstId() {
		System.out.println(secondCategory);
		List<SecondCategory> secondList = secondCategoryService.queryCategory(secondCategory);
		map.put("secondList", secondList);
		return Action.SUCCESS;
	}
	public String toIndex() {
		//首页每个一级课程最多显示三个二级课程
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
		return Action.SUCCESS;
	}
	public String toSearch() {
		List<SecondCategory> secondCategoryList = secondCategoryService.queryCategory(secondCategory);
		if(secondCategory.getCourseName() != null && !"".equals(secondCategory.getCourseName())) {
			secondCategoryService.addKey(secondCategory.getCourseName());
		}
		//侧边推荐的设置:显示三门课程
		List<SecondCategory> commendList = getCommentList();
		//二级课程列表的显示
		//管理员的个人中心
		//设置热搜关键词
		List<Key> keyList = secondCategoryService.getTopKey();
		request.setAttribute("secondList", secondCategoryList);
		request.setAttribute("total", secondCategoryList.size());
		request.setAttribute("words", secondCategory.getCourseName());
		request.setAttribute("keyList", keyList);
		request.setAttribute("commendList", commendList);
		return Action.SUCCESS;
	}
	/**
	 * @return List<SecondCategory>
	 * TODO 获取搜索右边推荐课程
	 */
	public List<SecondCategory> getCommentList(){
		SecondCategory secondCategory = new SecondCategory();
		List<SecondCategory> queryCategoryList = secondCategoryService.queryCategory(secondCategory);
		List<SecondCategory> commendCategoryList = new ArrayList<SecondCategory>();
		if(queryCategoryList.size() > 3) {
			for(int i=0; i<3; i++) {
				commendCategoryList.add(queryCategoryList.get(i));
			}
		}else{
			commendCategoryList = queryCategoryList;
		}
		return commendCategoryList;
	}
	
}
