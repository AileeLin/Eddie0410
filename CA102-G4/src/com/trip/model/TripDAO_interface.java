package com.trip.model;

import java.util.List;

public interface TripDAO_interface {
	public int insert(TripVO tripVO);
	public int update(TripVO tripVO);
	public int delete(String trip_no);
	public TripVO findByPrimaryKey(String trip_no);
	public List<TripVO> getAll();
	public void addTrip(TripVO tripVO);
}
