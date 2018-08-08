package com.photo_tag.model;

import java.util.List;

public interface Photo_tagDAO_interface {
	public void insert(Photo_tagVO photo_tagVO);
	public void update(Photo_tagVO photo_tagVO);
	public void delete(String photo_Tag_No);
	public Photo_tagVO findByPrimaryKey(String photo_Tag_No);
	public List<Photo_tagVO> getAll() ;
}
