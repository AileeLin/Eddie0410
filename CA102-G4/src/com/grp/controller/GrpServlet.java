package com.grp.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.blog.model.blogService;
import com.blog.model.blogVO;
import com.blog_tag.model.blogTagService;
import com.grp.model.GrpService;
import com.grp.model.GrpVO;
import com.mem.model.MemberDAO;
import com.mem.model.MemberService;
import com.mem.model.MemberVO;

@MultipartConfig()

public class GrpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
	    res.setContentType("text/html; charset=UTF-8");
	    String action = req.getParameter("action");
	    PrintWriter out = res.getWriter();
	   	HttpSession session = req.getSession();
	
	   	System.out.println("有進來嗎");
	   	
	   	//萬用複合查詢
	   	if ("listEmps_ByCompositeQuery".equals(action)) { // 來自select_page.jsp的複合查詢請求
		   	System.out.println("有進來嗎1");

	   		List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				
				/***************************1.將輸入資料轉為Map**********************************/ 
				//採用Map<String,String[]> getParameterMap()的方法 
				//注意:an immutable java.util.Map 
				//Map<String, String[]> map = req.getParameterMap();
				Map<String, String[]> map = (Map<String, String[]>)session.getAttribute("map");
				if (req.getParameter("whichPage") == null){
					HashMap<String, String[]> map1 = new HashMap<String, String[]>(req.getParameterMap());
					session.setAttribute("map",map1);
					map = map1;
					System.out.println("map1"+map);
				} 
				System.out.println("有在這嗎");
				/***************************2.開始複合查詢***************************************/
				Set list2 = map.keySet();
			    
			    Iterator it = list2.iterator();
			    while(it.hasNext()) {
			     Object tt = it.next();
			     String[] str = map.get(tt);
			     System.out.println(tt+":"+str[0]);
			    }
				
				GrpService grpSvc = new GrpService();

				List<GrpVO> list  = grpSvc.getAll(map);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("listEmps_ByCompositeQuery", list); // 資料庫取出的list物件,存入request
				RequestDispatcher successView = req.getRequestDispatcher("/front_end/grp/grp_getone.jsp"); // 成功轉交listEmps_ByCompositeQuery.jsp
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("123456");
				failureView.forward(req, res);
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
