package com.sch.dao;

import java.util.ArrayList;

import com.sch.model.news;

public interface newsDao {
	ArrayList<news> getAllNews();   //获取所有新闻
	void addNews(news ni);       //向数据库添加一条记录
	void deleteNews(String head);         //根据id删除数据库中一条记录
	void updateNews(news ni);    //根据id更新数据库中某条记录
	news getContent(int id);     //根据id获得该条新闻的内容
	ArrayList<news> getByType(String type);

}
