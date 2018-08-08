package com.trip.model;

import java.sql.*;
import java.util.*;

public class TripJDBCDAO implements TripDAO_interface {
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "CA102G4";
	private static final String PASSWORD = "12345678";
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";

	private static final String SQL_INSERT = "insert into TRIP "
			+ "(TRIP_NO,MEM_ID,TRIP_NAME,TRIP_STARTDAY,TRIP_DAYS,TRIP_VIEWS,TRIP_STATUS) "
			+ "values ('T'||LPAD(TO_CHAR(TRIP_SEQ.NEXTVAL), 9, '0'),?,?,?,?,?,?)";
	private static final String SQL_UPDATE = "update TRIP set "
			+ "MEM_ID = ?,TRIP_NAME = ?,TRIP_STARTDAY = ?,TRIP_DAYS = ?,TRIP_VIEWS = ?,TRIP_STATUS = ?"
			+ " where TRIP_NO = ?";
	private static final String SQL_DELETE = "delete from TRIP where TRIP_NO = ?";
	private static final String SQL_QUERY = "select * from TRIP where TRIP_NO = ?";
	private static final String SQL_QUERY_ALL = "select * from TRIP";
	static {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		}
	}

	@Override
	public int insert(TripVO tripVO) {
		int updateCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(SQL_INSERT);
			pstmt.setString(1, tripVO.getMem_id());
			pstmt.setString(2, tripVO.getTrip_name());
			pstmt.setDate(3, tripVO.getTrip_startDay());
			pstmt.setInt(4, tripVO.getTrip_days());
			pstmt.setInt(5, tripVO.getTrip_views());
			pstmt.setInt(6, tripVO.getTrip_status());

			updateCount = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return updateCount;
	}

	@Override
	public int update(TripVO tripVO) {
		int updateCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(SQL_UPDATE);
			pstmt.setString(1, tripVO.getMem_id());
			pstmt.setString(2, tripVO.getTrip_name());
			pstmt.setDate(3, tripVO.getTrip_startDay());
			pstmt.setInt(4, tripVO.getTrip_days());
			pstmt.setInt(5, tripVO.getTrip_views());
			pstmt.setInt(6, tripVO.getTrip_status());
			pstmt.setString(7, tripVO.getTrip_no());
			;

			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return updateCount;
	}

	@Override
	public int delete(String trip_no) {
		int updateCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(SQL_DELETE);
			pstmt.setString(1, trip_no);

			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return updateCount;
	}

	@Override
	public TripVO findByPrimaryKey(String trip_no) {
		TripVO tripVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(SQL_QUERY);
			pstmt.setString(1, trip_no);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				tripVO = new TripVO();
				tripVO.setTrip_no(rs.getString("TRIP_NO"));
				tripVO.setMem_id(rs.getString("MEM_ID"));
				tripVO.setTrip_name(rs.getString("TRIP_NAME"));
				tripVO.setTrip_startDay(rs.getDate("TRIP_STARTDAY"));
				tripVO.setTrip_days(rs.getInt("TRIP_DAYS"));
				tripVO.setTrip_views(rs.getInt("TRIP_VIEWS"));
				tripVO.setTrip_status(rs.getInt("TRIP_STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return tripVO;
	}

	@Override
	public List<TripVO> getAll() {
		List<TripVO> list = new ArrayList<TripVO>();
		TripVO tripVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(SQL_QUERY_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				tripVO = new TripVO();
				tripVO.setTrip_no(rs.getString("TRIP_NO"));
				tripVO.setMem_id(rs.getString("MEM_ID"));
				tripVO.setTrip_name(rs.getString("TRIP_NAME"));
				tripVO.setTrip_startDay(rs.getDate("TRIP_STARTDAY"));
				tripVO.setTrip_days(rs.getInt("TRIP_DAYS"));
				tripVO.setTrip_views(rs.getInt("TRIP_VIEWS"));
				tripVO.setTrip_status(rs.getInt("TRIP_STATUS"));

				list.add(tripVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}

	@Override
	public void addTrip(TripVO tripVO) {
		// TODO Auto-generated method stub
		
	}

}
