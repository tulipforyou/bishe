package com.sch.dao;

import com.sch.model.media;

public interface mediaDao {
	void insertMedia(media media);
	media selectByName(String name);

	media selectByTitle(String mediaName);
}
