package com.grp.model;

import java.util.List;
import java.util.Map;

public interface GrpDAO_interface {
	public void insert(GrpVO grpVO);
	public void update(GrpVO grpVO);
	public void delete(String grp_Id);
	public GrpVO findByPrimaryKey(String grp_Id);
	public List<GrpVO> getAll();
	
	//萬用複合查詢(傳入參數型態Map)(回傳 List)
    public List<GrpVO> getAll(Map<String, String[]> map);

}
