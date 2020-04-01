package com.sch.dao;

import java.util.List;

import com.sch.model.words;

public interface wordsDao {
	List<words> selectByMedia(int media_id);
	void insertWords(words words);
}
