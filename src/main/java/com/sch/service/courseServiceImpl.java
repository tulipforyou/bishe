package com.sch.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sch.dao.courseDao;
import com.sch.model.course;
import com.sch.model.user;

@Service
public class courseServiceImpl implements courseService {
	
	@Autowired
	private courseDao cdao;
	
	
	@Override
	public ArrayList<course> queryAll() {
		// TODO Auto-generated method stub
		return cdao.queryAll();
	}

	@Override
	public void insertCourse(user u) {
		// TODO Auto-generated method stub
		cdao.insertCourse(u);
		
	}

	@Override
	public void deleteCourse(int uno) {
		// TODO Auto-generated method stub
		cdao.deleteCourse(uno);
		
	}

	@Override
	public course queryByNo(int cno) {
		// TODO Auto-generated method stub
		return cdao.queryByNo(cno);
	}

	@Override
	public course queryByUno(int uno) {
		// TODO Auto-generated method stub
		return cdao.queryByUno(uno);
	}
	
}
