package com.sch.dao;

import com.sch.model.media;

import java.util.List;

public interface mediaDao {
	void insertMedia(media media);
	media selectByName(String name);

	media selectByTitle(String mediaName);

    List<com.sch.model.media> findAllTitles();
}
