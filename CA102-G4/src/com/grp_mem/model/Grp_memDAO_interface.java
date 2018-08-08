package com.grp_mem.model;

import java.util.List;

public interface Grp_memDAO_interface {
	public void insert(Grp_memVO grp_memVO);
	public void update(Grp_memVO grp_memVO);
	public void delete(String grp_Id,String mem_Id);
	public Grp_memVO findByPrimaryKey(String grp_Id,String mem_Id);
	public List<Grp_memVO> getAll() ;


}
