package com.grp.model;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import com.mem.model.MemberVO;


public class GrpService {
	private GrpDAO_interface dao;
	
	public GrpService() {
		dao = new GrpDAO();
	}
	
	//新增揪團
	public GrpVO addGrp
	(String grp_Id, String mem_Id,Timestamp grp_Start,Timestamp grp_End
	,Integer grp_Cnt,Integer grp_Acpt,String trip_No,Timestamp trip_Start,Timestamp trip_End
	,String trip_Locale,String trip_Details,byte[] grp_Photo,Integer grp_Status,String chatroom_Id,String grp_Title,String grp_Price) {	
		
		GrpVO grpVO = new GrpVO();
		grpVO.setGrp_Id(grp_Id);
		grpVO.setMem_Id(mem_Id);
		grpVO.setGrp_Start(grp_Start);
		grpVO.setGrp_End(grp_End);
		grpVO.setGrp_Cnt(grp_Cnt);
		grpVO.setGrp_Acpt(grp_Acpt);
		grpVO.setTrip_No(trip_No);
		grpVO.setTrip_Start(trip_Start);
		grpVO.setTrip_End(trip_End);
		grpVO.setTrip_Locale(trip_Locale);
		grpVO.setTrip_Details(trip_Details);
		grpVO.setGrp_Photo(grp_Photo);
		grpVO.setGrp_Status(grp_Status);
		grpVO.setChatroom_Id(chatroom_Id);
		grpVO.setGrp_Title(grp_Title);
		grpVO.setGrp_Price(grp_Price);

		dao.insert(grpVO);

		return grpVO;
	}
	
	//取得所有揪團
	public List<GrpVO> getAll(){
		return dao.getAll();
	}
	
	//用ID取得所有揪團
	public GrpVO findByPrimaryKey(String grp_Id) {
		return dao.findByPrimaryKey(grp_Id);
		}
	
	//萬用複合查詢
	public List<GrpVO> getAll(Map<String, String[]> map) {
		return dao.getAll(map);
	}
	
}
