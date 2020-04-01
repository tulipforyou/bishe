package com.sch.service;

import java.util.List;

import com.sch.model.words;

public interface wordsService {
	List<words> selectByMedia(int media_id);
	void insertWords(words words);
}
