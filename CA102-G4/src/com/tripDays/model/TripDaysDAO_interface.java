package com.tripDays.model;

import java.util.List;

public interface TripDaysDAO_interface {
	public int insert(TripDaysVO tripDaysVO);
	public int update(TripDaysVO tripDaysVO);
	public int delete(String tripDay_no);
	public TripDaysVO findByPrimaryKey(String tripDay_no);
	public List<TripDaysVO> getAll();
}
