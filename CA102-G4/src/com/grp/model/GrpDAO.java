package com.grp.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.mem.model.MemberVO;
import com.tools.jdbcUtil_CompositeQuery_Grp;


	
	public class GrpDAO implements GrpDAO_interface {
		
		// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
		private static DataSource ds = null;
		static {
			try {
				Context ctx = new InitialContext();
				ds = (DataSource) ctx.lookup("java:comp/env/jdbc/CA102G4");
			} catch (NamingException e) {
				e.printStackTrace();
			}
		}
		//新增一個揪團
		private static final String INSERT_STMT =
				"Insert into GRP (GRP_ID,MEM_ID,GRP_START,GRP_END,GRP_CNT,GRP_ACPT,TRIP_NO,TRIP_START,TRIP_END,TRIP_LOCALE,TRIP_DETAILS,GRP_PHOTO,GRP_STATUS,CHATROOM_ID,GRP_TITLE,GRP_PRICE) "
				+ "VALUES ('GRP'||LPAD(to_char(GRP_seq.NEXTVAL), 6, '0'),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		//更新揪團
		private static final String UPDATE =
				"UPDATE GRP SET MEM_ID=?,GRP_START=?,GRP_END=?,GRP_CNT=?,GRP_ACPT=?,TRIP_NO=?,TRIP_START=?,TRIP_END=?,TRIP_LOCALE=?,TRIP_DETAILS=?,GRP_PHOTO=?,GRP_STATUS=?,CHATROOM_ID=?,GRP_TITLE=?,GRP_PRICE=? WHERE GRP_ID =? ";
		//刪除揪團
		private static final String DELETE_GRP =
				"DELETE FROM GRP WHERE GRP_ID = ?";
		
		private static final String GET_ONE_STMT = 
				"SELECT * FROM GRP WHERE GRP_ID = ?";
		private static final String GET_ALL = 
				"SELECT * FROM GRP ORDER BY GRP_ID";
		
		
		@Override
		public void insert(GrpVO grpVO) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				
				con = ds.getConnection();

				pstmt = con.prepareStatement(INSERT_STMT);
				
				pstmt.setString(1, grpVO.getMem_Id());
				pstmt.setTimestamp(2, grpVO.getGrp_Start());
				pstmt.setTimestamp(3, grpVO.getGrp_End());
				pstmt.setInt(4, grpVO.getGrp_Cnt());
				pstmt.setInt(5, grpVO.getGrp_Acpt());
				pstmt.setString(6, grpVO.getTrip_No());
				pstmt.setTimestamp(7, grpVO.getTrip_Start());
				pstmt.setTimestamp(8, grpVO.getTrip_End());
				pstmt.setString(9, grpVO.getTrip_Locale());
				pstmt.setString(10, grpVO.getTrip_Details());
				pstmt.setBytes(11, grpVO.getGrp_Photo());
				pstmt.setInt(12, grpVO.getGrp_Status());
				pstmt.setString(13, grpVO.getChatroom_Id());
				pstmt.setString(14, grpVO.getGrp_Title());
				pstmt.setString(15, grpVO.getGrp_Price());

				
				pstmt.executeUpdate();
				
			}catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
				// Clean up JDBC resources
			} finally {
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}
		}
		
		@Override
		public void update(GrpVO grpVO) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				
				con = ds.getConnection();

				pstmt = con.prepareStatement(UPDATE);
				
				pstmt.setString(1, grpVO.getMem_Id());
				pstmt.setTimestamp(2, grpVO.getGrp_Start());
				pstmt.setTimestamp(3, grpVO.getGrp_End());
				pstmt.setInt(4, grpVO.getGrp_Cnt());
				pstmt.setInt(5, grpVO.getGrp_Acpt());
				pstmt.setString(6, grpVO.getTrip_No());
				pstmt.setTimestamp(7, grpVO.getTrip_Start());
				pstmt.setTimestamp(8, grpVO.getTrip_End());
				pstmt.setString(9, grpVO.getTrip_Locale());
				pstmt.setString(10, grpVO.getTrip_Details());
				pstmt.setBytes(11, grpVO.getGrp_Photo());
				pstmt.setInt(12, grpVO.getGrp_Status());
				pstmt.setString(13, grpVO.getChatroom_Id());
				pstmt.setString(14, grpVO.getGrp_Title());
				pstmt.setString(15, grpVO.getGrp_Price());
				pstmt.setString(16, grpVO.getGrp_Id());
				pstmt.executeUpdate();
				
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
				// Clean up JDBC resources
			} finally {
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}
		}

		@Override
		public void delete(String grp_Id) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				
				con = ds.getConnection();
				
				con.setAutoCommit(false);
				
				pstmt = con.prepareStatement(DELETE_GRP);

				pstmt.setString(1, grp_Id);

				pstmt.executeUpdate();

				con.commit();
				con.setAutoCommit(true);
				
			}catch (SQLException se) {
				if (con != null) {
					try {
						con.rollback();
					} catch (SQLException excep) {
						throw new RuntimeException("rollback error occured. " + excep.getMessage());
					}
				}
				throw new RuntimeException("A database error occured. " + se.getMessage());
				// Clean up JDBC resources
			} finally {
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}
		}
		
		

		@Override
		public GrpVO findByPrimaryKey(String grp_Id) {
			
			GrpVO grpVO = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				
				con = ds.getConnection();

				pstmt = con.prepareStatement(GET_ONE_STMT);

				pstmt.setString(1, grp_Id);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					
					grpVO = new GrpVO();
					grpVO.setGrp_Id(rs.getString("GRP_ID"));
					grpVO.setGrp_Start(rs.getTimestamp("GRP_START"));
					grpVO.setGrp_End(rs.getTimestamp("GRP_END"));
					grpVO.setGrp_Cnt(rs.getInt("GRP_CNT"));
					grpVO.setGrp_Acpt(rs.getInt("GRP_ACPT"));
					grpVO.setTrip_No(rs.getString("TRIP_NO"));
					grpVO.setTrip_Start(rs.getTimestamp("TRIP_START"));
					grpVO.setTrip_End(rs.getTimestamp("TRIP_END"));
					grpVO.setTrip_Locale(rs.getString("TRIP_LOCALE"));
					grpVO.setTrip_Details(rs.getString("TRIP_DETAILS"));
					grpVO.setGrp_Photo(rs.getBytes("GRP_PHOTO"));
					grpVO.setGrp_Status(rs.getInt("GRP_STATUS"));
					grpVO.setChatroom_Id(rs.getString("CHATROOM_ID"));
					grpVO.setGrp_Title(rs.getString("GRP_TITLE"));
					grpVO.setGrp_Price(rs.getString("GRP_PRICE"));

				}
				

				// Handle any driver errors
			}catch (SQLException se) {
				throw new RuntimeException("A database error occured. " + se.getMessage());
				// Clean up JDBC resources
			} finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}
			return grpVO;
		}
		
		//查詢所有揪團
		@Override
		public List<GrpVO> getAll() {

		List<GrpVO> list = new ArrayList<GrpVO>();
		GrpVO grpVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ds.getConnection();

			pstmt = con.prepareStatement(GET_ALL);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				grpVO = new GrpVO();
				grpVO.setMem_Id(rs.getString("MEM_ID"));
				grpVO.setGrp_Id(rs.getString("GRP_ID"));
				grpVO.setGrp_Start(rs.getTimestamp("GRP_START"));
				grpVO.setGrp_End(rs.getTimestamp("GRP_END"));
				grpVO.setGrp_Cnt(rs.getInt("GRP_CNT"));
				grpVO.setGrp_Acpt(rs.getInt("GRP_ACPT"));
				grpVO.setTrip_No(rs.getString("TRIP_NO"));
				grpVO.setTrip_Start(rs.getTimestamp("TRIP_START"));
				grpVO.setTrip_End(rs.getTimestamp("TRIP_END"));
				grpVO.setTrip_Locale(rs.getString("TRIP_LOCALE"));
				grpVO.setTrip_Details(rs.getString("TRIP_DETAILS"));
				grpVO.setGrp_Photo(rs.getBytes("GRP_PHOTO"));
				grpVO.setGrp_Status(rs.getInt("GRP_STATUS"));
				grpVO.setChatroom_Id(rs.getString("CHATROOM_ID"));
				grpVO.setGrp_Title(rs.getString("GRP_TITLE"));
				grpVO.setGrp_Price(rs.getString("GRP_PRICE"));
				list.add(grpVO);
				
				//System.out.println(grpVO.getGrp_Id());
			}
			

			// Handle any driver errors
		}catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
		
		//萬用複合查詢
		@Override
		public List<GrpVO> getAll(Map<String, String[]> map) {
			List<GrpVO> list = new ArrayList<GrpVO>();
			GrpVO grpVO = null;
		
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
		
			try {
				
				con = ds.getConnection();
				String finalSQL = "SELECT * FROM GRP "
				      + jdbcUtil_CompositeQuery_Grp.get_WhereCondition(map)
			          + "order by GRP_ID";
				pstmt = con.prepareStatement(finalSQL);
				System.out.println("●●finalSQL(by DAO) = "+finalSQL);
				rs = pstmt.executeQuery();
		
				while (rs.next()) {
					grpVO = new GrpVO();
					grpVO.setMem_Id(rs.getString("MEM_ID"));
					grpVO.setGrp_Id(rs.getString("GRP_ID"));
					grpVO.setGrp_Start(rs.getTimestamp("GRP_START"));
					grpVO.setGrp_End(rs.getTimestamp("GRP_END"));
					grpVO.setGrp_Cnt(rs.getInt("GRP_CNT"));
					grpVO.setGrp_Acpt(rs.getInt("GRP_ACPT"));
					grpVO.setTrip_No(rs.getString("TRIP_NO"));
					grpVO.setTrip_Start(rs.getTimestamp("TRIP_START"));
					grpVO.setTrip_End(rs.getTimestamp("TRIP_END"));
					grpVO.setTrip_Locale(rs.getString("TRIP_LOCALE"));
					grpVO.setTrip_Details(rs.getString("TRIP_DETAILS"));
					grpVO.setGrp_Photo(rs.getBytes("GRP_PHOTO"));
					grpVO.setGrp_Status(rs.getInt("GRP_STATUS"));
					grpVO.setChatroom_Id(rs.getString("CHATROOM_ID"));
					grpVO.setGrp_Title(rs.getString("GRP_TITLE"));
					grpVO.setGrp_Price(rs.getString("GRP_PRICE"));
					list.add(grpVO);
				}
		
				// Handle any SQL errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
			} finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}
			return list;
			 
		}
	}
		


