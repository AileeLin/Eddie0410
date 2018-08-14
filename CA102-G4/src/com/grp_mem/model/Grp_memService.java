package com.grp_mem.model;

import com.photo_wall_like.model.photo_wall_likeVO;

public class Grp_memService {
	private Grp_memDAO_interface dao;
	
	public Grp_memService() {
		dao = new Grp_memDAO();
	}
	
	//新增揪團參加者
	public Grp_memVO insert(String grp_Id,String mem_Id,String grp_Leader) {
		
		Grp_memVO grp_memVO = new Grp_memVO();
		grp_memVO.setGrp_Id(grp_Id);
		grp_memVO.setMem_Id(mem_Id);
		grp_memVO.setGrp_Leader(grp_Leader);
		
		dao.insert(grp_memVO);
		
		return grp_memVO;

	}
	
	//更新揪團
		public Grp_memVO update(String grp_Id, String mem_Id, String grp_Leader) {
			
			Grp_memVO grp_memVO = new Grp_memVO();

			grp_memVO.setGrp_Id(grp_Id);
			grp_memVO.setMem_Id(mem_Id);
			grp_memVO.setGrp_Leader(grp_Leader);

			dao.update(grp_memVO);
			return grp_memVO;
		}
	
	//參加揪團
	public Grp_memVO joingrp(String grp_Id, String mem_Id, String grp_Leader) {
		
		Grp_memVO grp_memVO = new Grp_memVO();

		grp_memVO.setGrp_Id(grp_Id);
		grp_memVO.setMem_Id(mem_Id);
		grp_memVO.setGrp_Leader(grp_Leader);

		dao.insert(grp_memVO);
		return grp_memVO;
	}
	
	//取消參加的揪團
	
	public void delete(String grp_Id, String mem_Id) {
			
			dao.delete(grp_Id,mem_Id);
	
		}
		
	//用最一剛開始的FINDBYPK找VO
	public Grp_memVO findByPrimaryKey(String grp_Id, String mem_Id) {
		Grp_memVO grp_memVO = new Grp_memVO();
		
		grp_memVO.setGrp_Id(grp_Id);
		grp_memVO.setMem_Id(mem_Id);
		
		Grp_memVO cnt = dao.findByPrimaryKey(grp_Id,mem_Id);
		
		return cnt;
	}
	
	public void update_State(String grp_Id, String mem_Id, String grp_Leader) {
		dao.update_State(grp_Id,mem_Id,grp_Leader);
	}

}
