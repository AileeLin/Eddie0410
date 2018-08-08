package com.trafficTrip.model;

import java.util.List;

public interface TrafficTripDAO_interface {
	public int insert(TrafficTripVO traTripVO);
	public int update(TrafficTripVO traTripVO);
	public int delete(String traTrip_no);
	public TrafficTripVO findByPrimaryKey(String traTrip_no);
	public List<TrafficTripVO> getAll();
}
