package com.photo_wall.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog_report.model.blogReportService;
import com.blog_report.model.blog_reportVO;
import com.photo_report.model.Photo_reportVO;
import com.photo_report.model.photo_reportService;
import com.photo_wall_like.model.photo_wall_likeService;

@MultipartConfig(maxFileSize = 50 * 1024 * 1024, maxRequestSize = 50 * 50 * 1024 * 1024)

public class Photo_wallServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		String action = req.getParameter("action");

		System.out.println("start");
		
		/*************************** 按讚照片 ********************************/
		if ("collect".equals(action)) {
			System.out.println("有進來喜歡嗎?");
			res.setContentType("text/html;charset=UTF-8");
			PrintWriter out = res.getWriter();
			try {

				/*************************** 1.接收請求參數 ***************************************/

				String photo_No = req.getParameter("photo_No");
				// 這裡要從session取得登入會員的ID
				String mem_Id = req.getParameter("mem_Id");

				/*************************** 2.開始增加喜歡次數 ***************************************/

				photo_wall_likeService photo_wallSvc = new photo_wall_likeService();
				
				int cnt = photo_wallSvc.findByPrimaryKey(mem_Id, photo_No);

				if (cnt == 0) {
					photo_wallSvc.addphoto_wall_like(mem_Id, photo_No);
					out.print(" ");
				} else {
					photo_wallSvc.deletephoto_wall_like(mem_Id, photo_No);
					out.print(" ");
				}

				/*************************** 3.收藏完成，準備轉交(Send the Success view) ***********/

				// 此為AJAX寫法，不用轉交

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				out.print("收藏失敗");
			}
		}
		
		System.out.println("有進來Servlet");
		
		if("reportPhoto".equals(action)) {
		System.out.println("有進來report.Servlet");

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String photo_No = null;
			/*************************** 2.接收請求參數  ***************************************/

			try {
				
			photo_No = req.getParameter("photo_No");	

			String mem_Id = req.getParameter("mem_Id");
		
			String report_Reason = req.getParameter("report_Reason");
				
			Timestamp report_Time = new Timestamp(System.currentTimeMillis());
						
			Integer pho_Rep_Stats = 2;

			
			/*************************** 2.開始新增檢舉資料  ***************************************/
			
			photo_reportService photo_reportSvc = new photo_reportService();
			Photo_reportVO photo_reportVO = photo_reportSvc.findByPrimaryKey(photo_No, mem_Id);
			
			System.out.println(photo_No);
			System.out.println(mem_Id);

			System.out.println("有新增嗎");
			
			if(photo_reportVO!=null) {
				errorMsgs.add("您已檢舉過此篇文章!");
			}else {
				photo_reportSvc.addphotoreport(photo_No, mem_Id,report_Reason,report_Time,pho_Rep_Stats);
				errorMsgs.add("提交檢舉成功!");
				System.out.println("提交檢舉成功!!");
			}

			// 直接轉交 errorMsgs 告知使用者提交成功或失敗
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front_end/photowall/view_photowall.jsp");
				failureView.forward(req, res);
				return;
			}
			
			/*************************** 其他可能的錯誤處理 **********************************/
			} catch(Exception e) {
				errorMsgs.add("檢舉失敗:" + e.getMessage());
				RequestDispatcher failureView = req.
						getRequestDispatcher("/front_end/photowall/photo_wall.jsp");
				failureView.forward(req, res);
			}
		}
		
		

	}
}