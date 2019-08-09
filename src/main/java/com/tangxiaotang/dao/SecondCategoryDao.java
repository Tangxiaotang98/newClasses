package com.tangyanyan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.tangyanyan.model.Key;
import com.tangyanyan.model.SecondCategory;
@Repository
@Mapper
public interface SecondCategoryDao {

	public int insertSecondCategory(SecondCategory secondCategory);

	public List<SecondCategory> queryCategory(SecondCategory secondCategory);
	/*	public FirstCategory queryCategoryById(int secondId);
	*/
	//根据二级课程id获取二级课程
	public SecondCategory getSecondCategroyBySecondId(int secondId);
	//根据二级课程id删除二级课程
	public int deleteSecondById(int secondId);
    //更新二级目录
	public int updateSecondCategory(SecondCategory secondCategory);
    //根据搜索内容获取key
	public Key queryKeyByContent(String courseName);
    //根据id更新key
	public void updateKeyByKeyId(int id);
    //插入key
	public void insertKey(Key key);

	public List<Key> getTopKey();

}
