package com.trafficTrip.model;

import java.util.*;
import java.sql.*;

public class TrafficTripJDBCDAO implements TrafficTripDAO_interface {
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "CA102G4";
	private static final String PASSWORD = "12345678";
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";

	private static final String SQL_INSERT = "insert into TRAFFIC_TRIP "
			+ "(TRATRIP_NO,TRIPDAY_NO,TRATRIP_TYPE,TRATRIP_COST,TRATRIP_START,TRATRIP_END,TRIP_ORDER,TRATRIP_NAME,TRATRIP_NOTE) "
			+ "values ('TT'||LPAD(to_char(TRATRIP_SEQ.NEXTVAL), 8, '0'),?,?,?,?,?,?,?,?)";
	private static final String SQL_UPDATE = "update TRAFFIC_TRIP set "
			+ "TRIPDAY_NO = ?,TRATRIP_TYPE = ?,TRATRIP_COST = ?,TRATRIP_START = ?,TRATRIP_END = ?,TRIP_ORDER = ?,"
			+ "TRATRIP_NAME = ?,TRATRIP_NOTE = ? where TRATRIP_NO = ?";
	private static final String SQL_DELETE = "delete from TRAFFIC_TRIP where TRATRIP_NO = ?";
	private static final String SQL_QUERY = "select * from TRAFFIC_TRIP where TRATRIP_NO = ?";
	private static final String SQL_QUERY_ALL = "select * from TRAFFIC_TRIP";
	static {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		}
	}

	@Override
	public int insert(TrafficTripVO trafficTripVO) {
		int updateCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(SQL_INSERT);
			pstmt.setString(1, trafficTripVO.getTripDay_no());
			pstmt.setInt(2, trafficTripVO.getTraTrip_type());
			pstmt.setInt(3, trafficTripVO.getTraTrip_cost());
			pstmt.setInt(4, trafficTripVO.getTraTrip_start());
			pstmt.setInt(5, trafficTripVO.getTraTrip_end());
			pstmt.setInt(6, trafficTripVO.getTrip_order());
			pstmt.setString(7, trafficTripVO.getTraTrip_name());
			pstmt.setString(8, trafficTripVO.getTraTrip_note());

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
	public int update(TrafficTripVO trafficTripVO) {
		int updateCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(SQL_UPDATE);
			pstmt.setString(1, trafficTripVO.getTripDay_no());
			pstmt.setInt(2, trafficTripVO.getTraTrip_type());
			pstmt.setInt(3, trafficTripVO.getTraTrip_cost());
			pstmt.setInt(4, trafficTripVO.getTraTrip_start());
			pstmt.setInt(5, trafficTripVO.getTraTrip_end());
			pstmt.setInt(6, trafficTripVO.getTrip_order());
			pstmt.setString(7, trafficTripVO.getTraTrip_name());
			pstmt.setString(8, trafficTripVO.getTraTrip_note());
			pstmt.setString(9, trafficTripVO.getTraTrip_no());

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
	public int delete(String traTrip_no) {
		int updateCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(SQL_DELETE);
			pstmt.setString(1, traTrip_no);

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
	public TrafficTripVO findByPrimaryKey(String traTrip_no) {
		TrafficTripVO trafficTripVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(SQL_QUERY);
			pstmt.setString(1, traTrip_no);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				trafficTripVO = new TrafficTripVO();
				trafficTripVO.setTraTrip_no(rs.getString("TRATRIP_NO"));
				trafficTripVO.setTripDay_no(rs.getString("TRIPDAY_NO"));
				trafficTripVO.setTraTrip_type(rs.getInt("TRATRIP_TYPE"));
				trafficTripVO.setTraTrip_cost(rs.getInt("TRATRIP_COST"));
				trafficTripVO.setTraTrip_start(rs.getInt("TRATRIP_START"));
				trafficTripVO.setTraTrip_end(rs.getInt("TRATRIP_END"));
				trafficTripVO.setTrip_order(rs.getInt("TRIP_ORDER"));
				trafficTripVO.setTraTrip_name(rs.getString("TRATRIP_NAME"));
				trafficTripVO.setTraTrip_note(rs.getString("TRATRIP_NOTE"));
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
		return trafficTripVO;
	}

	@Override
	public List<TrafficTripVO> getAll() {
		List<TrafficTripVO> list = new ArrayList<TrafficTripVO>();
		TrafficTripVO trafficTripVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(SQL_QUERY_ALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				trafficTripVO = new TrafficTripVO();
				trafficTripVO.setTraTrip_no(rs.getString("TRATRIP_NO"));
				trafficTripVO.setTripDay_no(rs.getString("TRIPDAY_NO"));
				trafficTripVO.setTraTrip_type(rs.getInt("TRATRIP_TYPE"));
				trafficTripVO.setTraTrip_cost(rs.getInt("TRATRIP_COST"));
				trafficTripVO.setTraTrip_start(rs.getInt("TRATRIP_START"));
				trafficTripVO.setTraTrip_end(rs.getInt("TRATRIP_END"));
				trafficTripVO.setTrip_order(rs.getInt("TRIP_ORDER"));
				trafficTripVO.setTraTrip_name(rs.getString("TRATRIP_NAME"));
				trafficTripVO.setTraTrip_note(rs.getString("TRATRIP_NOTE"));

				list.add(trafficTripVO);
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
