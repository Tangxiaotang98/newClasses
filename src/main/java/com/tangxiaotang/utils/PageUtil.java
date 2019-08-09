package com.tangyanyan.utils;
import java.util.ArrayList;
import java.util.List;

/**
 * @author 14761
  * 分页显示工具类
 */
public class PageUtil {
	public static final int PAGESIZE = 5;//每页显示5条数据
	/**
	 * @param <T>
	 * @param <T>
	 * @param totalList
	 * @return List<Object>
	 * TODO 获取显示列表
	 */
	public static <T> List<T> getShowList(List<T> totalList,int currentPage1){
		List<T> secondCategorieList = new ArrayList<>();
		int currentPage = getCurrentPage(totalList, currentPage1);
		int lastOne = totalList.size();
		if (totalList.size() < currentPage * PAGESIZE) {
			lastOne = totalList.size();
		} else {
			lastOne = currentPage * PAGESIZE;
		}
		for (int i = (currentPage - 1) * PAGESIZE; i < lastOne; i++) {
			T second = (T) totalList.get(i);
			secondCategorieList.add(second);
		}
		return secondCategorieList;
	}
	public static <T> int getCurrentPage(List<T> totalList,int currentPage) {
		int totalPage = getTotalPage(totalList, currentPage);
		// 在总页数之后，总显示总页数
		if (currentPage > totalPage) {
			currentPage = totalPage;
		}
		// 在第一页之前总是显示第一页
		if (currentPage < 1) {
			currentPage = 1;
		}
		return currentPage;
	}
	public static <T> int getTotalPage(List<T> totalList,int currentPage) {
		int total = totalList.size();
		int totalPage = total % PAGESIZE > 0 ? total / PAGESIZE + 1 : total / PAGESIZE;
		return totalPage;
	}

}
