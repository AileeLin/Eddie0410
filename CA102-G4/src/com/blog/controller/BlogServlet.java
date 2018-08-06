package com.blog.controller;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import com.blog.model.*;
import com.blog_collect.model.*;
import com.blog_tag_name.model.*;
import com.sun.org.apache.xalan.internal.xsltc.compiler.util.ErrorMessages;

@MultipartConfig(maxFileSize = 50 * 1024 * 1024, maxRequestSize = 50 * 50 * 1024 * 1024)

public class BlogServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action"); // 判斷做什麼動作
		String orderby = req.getParameter("orderby"); // 判斷排列方式
		String item = req.getParameter("item"); // 搜尋選單 標題/內容 or 標籤
		String keyword = req.getParameter("keyword"); // 使用者輸入的值
		// if(orderby==null)
		// orderby="recent";

		/*************************** 部落格文章依照發文日期由新到舊排列 ********************************/

		if ("recent".equals(orderby)) { // 選擇依照日期由新至舊排列
			List<String> errorMsgs = new LinkedList<String>(); // 判斷關鍵字是不是搜尋標題/內容
			req.setAttribute("errorMsgs", errorMsgs);

			blogService blogSvc = new blogService();
			try {
				if ("keyword".equals(action) && "content".equals(item)) { // 如果是送keyword值代表按搜尋按鈕

					/*************************** 2.開始查詢資料 *****************************************/

					List<blogVO> list = blogSvc.getAllByKeywordOrderByDate(keyword.trim()); // 把使用者輸入的keyword放到參數中取得list
					if (list.isEmpty()) { // 如果list是空的代表沒有資料
						errorMsgs.add("查無資料");
					}

					if (!errorMsgs.isEmpty()) { // 如果錯誤List不是空的就return，把錯誤資訊轉交到blog.jsp
						RequestDispatcher failureView = req.getRequestDispatcher("/blog");
						failureView.forward(req, res);
						return;
					}

					/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
					req.setAttribute("item", item);
					req.setAttribute("action", action);
					req.setAttribute("orderby", orderby);
					req.setAttribute("keyword", keyword);
					req.setAttribute("list", list); // 將list存到req中
					String url = "/blog";
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res); // 把結果forward到blog.jsp

				} else {
					List<blogVO> list = blogSvc.getAllByNew();

					if (list.isEmpty()) { // 如果list是空的代表沒有資料
						errorMsgs.add("查無資料");
					}

					if (!errorMsgs.isEmpty()) { // 如果錯誤List不是空的就return，把錯誤資訊轉交到blog.jsp
						RequestDispatcher failureView = req.getRequestDispatcher("/blog");
						failureView.forward(req, res);
						return;
					}

					/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
					req.setAttribute("item", item);
					req.setAttribute("action", action);
					req.setAttribute("orderby", orderby);
					req.setAttribute("keyword", keyword);
					req.setAttribute("list", list); // 將list存到req中
					String url = "/blog";
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res); // 把結果forward到blog.jsp
				}

			} catch (Exception e) {
				errorMsgs.add("無法取得資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/blog");
				failureView.forward(req, res);
			}
		}

		/*************************** 部落格文章依照瀏覽數由多至少排列 ********************************/
		if ("popular".equals(orderby)) {
			List<String> errorMsgs = new LinkedList<String>(); // 判斷關鍵字是不是搜尋標題/內容
			req.setAttribute("errorMsgs", errorMsgs);
			blogService blogSvc = new blogService();

			/*************************** 2.開始查詢資料 *****************************************/
			try {
				if ("keyword".equals(action) && "content".equals(item)) { // 如果是送keyword值代表按搜尋按鈕

					/*************************** 2.開始查詢資料 *****************************************/

					List<blogVO> list = blogSvc.getAllByKeywordOrderByViews(keyword.trim()); // 把使用者輸入的keyword放到參數中取得list
					if (list.isEmpty()) { // 如果list是空的代表沒有資料
						errorMsgs.add("查無資料");
					}

					if (!errorMsgs.isEmpty()) { // 如果錯誤List不是空的就return，把錯誤資訊轉交到blog.jsp
						RequestDispatcher failureView = req.getRequestDispatcher("/blog");
						failureView.forward(req, res);
						return;
					}

					/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
					req.setAttribute("item", item);
					req.setAttribute("action", action);
					req.setAttribute("orderby", orderby);
					req.setAttribute("keyword", keyword);
					req.setAttribute("list", list); // 將list存到req中
					String url = "/blog";
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res); // 把結果forward到blog.jsp
				} else {
					List<blogVO> list = blogSvc.getAllByHot();

					if (list.isEmpty()) { // 如果list是空的代表沒有資料
						errorMsgs.add("查無資料");
					}

					if (!errorMsgs.isEmpty()) { // 如果錯誤List不是空的就return，把錯誤資訊轉交到blog.jsp
						RequestDispatcher failureView = req.getRequestDispatcher("/blog");
						failureView.forward(req, res);
						return;
					}

					/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
					req.setAttribute("item", item);
					req.setAttribute("action", action);
					req.setAttribute("orderby", orderby);
					req.setAttribute("keyword", keyword);
					req.setAttribute("list", list); // 將list存到req中
					String url = "/blog";
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res); // 把結果forward到blog.jsp
				}
			} catch (Exception e) {
				errorMsgs.add("無法取得資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/blog");
				failureView.forward(req, res);
			}
		}

		// /*************************** 根據關鍵字搜尋標題和內容，依照瀏覽數由多至少排列
		// **********************************/
		//
		// if ("keyword".equals(action) && "popular".equals(orderby)) { //
		// 如果是送keyword值代表按搜尋按鈕
		// System.out.println(orderby);
		// List<String> errorMsgs = new LinkedList<String>();
		// req.setAttribute("errorMsgs", errorMsgs);
		//
		// String keyword = req.getParameter("keyword"); // 使用者輸入的值
		//
		// try {
		//
		// if ("content".equals(item)) { // 判斷關鍵字是不是搜尋標題/內容
		//
		// /*************************** 2.開始查詢資料
		// *****************************************/
		//
		// blogService blogSvc = new blogService();
		// List<blogVO> list = blogSvc.getAllByKeywordOrderByDate(keyword.trim()); //
		// 把使用者輸入的keyword放到參數中取得list
		//
		// if (list.isEmpty()) { // 如果list是空的代表沒有資料
		// errorMsgs.add("查無資料");
		// }
		//
		// if (!errorMsgs.isEmpty()) { // 如果錯誤List不是空的就return，把錯誤資訊轉交到blog.jsp
		// RequestDispatcher failureView =
		// req.getRequestDispatcher("/front_end/blog_search.jsp");
		// failureView.forward(req, res);
		// return;
		// }
		//
		// /*************************** 3.查詢完成,準備轉交(Send the Success view)
		// *************/
		//
		//// req.setAttribute("list", list); // 將list存到req中
		// String url = "/front_end/blog_search.jsp";
		// RequestDispatcher successView = req.getRequestDispatcher(url);
		// successView.forward(req, res); // 把結果forward到blog.jsp
		// }
		//
		// if ("tag".equals(item)) { // 判斷關鍵字是不是搜尋標籤
		//
		// /*************************** 2.開始查詢資料
		// *****************************************/
		//
		// blogTagNameService blogSvc = new blogTagNameService();
		// List<blog_tag_nameVO> list = blogSvc.getAllBytagClass(keyword); //
		// 把使用者輸入的keyword放到參數中取得list
		//
		// if (list == null) { // 如果list是空的代表沒有資料
		// errorMsgs.add("查無資料");
		// }
		//
		// if (!errorMsgs.isEmpty()) { // 如果錯誤List不是空的就return，把錯誤資訊轉交到blog.jsp
		// RequestDispatcher failureView =
		// req.getRequestDispatcher("/front_end/blog.jsp");
		// failureView.forward(req, res);
		// return;
		// }
		//
		//// /*************************** 3.查詢完成,準備轉交(Send the Success view)
		// *************/
		//
		// req.setAttribute("list", list); // 將list存到req中
		// String url = "/front_end/blog.jsp";
		// RequestDispatcher successView = req.getRequestDispatcher(url);
		// successView.forward(req, res); // 把結果forward到blog.jsp
		// }
		//
		// /*************************** 其他可能的錯誤處理 **********************************/
		//
		// } catch (Exception e) {
		// errorMsgs.add("無法取得資料" + e.getMessage());
		// RequestDispatcher failureView =
		// req.getRequestDispatcher("/front_end/blog.jsp");
		// failureView.forward(req, res);
		// }
		// }

		/*************************** 新增資料 **********************************/
		if ("insert".equals(action)) { // 如果是送insert值代表按新增按鈕
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String blog_title = req.getParameter("title"); // 標題
				String blog_content = req.getParameter("editor1"); // 內容
				java.sql.Date travel_date = null; // 行程日期
				String trip_no = "T000000001"; // 行程編號
				String mem_id = "M000009"; // 會員編號
				Integer blog_views = 0; // 瀏覽次數預設給0
				// 封面照片
				byte[] blog_coverimage = getPictureByteArray(req.getPart("travel_coverimage"));

				try {
					travel_date = java.sql.Date.valueOf(req.getParameter("travel_date").trim()); // 行程日期
				} catch (IllegalArgumentException e) {
					travel_date = new java.sql.Date(System.currentTimeMillis() - 24 * 60 * 60 * 1000L);
					errorMsgs.add("請選擇日期!");
				}

				blogVO blogVO = new blogVO();
				blogVO.setBlog_title(blog_title);
				blogVO.setBlog_content(blog_content);
				blogVO.setTravel_date(travel_date);
				blogVO.setTrip_no(trip_no);
				blogVO.setMem_id(mem_id);
				blogVO.setBlog_views(blog_views);
				blogVO.setBlog_coverimage(blog_coverimage);
				// 如果錯誤List不是空的就return，把錯誤資訊轉交到blog_recent.jsp
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("blogVO", blogVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/blog/blog_add.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/

				blogService blogSvc = new blogService();
				blogVO = blogSvc.addBlog(trip_no, mem_id, blog_title, blog_content, travel_date, blog_views,
						blog_coverimage);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/

				String url = "/blog.index";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/

			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/blog/blog_add.jsp");
				failureView.forward(req, res);
			}
		}

		/*************************** 修改文章的編輯頁面 **********************************/
		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				/*************************** 1.接收請求參數 - 找不到文章的錯誤處理 **********************/

				String blog_id = req.getParameter("blog_id");

				if (blog_id == null || (blog_id.trim()).length() == 0) {
					errorMsgs.add("找不到該文章");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/blog/personal_area_blog.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始查詢資料 *****************************************/

				blogService blogSvc = new blogService();
				blogVO blogVO = blogSvc.findByPrimaryKey(blog_id);
				if (blogVO == null) {
					errorMsgs.add("查無資料");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/blog/personal_area_blog.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/

				req.setAttribute("blogVO", blogVO);
				String url = "/front_end/blog/blog_update.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/blog/personal_area_blog.jsp");
				failureView.forward(req, res);
				return;
			}
		}

		/*************************** 修改文章 **********************************/
		if ("updating".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String blog_PicReg = "^(jpeg|jpg|bmp|png|gif|ico)$"; // 上傳檔案副檔名判斷
				String blog_id = req.getParameter("blog_id"); // blog_id
				String blog_title = req.getParameter("title"); // 標題
				String blog_content = req.getParameter("editor1"); // 內容
				java.sql.Date travel_date = null; // 行程日期
				String trip_no = "T000000001"; // 行程編號
				byte[] blog_coverimage = null; // 封面照片

				try {
					// 行程日期
					travel_date = java.sql.Date.valueOf(req.getParameter("travel_date").trim());
				} catch (IllegalArgumentException e) {
					travel_date = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請選擇日期!");
				}

				Part part = req.getPart("travel_coverimage");

				if (getFileNameFromPart(part) == null) {
					blogService blogSvc = new blogService();
					blogVO blogVO = blogSvc.findByPrimaryKey(blog_id);
					blog_coverimage = blogVO.getBlog_coverimage();
				} else if (!getFileNameFromPart(part).matches(blog_PicReg)) {
					errorMsgs.add("請選擇圖片檔");
				} else {
					blog_coverimage = getPictureByteArray(part);
				}

				blogVO blogVO = new blogVO();
				blogVO.setBlog_title(blog_title);
				blogVO.setBlog_content(blog_content);
				blogVO.setTravel_date(travel_date);
				blogVO.setTrip_no(trip_no);
				blogVO.setBlog_coverimage(blog_coverimage);
				blogVO.setBlog_id(blog_id);

				// 如果錯誤List不是空的就return，把錯誤資訊轉交到blog_update.jsp
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("blogVO", blogVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/front_end/blog/blog_update.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始修改資料 *****************************************/

				blogService blogSvc = new blogService();
				blogVO = blogSvc.updateBlog(trip_no, blog_title, blog_content, travel_date, blog_coverimage, blog_id);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/

				// req.setAttribute("blogVO", blogVO);
				String url = "/front_end/blog/personal_area_blog.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/

			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/blog/blog_update.jsp");
				failureView.forward(req, res);
			}
		}

		/*************************** 修改文章狀態-隱藏 **********************************/
		if ("hide".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				/*************************** 1.接收請求參數 ***************************************/

				String blog_id = req.getParameter("blog_id");

				/*************************** 2.開始隱藏資料 ***************************************/

				blogService blogSvc = new blogService();
				blogSvc.hideBlog(1, blog_id);

				/*************************** 3.隱藏完成,準備轉交(Send the Success view) ***********/

				String url = "/front_end/blog/personal_area_blog.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/

			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front_end/blog/personal_area_blog.jsp");
				failureView.forward(req, res);
			}
		}

		/*************************** 部落格文章依照發文日期由新到舊排列 ********************************/
		if ("article".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				/*************************** 1.接收請求參數 ***************************************/

				String blog_id = req.getParameter("blogID");

				/*************************** 2.開始增加瀏覽次數 ***************************************/

				blogService blogSvc = new blogService();
				blogSvc.updateBlogViews(blog_id);

				/*************************** 3.更新完成，準備轉交(Send the Success view) ***********/

				String url = "/front_end/blog/blog_article.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("找不到該篇文章:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/blog.index");
				failureView.forward(req, res);
			}
		}

		/*************************** 收藏部落格文章 ********************************/
		if ("collect".equals(action)) {
			res.setContentType("text/html;charset=UTF-8");
			PrintWriter out = res.getWriter();
			try {

				/*************************** 1.接收請求參數 ***************************************/

				String blog_id = req.getParameter("blog_id");
				String mem_id = req.getParameter("mem_id");

				/*************************** 2.開始增加收藏 ***************************************/

				blogCollectService blogSvc = new blogCollectService();
				int cnt = blogSvc.findByPrimaryKey(mem_id, blog_id);
				
				if (cnt == 0) {
					blogSvc.addBlogCollect(mem_id, blog_id);
					out.print("收藏成功");
				} else {
					blogSvc.deleteBlogCollect(mem_id, blog_id);
					out.print("取消收藏成功");
				}

				/*************************** 3.收藏完成，準備轉交(Send the Success view) ***********/

			} catch (Exception e) {
				out.print("收藏失敗");
			}
		}
	}

	public String getFileNameFromPart(Part part) {
		String header = part.getHeader("content-disposition");
		// System.out.println("header=" + header); // 測試用
		String filename = new File(header.substring(header.lastIndexOf("=") + 2, header.length() - 1)).getName();
		// System.out.println("filename=" + filename); // 測試用
		// 取出副檔名
		String fnameExt = filename.substring(filename.lastIndexOf(".") + 1, filename.length()).toLowerCase();
		// System.out.println("fnameExt=" + fnameExt); // 測試用
		if (filename.length() == 0) {
			return null;
		}
		return fnameExt;
	}

	// import blob image to database
	public static byte[] getPictureByteArray(Part part) throws IOException {
		InputStream in = part.getInputStream();
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[8192];
		int i;
		while ((i = in.read(buffer)) != -1) {
			baos.write(buffer, 0, i);
		}
		baos.close();
		in.close();

		return baos.toByteArray();
	}
}
