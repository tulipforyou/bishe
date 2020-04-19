package com.sch.service;

import com.sch.model.media;

import java.util.List;

public interface mediaService {
	void insertMedia(media media);
	media selectByName(String name);
	media selectByTitle(String mediaName);

    List<media> findAllTitles();
}
