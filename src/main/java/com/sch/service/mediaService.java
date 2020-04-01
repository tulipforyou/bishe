package com.sch.service;

import com.sch.model.media;

public interface mediaService {
	void insertMedia(media media);
	media selectByName(String name);
	media selectByTitle(String mediaName);
}
