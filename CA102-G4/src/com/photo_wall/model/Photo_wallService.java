package com.photo_wall.model;

import java.util.List;

public class Photo_wallService {
	
	private Photo_wallDAO_interface dao;
	
	public Photo_wallService() {
		dao = new Photo_wallDAO();
	}
	
	//照片牆顯示所有會員的照片
	
	public List<Photo_wallVO> getAll() {
		return dao.getAll();
		}
	
	public void update_State(String mem_Id,String photo_No,Integer mem_State) {
		dao.update_State(mem_Id,photo_No,mem_State);
	}
	
	public Photo_wallVO findByPrimaryKey(String photo_No) {
		return dao.findByPrimaryKey(photo_No);
	}
	
	}
