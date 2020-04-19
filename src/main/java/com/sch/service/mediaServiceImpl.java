package com.sch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sch.dao.mediaDao;
import com.sch.model.media;

import java.util.List;

@Service
public class mediaServiceImpl implements mediaService{
	@Autowired
	private mediaDao dao;

	@Override
	public void insertMedia(media media) {
		// TODO Auto-generated method stub
		dao.insertMedia(media);
	}

	@Override
	public media selectByName(String name) {
		// TODO Auto-generated method stub
		return dao.selectByName(name);
	}


	@Override
	public media selectByTitle(String mediaName) {
		return dao.selectByTitle(mediaName);
	}

	@Override
	public List<media> findAllTitles() {
		return dao.findAllTitles();
	}
}
