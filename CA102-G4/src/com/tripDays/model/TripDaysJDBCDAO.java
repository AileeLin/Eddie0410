package com.tripDays.model;

import java.sql.*;
import java.util.*;

public class TripDaysJDBCDAO implements TripDaysDAO_interface {
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "CA102G4";
	private static final String PASSWORD = "12345678";
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";

	private static final String SQL_INSERT = "insert into TRIP_DAYS "
			+ "(TRIPDAY_NO,TRIP_NO,TRIPDAY_DAYS,TRIPDAY_DATE,TRIPDAY_HOTELNAME,TRIPDAY_HOTELSTART,TRIPDAY_HOTELNOTE,TRIPDAY_HOTELCOST) "
			+ "values ('TD'||LPAD(TO_CHAR(TRIPDAYS_SEQ.NEXTVAL), 8, '0'),?,?,?,?,?,?,?)";
	private static final String SQL_UPDATE = "update TRIP_DAYS set "
			+ "TRIP_NO = ?,TRIPDAY_DAYS = ?,TRIPDAY_DATE = ?,TRIPDAY_HOTELNAME = ?,TRIPDAY_HOTELSTART = ?,TRIPDAY_HOTELNOTE = ?,"
			+ "TRIPDAY_HOTELCOST = ? where TRIPDAY_NO = ?";
	private static final String SQL_DELETE = "delete from TRIP_DAYS where TRIPDAY_NO = ?";
	private static final String SQL_QUERY = "select * from TRIP_DAYS where TRIPDAY_NO = ?";
	private static final String SQL_QUERY_ALL = "select * from TRIP_DAYS";
	static {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		}
	}

	@Override
	public int insert(TripDaysVO tripDaysVO) {
		int updateCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(SQL_INSERT);
			pstmt.setString(1, tripDaysVO.getTrip_no());
			pstmt.setInt(2, tripDaysVO.getTripDay_days());
			pstmt.setDate(3, tripDaysVO.getTripDay_date());
			pstmt.setString(4, tripDaysVO.getTripDay_hotelName());
			pstmt.setInt(5, tripDaysVO.getTripDay_hotelStart());
			pstmt.setString(6, tripDaysVO.getTripDay_hotelNote());
			pstmt.setInt(7, tripDaysVO.getTripDay_hotelCost());

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
	public int update(TripDaysVO tripDaysVO) {
		int updateCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(SQL_UPDATE);
			pstmt.setString(1, tripDaysVO.getTrip_no());
			pstmt.setInt(2, tripDaysVO.getTripDay_days());
			pstmt.setDate(3, tripDaysVO.getTripDay_date());
			pstmt.setString(4, tripDaysVO.getTripDay_hotelName());
			pstmt.setInt(5, tripDaysVO.getTripDay_hotelStart());
			pstmt.setString(6, tripDaysVO.getTripDay_hotelNote());
			pstmt.setInt(7, tripDaysVO.getTripDay_hotelCost());
			pstmt.setString(8, tripDaysVO.getTripDay_no());

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
	public int delete(String tripDay_no) {
		int updateCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(SQL_DELETE);
			pstmt.setString(1, tripDay_no);

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
	public TripDaysVO findByPrimaryKey(String tripDay_no) {
		TripDaysVO tripDaysVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(SQL_QUERY);
			pstmt.setString(1, tripDay_no);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				tripDaysVO = new TripDaysVO();
				tripDaysVO.setTripDay_no(rs.getString("TRIPDAY_NO"));
				tripDaysVO.setTrip_no(rs.getString("TRIP_NO"));
				tripDaysVO.setTripDay_days(rs.getInt("TRIPDAY_DAYS"));
				tripDaysVO.setTripDay_date(rs.getDate("TRIPDAY_DATE"));
				tripDaysVO.setTripDay_hotelName(rs.getString("TRIPDAY_HOTELNAME"));
				tripDaysVO.setTripDay_hotelStart(rs.getInt("TRIPDAY_HOTELSTART"));
				tripDaysVO.setTripDay_hotelNote(rs.getString("TRIPDAY_HOTELNOTE"));
				tripDaysVO.setTripDay_hotelCost(rs.getInt("TRIPDAY_HOTELCOST"));
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
		return tripDaysVO;
	}

	@Override
	public List<TripDaysVO> getAll() {
		List<TripDaysVO> list = new ArrayList<TripDaysVO>();
		TripDaysVO tripDaysVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(SQL_QUERY_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				tripDaysVO = new TripDaysVO();
				tripDaysVO.setTripDay_no(rs.getString("TRIPDAY_NO"));
				tripDaysVO.setTrip_no(rs.getString("TRIP_NO"));
				tripDaysVO.setTripDay_days(rs.getInt("TRIPDAY_DAYS"));
				tripDaysVO.setTripDay_date(rs.getDate("TRIPDAY_DATE"));
				tripDaysVO.setTripDay_hotelName(rs.getString("TRIPDAY_HOTELNAME"));
				tripDaysVO.setTripDay_hotelStart(rs.getInt("TRIPDAY_HOTELSTART"));
				tripDaysVO.setTripDay_hotelNote(rs.getString("TRIPDAY_HOTELNOTE"));
				tripDaysVO.setTripDay_hotelCost(rs.getInt("TRIPDAY_HOTELCOST"));
				list.add(tripDaysVO);
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

}
