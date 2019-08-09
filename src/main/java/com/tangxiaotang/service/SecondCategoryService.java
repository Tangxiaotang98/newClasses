package com.tangyanyan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tangyanyan.dao.CourseDao;
import com.tangyanyan.dao.SecondCategoryDao;
import com.tangyanyan.model.Key;
import com.tangyanyan.model.SecondCategory;
@Service
public class SecondCategoryService {
	@Autowired
     private SecondCategoryDao secondCategoryDao;
	@Autowired
	private CourseDao courseDao;
	//插入二级目录
    public boolean insertSecondCategory(SecondCategory secondCategory) {
    	//必须一级目录不为空
    	if(secondCategory.getFirstId() != 0) {
    		int column = secondCategoryDao.insertSecondCategory(secondCategory);
        	if(column > 0) {
        		return true;
        	}
    	}
    	return false;
    }
    //获取目录列表
    public List<SecondCategory> queryCategory(SecondCategory secondCategory){
    	return secondCategoryDao.queryCategory(secondCategory);
    }

	/* //根据一级目录id获取一级目录
	public FirstCategory queryCategoryById(int secondId) {
		return secondCategoryDao.queryCategoryById(secondId);
	}*/
    //根据获取SecondId获取SecondCategory
	public SecondCategory getSecondCategoryBySecondId(int secondId) {
		return secondCategoryDao.getSecondCategroyBySecondId(secondId);
	}
	public boolean deleteSecondById(int secondId) {
		int column = secondCategoryDao.deleteSecondById(secondId);
    	if(column > 0) {
    		courseDao.deleteCourseBySecondId(secondId);
    		return true;
    	}
		return false;
	}
	public boolean updateSecondCategory(SecondCategory secondCategory) {
		int column = secondCategoryDao.updateSecondCategory(secondCategory);
    	if(column > 0) {
    		return true;
    	}
		return false;
	}
	//添加搜索内容
	public void addKey(String courseName) {
		Key queryKey= secondCategoryDao.queryKeyByContent(courseName);
		if(queryKey != null) {
			secondCategoryDao.updateKeyByKeyId(queryKey.getId());
		}else {
			Key key = new Key();
			key.setContent(courseName);
			key.setTime(1);
			secondCategoryDao.insertKey(key);
		}
	}
	public List<Key> getTopKey() {
		return secondCategoryDao.getTopKey();
	}
}
