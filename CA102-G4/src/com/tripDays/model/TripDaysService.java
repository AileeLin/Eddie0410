package com.tripDays.model;

public class TripDaysService {
	private TripDaysDAO_interface dao;
	
	public TripDaysService() {
		dao = new TripDaysDAO();
	}
}
