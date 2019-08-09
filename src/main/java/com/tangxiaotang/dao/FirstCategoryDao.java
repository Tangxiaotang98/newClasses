package com.tangyanyan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.tangyanyan.model.FirstCategory;

@Repository
@Mapper
public interface FirstCategoryDao {
	//插入一级目录
    public int insertFirstCategory(FirstCategory firstCategory);
    //获取目录列表
    public List<FirstCategory> queryCategory(FirstCategory firstCategory);
    //根据一级目录id获取一级目录
    public FirstCategory queryCategoryById(int firstId);
    //删除一级目录
    public int deleteFirstCategoryById(int firstId);
    //更新一级目录
	public int updateFirstCategory(FirstCategory firstCategory);
}
