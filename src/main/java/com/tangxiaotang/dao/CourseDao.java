package com.tangyanyan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.tangyanyan.model.ThirdDir;
import com.tangyanyan.model.Video;

@Repository
@Mapper
public interface CourseDao {
    //获取所有course
	public List<ThirdDir> showAllCourse(ThirdDir course);
	//插入course
	public int addCourse(ThirdDir course);
	//根据id获取course
	public ThirdDir getCourseById(int thirdId);
	//更新course
	public int updateCourse(ThirdDir thirdDir);
	//删除course
	public int deleteCourse(int thirdId);
	//添加图片
	public int addVideo(Video video);
	//根据二级课程id删除课程
	public int deleteCourseBySecondId(int secondId);
	//根据thirdId获取Video
	public Video getVideoByThirdId(int thirdId);
	//根据thirdId根据视频播放地址
	public int updateVideoByThirdId(@Param("thirdId")int thirdId, @Param("videoUrl")String videoUrl);
	//删除三级课程时，删除它下面的视频
	public void deletVideoByThirdId(int thirdId);
}
