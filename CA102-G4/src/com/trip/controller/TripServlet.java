package com.trip.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.trip.model.*;
import com.tripDays.model.*;

public class TripServlet extends HttpServlet {
	
	@Override
	public void init() throws ServletException {
		LinkedHashMap<Integer, String> trip_status = new LinkedHashMap<Integer, String>();
		trip_status.put(0, "刪除");
		trip_status.put(1, "未發表");
		trip_status.put(2, "已發表");
		ServletContext sc = getServletContext();
		sc.setAttribute("trip_status", trip_status);
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);

	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html; charset=Big5");
		req.setCharacterEncoding("UTF-8");

		String action = req.getParameter("action");
		
		if("getOne_For_Display".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("trip_no");
				if(str==null||str.trim().length() ==0) {
					errorMsgs.add("請輸入行程編號");
				}
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/trip/select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				String trip_no = str;
				
				String tripnoReg = "^T{1}[0-9]{9}$";	
				if(!trip_no.trim().matches(tripnoReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("行程編號只能是T開頭加後面9個數字");
	            }
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/trip/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				/***************************2.開始查詢資料*****************************************/
				TripService tripSvc = new TripService();
				TripVO tripVO = tripSvc.getOneTripByPK(trip_no);
				if(tripVO == null) {
					errorMsgs.add("查無資料");
				}
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/trip/select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("tripVO", tripVO);
				RequestDispatcher successView = req.getRequestDispatcher("/trip/listOneTrip.jsp");
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理*************************************/
			}catch(Exception e) {
				errorMsgs.add("無法取得資料:"+e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/trip/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("newTrip".equals(action)) {
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String mem_id = null;
				mem_id = req.getParameter("mem_id");
				System.out.println(mem_id);
				String trip_name = req.getParameter("trip_name");
				if(trip_name==null||trip_name.trim().length()==0) {
					errorMsgs.put("trip_name","行程名稱: 請勿空白");
				}
				
				java.sql.Date trip_startDay = null;
				try {
					if(!(req.getParameter("trip_startDay").trim().length()==0)) {
						trip_startDay = java.sql.Date.valueOf(req.getParameter("trip_startDay").trim());
					}
				}catch(IllegalArgumentException e) {
					trip_startDay = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.put("trip_startDay","請填正確格式");
				}
				
				Integer trip_days = null;
				try {
					trip_days = Integer.parseInt(req.getParameter("trip_days").trim());
				}catch(NumberFormatException e) {
					trip_days = 1;
					errorMsgs.put("trip_days","請輸入行程天數");
				}
				
				TripVO tripVO = new TripVO();
				tripVO.setMem_id(mem_id);
				tripVO.setTrip_name(trip_name);
				tripVO.setTrip_startDay(trip_startDay);
				tripVO.setTrip_days(trip_days);
				tripVO.setTrip_views(0);
				tripVO.setTrip_status(1);

				if(!errorMsgs.isEmpty()) {
					req.setAttribute("tripVO", tripVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/trip/newTrip.jsp");
					failureView.forward(req, res);
					return;
				}
				/***************************2.開始新增資料***************************************/

				List<TripDaysVO> tdList = new ArrayList<>();
				for(int i = 1;i<= trip_days ;i++) {
					if(trip_startDay!=null&&i>1) {
						trip_startDay.setDate(trip_startDay.getDate()+1);
					}
					TripDaysVO tripDaysVO = new TripDaysVO();
					tripDaysVO.setTripDay_days(i);
					tripDaysVO.setTripDay_date(trip_startDay);
					System.out.println(tripDaysVO.getTripDay_date());
					tdList.add(tripDaysVO);
				}
				
				req.setAttribute("tripVO", tripVO);
				req.setAttribute("tdList", tdList);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				RequestDispatcher successView = req.getRequestDispatcher("/front_end/trip/tripEdit.jsp");
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			}catch(Exception e) {
				errorMsgs.put("errorMsgs",e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/trip/newTrip.jsp");
				failureView.forward(req, res);
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
		}
		
		if("getOne_For_Update".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				String trip_no = req.getParameter("trip_no");
				/***************************2.開始查詢資料*****************************************/
				TripService tripSvc = new TripService();
				TripVO tripVO = tripSvc.getOneTripByPK(trip_no);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("tripVO", tripVO);
				RequestDispatcher successView = req.getRequestDispatcher("/trip/update_trip_input.jsp");
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			}catch(Exception e) {
				errorMsgs.add("無法取得要修改的資料"+e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/trip/listAllTrip.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("update".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String trip_no = req.getParameter("trip_no");
				
				String mem_id = req.getParameter("mem_id"); 
				String mem_idReg = "^M{1}[0-9]{6}$";
				if (mem_id == null || mem_id.trim().length() == 0) {
					errorMsgs.add("會員編號: 請勿空白");
				} else if(!mem_id.trim().matches(mem_idReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("會員編號: 會員編號只能是M開頭加後面6個數字");
	            }
				
				String trip_name = req.getParameter("trip_name");
				if(trip_name==null||trip_name.trim().length()==0) {
					errorMsgs.add("行程名稱: 請勿空白");
				}
				
				java.sql.Date trip_startDay = null;
				try {
					if(!(req.getParameter("trip_startDay").trim().length()==0)) {
						trip_startDay = java.sql.Date.valueOf(req.getParameter("trip_startDay").trim());
					}
				}catch(IllegalArgumentException e) {
					trip_startDay = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請選擇日期");
				}
				
				Integer trip_days = null;
				try {
					trip_days = Integer.parseInt(req.getParameter("trip_days").trim());
				}catch(NumberFormatException e) {
					trip_days = 1;
					errorMsgs.add("請輸入行程天數");
				}
				
				Integer trip_views = null;
				try {
					trip_views = Integer.parseInt(req.getParameter("trip_views").trim());
				}catch(NumberFormatException e) {
					trip_views = 0;
					errorMsgs.add("請輸入瀏覽次數");
				}
				
				Integer trip_status = Integer.parseInt(req.getParameter("trip_status"));
				
				TripVO tripVO = new TripVO();
				tripVO.setTrip_no(trip_no);
				tripVO.setMem_id(mem_id);
				tripVO.setTrip_name(trip_name);
				tripVO.setTrip_startDay(trip_startDay);
				tripVO.setTrip_days(trip_days);
				tripVO.setTrip_views(trip_views);
				tripVO.setTrip_status(trip_status);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("tripVO", tripVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/emp/update_emp_input.jsp");
					failureView.forward(req, res);
					return; 
				}
				
				/***************************2.開始修改資料*****************************************/
				TripService tripSvc = new TripService();
				tripVO = tripSvc.updateTrip(trip_no, mem_id, trip_name, trip_startDay, trip_days, trip_views, trip_status);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("tripVO", tripVO);
				RequestDispatcher successView = req.getRequestDispatcher("/trip/listOneTrip.jsp");
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/trip/update_trip_input.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("delete".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/***************************1.接收請求參數***************************************/
				String trip_no = req.getParameter("trip_no");
				/***************************2.開始刪除資料***************************************/
				TripService tripSvc = new TripService();
				tripSvc.deleteTrip(trip_no);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				RequestDispatcher successView = req.getRequestDispatcher("/trip/listAllTrip.jsp");
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/

			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/emp/listAllEmp.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("changeTripName".equals(action)) {
			Map<String,String> errorMsgs = new LinkedHashMap<String,String>();
			
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				
				String trip_name = req.getParameter("trip_name");
//				if(trip_name==null||trip_name.trim().length()==0) {
//					errorMsgs.put("trip_name","行程名稱: 請勿空白");
//				}
				TripVO tripVO = (TripVO)req.getAttribute("tripVO");
				tripVO.setTrip_name(trip_name);
				
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/trip/tripEdit.jsp");
					failureView.forward(req, res);
					return;
				}
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("tripVO", tripVO);
				RequestDispatcher successView = req.getRequestDispatcher("/front_end/trip/tripEdit.jsp");
				successView.forward(req, res);
				/***************************其他可能的錯誤處理**********************************/
			}catch(Exception e) {
				errorMsgs.put("errorMsgs",e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/trip/tripEdit.jsp");
				failureView.forward(req, res);
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
		}
	}
}