package com.attTrip.model;

import java.util.List;

public interface AttractionsTripDAO_interface {
	public int insert(AttractionsTripVO attTripVO);

	public int update(AttractionsTripVO attTripVO);

	public int delete(String attTrip_no);

	public AttractionsTripVO findByPrimaryKey(String attTrip_no);

	public List<AttractionsTripVO> getAll();
}
