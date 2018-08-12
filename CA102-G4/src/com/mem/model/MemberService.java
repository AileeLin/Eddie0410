package com.mem.model;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.Part;


public class MemberService {

	private MemberDAO_interface dao;

	public MemberService() {
		dao = new MemberDAO();
	}
	
	
	
	//註冊會員
	public MemberVO addMember
	(String mem_Account, String mem_Password,String mem_Name,Integer mem_State,Date mem_Reg_Date,String mem_Activecode,byte[] mem_Photo) {

		MemberVO memberVO = new MemberVO();
		memberVO.setMem_Name(mem_Name);
		memberVO.setMem_Account(mem_Account);
		memberVO.setMem_Password(mem_Password);
		memberVO.setMem_State(mem_State);
		memberVO.setMem_Reg_Date(mem_Reg_Date);
		memberVO.setMem_Activecode(mem_Activecode);
		memberVO.setMem_Photo(mem_Photo);
		
		dao.insert(memberVO);

		return memberVO;
	}

	//預留給 Struts 2 用的
	public void addMember(MemberVO memberVO) {
		dao.insert(memberVO);
	}
	
	
	//更改會員資料
	public MemberVO updateMember(String mem_Id,String mem_Name
			,String mem_Phone,Integer mem_Sex,Date mem_Birthday
			,byte[] mem_Photo
			,String mem_Profile) {
		

		MemberVO memberVO = new MemberVO();
		memberVO.setMem_Id(mem_Id);
		memberVO.setMem_Name(mem_Name);
		memberVO.setMem_Phone(mem_Phone);
		memberVO.setMem_Sex(mem_Sex);
		memberVO.setMem_Birthday(mem_Birthday);
		memberVO.setMem_Photo(mem_Photo);
		memberVO.setMem_Profile(mem_Profile);

		dao.update_Member(memberVO);

		return memberVO;
	}

	//預留給 Struts 2 用的
	public void updateMember(MemberVO MemberVO) {
		dao.update_Member(MemberVO);
	}
	
	
	//更改密碼用
	public MemberVO mem_Update_Password(String mem_Account, String mem_Password){
		
		MemberVO memberVO = new MemberVO();
		
		memberVO.setMem_Account(mem_Account);
		memberVO.setMem_Password(mem_Password);

		dao.Mem_Update_Password(memberVO);
		
		return memberVO;
	}
	
	//更改會員狀態
	public void update_State(String mem_Id,Integer mem_State) {
		dao.update_State(mem_Id, mem_State);
	}
	
	//管理員查詢會員用
	public List<MemberVO> getAll_member(String mem_Name){
		return dao.getAll_member(mem_Name);
	}
	
	//以下都是目前還沒用到
	public MemberVO findByPrimaryKey(String mem_Id){
			
//			MemberVO memberVO = new MemberVO();
//			
//			memberVO.setMem_Id(mem_Id);
	
			
			
			return dao.findByPrimaryKey(mem_Id);
		}

	public void deleteMember(String mem_Id) {
		dao.delete(mem_Id);
	}

	public MemberVO getOneMember(String mem_Id) {
		return dao.findByPrimaryKey(mem_Id);
	}

	public List<MemberVO> getAll() {
		return dao.getAll();
	}



	public MemberVO activeMem(String mem_activecode) {
		// TODO Auto-generated method stub
		return null;
	}
	
}

