package com.tripDays.model;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class TripDaysDAO implements TripDaysDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/CA102G4DB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String SQL_INSERT = "insert into TRIP_DAYS "
			+ "(TRIPDAY_NO,TRIP_NO,TRIPDAY_DAYS,TRIPDAY_DATE,TRIPDAY_HOTELNAME,TRIPDAY_HOTELSTART,TRIPDAY_HOTELNOTE,TRIPDAY_HOTELCOST) "
			+ "values ('TD'||LPAD(TO_CHAR(TRIPDAYS_SEQ.NEXTVAL), 8, '0'),?,?,?,?,?,?,?)";
	private static final String SQL_UPDATE = "update TRIP_DAYS set "
			+ "TRIP_NO = ?,TRIPDAY_DAYS = ?,TRIPDAY_DATE = ?,TRIPDAY_HOTELNAME = ?,TRIPDAY_HOTELSTART = ?,TRIPDAY_HOTELNOTE = ?,"
			+ "TRIPDAY_HOTELCOST = ? where TRIPDAY_NO = ?";
	private static final String SQL_DELETE = "delete from TRIP_DAYS where TRIPDAY_NO = ?";
	private static final String SQL_QUERY = "select * from TRIP_DAYS where TRIPDAY_NO = ?";
	private static final String SQL_QUERY_ALL = "select * from TRIP_DAYS";

	@Override
	public int insert(TripDaysVO tripDaysVO) {
		int updateCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(SQL_INSERT);
			pstmt.setString(1, tripDaysVO.getTrip_no());
			pstmt.setInt(2, tripDaysVO.getTripDay_days());
			pstmt.setDate(3, tripDaysVO.getTripDay_date());
			pstmt.setString(4, tripDaysVO.getTripDay_hotelName());
			pstmt.setInt(5, tripDaysVO.getTripDay_hotelStart());
			pstmt.setString(6, tripDaysVO.getTripDay_hotelNote());
			pstmt.setInt(7, tripDaysVO.getTripDay_hotelCost());

			updateCount = pstmt.executeUpdate();
			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());

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
			con = ds.getConnection();
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
			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());

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
			con = ds.getConnection();
			pstmt = con.prepareStatement(SQL_DELETE);
			pstmt.setString(1, tripDay_no);

			updateCount = pstmt.executeUpdate();
			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());

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
			con = ds.getConnection();
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
			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());

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
			con = ds.getConnection();
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
			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			

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
