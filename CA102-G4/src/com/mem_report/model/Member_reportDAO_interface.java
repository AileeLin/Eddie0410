package com.mem_report.model;

import java.util.List;

import com.mem.model.MemberVO;

public interface Member_reportDAO_interface {
	public void insert(Member_reportVO member_reportVO);
	public void update(Member_reportVO member_reportVO);
	public void delete(String mem_Id_Report,String mem_Id_Reported);
	public Member_reportVO findByPrimaryKey(String mem_Id_Report,String mem_Id_Reported) ;
	public List<Member_reportVO> getAll() ;
	

}
