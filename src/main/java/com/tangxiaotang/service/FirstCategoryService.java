package com.tangyanyan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tangyanyan.dao.FirstCategoryDao;
import com.tangyanyan.model.FirstCategory;
import com.tangyanyan.model.SecondCategory;
@Service
@Transactional
public class FirstCategoryService {
	@Autowired
    private FirstCategoryDao firstCategoryDao;
	@Autowired
	private SecondCategoryService secondCategoryService;
	//插入一级目录
    public boolean insertFirstCategory(FirstCategory firstCategory) {
    	int column = firstCategoryDao.insertFirstCategory(firstCategory);
    	if(column > 0) {
    		return true;
    	}
    	return false;
    }
    //获取目录列表
    public List<FirstCategory> queryCategory(FirstCategory firstCategory){
    	return firstCategoryDao.queryCategory(firstCategory);
    }
    //根据一级目录id获取一级目录
    public FirstCategory queryCategoryById(int firstId) {
    	return firstCategoryDao.queryCategoryById(firstId);
    }
    //根据id删除项目
    public boolean deleteFirstCategoryById(int firstId) {
    	int column = firstCategoryDao.deleteFirstCategoryById(firstId);
    	if(column > 0) {
    		SecondCategory secondCategory = new SecondCategory();
    		secondCategory.setFirstId(firstId);
    		List<SecondCategory> secondList = secondCategoryService.queryCategory(secondCategory);
    		//删除下面的所有二级课程
    		for (int  i=0; i<secondList.size(); i++) {
				secondCategoryService.deleteSecondById(secondList.get(i).getSecondId());
			}
    		return true;
    	}
    	return false;
    }
    //根据一级目录id更新一级目录信息
	public boolean updateFirstCategory(FirstCategory firstCategory) {
		int column = firstCategoryDao.updateFirstCategory(firstCategory);
    	if(column > 0) {
    		return true;
    	}
		return false;
	}
}
