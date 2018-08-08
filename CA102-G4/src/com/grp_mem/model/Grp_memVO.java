package com.grp_mem.model;

public class Grp_memVO implements java.io.Serializable{
	private String grp_Id;
	private String mem_Id;
	private String grp_Leader;
	
	public Grp_memVO() {
		
	}

	public String getGrp_Id() {
		return grp_Id;
	}

	public void setGrp_Id(String grp_Id) {
		this.grp_Id = grp_Id;
	}

	public String getMem_Id() {
		return mem_Id;
	}

	public void setMem_Id(String mem_Id) {
		this.mem_Id = mem_Id;
	}

	public String getGrp_Leader() {
		return grp_Leader;
	}

	public void setGrp_Leader(String grp_Leader) {
		this.grp_Leader = grp_Leader;
	}
	

}
