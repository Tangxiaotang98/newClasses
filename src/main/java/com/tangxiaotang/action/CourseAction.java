package com.tangyanyan.action;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.Action;
import com.tangyanyan.model.MyFile;
import com.tangyanyan.model.SecondCategory;
import com.tangyanyan.model.ThirdDir;
import com.tangyanyan.model.Video;
import com.tangyanyan.service.CourseService;
import com.tangyanyan.service.SecondCategoryService;
import com.tangyanyan.utils.PageUtil;
import com.tangyanyan.utils.PlayVideoUtil;
import com.tangyanyan.utils.VideoUploadUtil;

public class CourseAction {
	private MyFile myFile;
	private Map<String, Object> map = new HashMap<String, Object>();
	HttpServletRequest request = ServletActionContext.getRequest(); 
	private ThirdDir thirdDir;
	private Video video;
	private int currentPage;
	@Autowired
	private CourseService courseService;
	@Autowired
	private SecondCategoryService secondCategoryService;
	public Map<String, Object> getMap() {
		return map;
	}
	public void setMap(Map<String, Object> map) {
		this.map = map;
	}
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
	public Video getVideo() {
		return video;
	}
	public void setVideo(Video video) {
		this.video = video;
	}
	public ThirdDir getThirdDir() {
		return thirdDir;
	}
	public void setThirdDir(ThirdDir thirdDir) {
		this.thirdDir = thirdDir;
	}
	//显示所有课程
	public String showAllCourse() {
		List<ThirdDir> courseList = courseService.showAllCourse(thirdDir);
		int totalPage = PageUtil.getTotalPage(courseList, currentPage);
		int currentPage1 = PageUtil.getCurrentPage(courseList, currentPage);
		List<ThirdDir> showList = PageUtil.getShowList(courseList, currentPage);
		request.setAttribute("courseList", showList);
		request.setAttribute("total", courseList.size());
		request.setAttribute("pageSize", PageUtil.PAGESIZE);
		request.setAttribute("currentPage", currentPage1);
		request.setAttribute("totalPage", totalPage);
		return Action.SUCCESS;
	}
	//显示所有二级课程
	public String getAllSecondCategory() {
		SecondCategory secondCategory = new SecondCategory();
		List<SecondCategory> secondList = secondCategoryService.queryCategory(secondCategory);
		request.setAttribute("secondList", secondList);
		return Action.SUCCESS;
	}
	//添加课程
	public String addCourse() {
	     System.out.println(thirdDir);
	     if(thirdDir.getThirdId() != 0) {
	    	 if(courseService.updateCourse(thirdDir)) {
	    		 map.put("msg", "ok");
	    		 map.put("message", "更新成功");
	    	 }else {
	    		 map.put("msg", "no");
	    		 map.put("message", "更新失败");
	    	 }
	     }else {
	    	 if(courseService.addCourse(thirdDir)) {
	 			map.put("msg", "ok");
	 			 map.put("message", "添加成功");
	 		}else {
	 			map.put("msg", "no");
	 			 map.put("message", "添加失败");
	 		}
	     }
		return Action.SUCCESS;
	}
	//根据课程id获取课程
	public String getCourseById() {
		ThirdDir thirdDir1  = courseService.getCourseById(thirdDir.getThirdId());
		if(thirdDir1 != null) {
			map.put("course", thirdDir1);
			SecondCategory secondCategory = new SecondCategory();
			List<SecondCategory> secondList = secondCategoryService.queryCategory(secondCategory);
			map.put("secondList", secondList);
		}
		return Action.SUCCESS;
	}
	//删除课程
	public String deleteCourse() {
		 //要判断删除课程中是否有视频，有视频的话要把视频也删掉
		 if(courseService.deleteCourse(thirdDir.getThirdId())) {
	 			map.put("msg", "ok");
	 		}else {
	 			map.put("msg", "no");
	 		}
		return Action.SUCCESS;
	}
	//跳转到视频上传界面
	public String toUploadVideo() {
		List<ThirdDir> totalCourseList = courseService.showAllCourse(thirdDir);
		//添加所有未上传视频的三级课程
		List<ThirdDir> courseList = new ArrayList<ThirdDir>();
		for (ThirdDir thirdDir1 : totalCourseList) {
			Video video = courseService.getVideoByThirdId(thirdDir1.getThirdId());
			if(video == null) {
				courseList.add(thirdDir1);
			}
		}
		request.setAttribute("courseList", courseList);
		return Action.SUCCESS;
	}
	public String uploadVideo() throws Exception {
		String title= video.getVideoDesc();
		InputStream fisInputStream = null;
		try {
			fisInputStream = new FileInputStream(myFile.getFile());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		//VideoUploadUtil.initVodClient();
		Map<String,Object> videoMap  = VideoUploadUtil.uploadVideoByStream(title, myFile.getFileFileName(), fisInputStream);
		//输出videoMap
		for (String videoMapKey : videoMap.keySet()) {
			System.out.println("key:"+videoMapKey+"value:"+videoMap.get(videoMapKey));
		}
		//判断videoMap中的VideoId是否为空,不为空则上传视频成功
		if(videoMap.get("VideoId") != null) {
			//设置videoId
		    video.setVideoId((String)videoMap.get("VideoId"));
		     //获取播放路径
		    List<String> playUrlList = PlayVideoUtil.getPlayUrl((String)videoMap.get("VideoId"));
		    System.out.println("start");
		    for (String string : playUrlList) {
				System.out.println(string);
			}
		    System.out.println("end");
		    //设置播放地址
		    video.setVideoUrl(playUrlList.get(0));
		    if(courseService.addVideo(video)) {
		    	map.put("msg", "ok");
		    }else {
		    	map.put("msg", "no");
		    }
		}
		return Action.SUCCESS;
	}
	public String toShowCourse() {
		System.out.println(thirdDir);
		List<ThirdDir> courseList = courseService.showAllCourse(thirdDir);
		SecondCategory secondCategory = secondCategoryService.getSecondCategoryBySecondId(thirdDir.getSecondId());
		request.setAttribute("courseList", courseList);
		request.setAttribute("totalDir", courseList.size());
		request.setAttribute("second", secondCategory);
		return Action.SUCCESS;
	}
	public String playVideo() {
		System.out.println(thirdDir);
		//获取video
		Video queryVideo = courseService.getVideoByThirdId(thirdDir.getThirdId());
		if(queryVideo != null) {
			ThirdDir querythirdDir = courseService.getCourseById(thirdDir.getThirdId());
			//根据videoId获取播放路径
			List<String> videoUrl = PlayVideoUtil.getPlayUrl(queryVideo.getVideoId());
			//设置播放路径
			queryVideo.setVideoUrl(videoUrl.get(0));
			//更新播放路径
			courseService.updateVideoByThirdId(queryVideo.getThirdId(),queryVideo);
			request.setAttribute("video", queryVideo);
			request.setAttribute("third", querythirdDir);
		}else {
			System.out.println("参数错误");
		}
		
		return Action.SUCCESS;
	}
}
