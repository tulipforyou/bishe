package com.sch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sch.dao.wordsDao;
import com.sch.model.words;
@Service
public class wordsServiceImpl implements wordsService{
	
	@Autowired
	private wordsDao dao;
	
	

	@Override
	public void insertWords(words words) {
		// TODO Auto-generated method stub
		dao.insertWords(words);
	}



	@Override
	public List<words> selectByMedia(int media_id) {
		// TODO Auto-generated method stub
		return dao.selectByMedia(media_id);
	}

}
