package com.photo_tag_list.model;

import java.util.List;

public interface Photo_tag_listDAO_interface {
	//用照片標籤編號找照片(編號)
	public List<Photo_tag_listVO> getAll_Photo_No(String photo_Tag_No) ;

	
	public void insert(Photo_tag_listVO photo_tag_listVO);
	public void delete(String photo_Tag_No);
	public Photo_tag_listVO findByPrimaryKey(String photo_Tag_No,String photo_No);	
	public List<Photo_tag_listVO> getAll() ;


}
