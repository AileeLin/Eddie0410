package com.mem.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import com.mem.model.*;

	@WebServlet("/front_end/member/active.do")
	public class ActiveServlet extends HttpServlet {
		
		private static final long serialVersionUID = 1L;

		public void doGet(HttpServletRequest req, HttpServletResponse res)
				throws ServletException, IOException {
			doPost(req, res);
			
			
			req.setCharacterEncoding("UTF-8");
		    res.setContentType("text/html; charset=UTF-8");
		}
		
		
		public void doPost(HttpServletRequest req, HttpServletResponse res)
				throws ServletException, IOException {

			req.setCharacterEncoding("UTF-8");
		    res.setContentType("text/html; charset=UTF-8");
		    
			/***************************1.接收請求參數*****************************************/
			String mem_activecode = req.getParameter("mem_activecode");
			System.out.println(mem_activecode);
			MemberVO memberVO = new MemberVO();
			memberVO.setMem_Activecode(mem_activecode);
			
			/***************************2.開始修改資料*****************************************/
			MemberService memberSvc = new MemberService();
			memberVO = memberSvc.activeMem(mem_activecode);
			
			/***************************3.修改完成,準備轉交*************************************/
			String url = "/front_end/member/mem_login.jsp";
			res.sendRedirect(req.getContextPath()+url);
			System.out.println("激活成功");
			
		}

	}

