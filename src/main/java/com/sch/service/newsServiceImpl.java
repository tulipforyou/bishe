package com.sch.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sch.dao.newsDao;
import com.sch.model.news;


@Service
public class newsServiceImpl implements newsService{
	@Autowired
	private newsDao dao;

	@Override
	public ArrayList<news> getAllNews() {
		// TODO Auto-generated method stub
		return dao.getAllNews();
	}

	@Override
	public void addNews(news ni) {
		// TODO Auto-generated method stub
	 dao.addNews(ni);
	}

	@Override
	public void deleteNews(String head) {
		// TODO Auto-generated method stub
		 dao.deleteNews(head);
	}

	@Override
	public void updateNews(news ni) {
		// TODO Auto-generated method stub
		 dao.updateNews(ni);
	}

	@Override
	public news getContent(int id) {
		// TODO Auto-generated method stub
		return dao.getContent(id);
	}

	@Override
	public ArrayList<news> getByType(String type) {
		// TODO Auto-generated method stub
		return dao.getByType(type);
	}
	
	
}
