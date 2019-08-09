package com.tangyanyan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tangyanyan.dao.CourseDao;
import com.tangyanyan.model.ThirdDir;
import com.tangyanyan.model.Video;

@Service
public class CourseService {
	@Autowired
	private CourseDao courseDao;

	public List<ThirdDir> showAllCourse(ThirdDir course) {
		return courseDao.showAllCourse(course);
	}

	public boolean addCourse(ThirdDir course) {
		int column = courseDao.addCourse(course);
		if (course.getSecondId() != 0) {
			if (column > 0) {
				return true;
			}
		}
		return false;
	}

	public ThirdDir getCourseById(int thirdId) {
		// TODO Auto-generated method stub
		return courseDao.getCourseById(thirdId);
	}

	public boolean updateCourse(ThirdDir thirdDir) {
		int column = courseDao.updateCourse(thirdDir);
		if (column > 0) {
			return true;
		}
		return false;
	}

	public boolean deleteCourse(int thirdId) {
		int column = courseDao.deleteCourse(thirdId);
		if (column > 0) {
			courseDao.deletVideoByThirdId(thirdId);
			return true;
		}
		return false;
	}

	public boolean addVideo(Video video) {
		int column = courseDao.addVideo(video);
		if(column > 0 ) {
			return true;
		}
		return false;
	}

	public Video getVideoByThirdId(int thirdId) {
		return courseDao.getVideoByThirdId(thirdId);
	}

	public boolean updateVideoByThirdId(int thirdId,Video video) {
		int column = courseDao.updateVideoByThirdId(thirdId,video.getVideoUrl());
		if(column > 0 ) {
			return true;
		}
		return false;
	}
}
