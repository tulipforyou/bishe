package com.sch.service;

import java.util.ArrayList;

import com.sch.model.news;

public interface newsService {
	ArrayList<news> getAllNews();
	void addNews(news ni);
	void deleteNews(String head);
	void updateNews(news ni);
	news getContent(int id);
	ArrayList<news> getByType(String type);
}
