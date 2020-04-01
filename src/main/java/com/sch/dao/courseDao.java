package com.sch.dao;

import java.util.ArrayList;

import com.sch.model.course;
import com.sch.model.user;

public interface courseDao {
	ArrayList<course> queryAll();
	void insertCourse(user u);
	void deleteCourse(int uno);
	course queryByNo(int cno);
	course queryByUno(int uno);
}
