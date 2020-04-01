package com.sch.service;

import java.util.ArrayList;

import com.sch.model.course;
import com.sch.model.user;

public interface courseService {
	ArrayList<course> queryAll();
	void insertCourse(user u);
	void deleteCourse(int uno);
	course queryByNo(int cno);
	course queryByUno(int uno);
}
