package com.trip.model;

import java.sql.Date;
import java.util.*;

public class TripService {
	
	private TripDAO_interface dao;
	
	public TripService() {
		dao = new TripDAO();
	}
	
	public TripVO addTrip(TripVO tripVO) {
		dao.addTrip(tripVO);
		return tripVO;
	}
	
	public TripVO updateTrip(String trip_no,String mem_id, String trip_name,
			Date trip_startDay, Integer trip_days, Integer trip_views, Integer trip_status) {
		TripVO tripVO = new TripVO();
		
		tripVO.setTrip_no(trip_no);
		tripVO.setMem_id(mem_id);
		tripVO.setTrip_name(trip_name);
		tripVO.setTrip_startDay(trip_startDay);
		tripVO.setTrip_days(trip_days);
		tripVO.setTrip_views(trip_views);
		tripVO.setTrip_status(trip_status);
		dao.update(tripVO);
		
		return tripVO;
	}
	
	public void deleteTrip(String trip_no) {
		dao.delete(trip_no);
	}
	
	public TripVO getOneTripByPK(String trip_no) {
		return dao.findByPrimaryKey(trip_no);
	}
	
	public List<TripVO> getAll(){
		return dao.getAll();
	}
	
}
