package com.test;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.ManyToOne;

@Embeddable
public class FeesGroup implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int  classid;
	@Column(name = "shoolmedium", insertable = false, updatable = false)
	private String shoolmedium;
	public int getClassid() {
		return classid;
	}
	public void setClassid(int classid) {
		this.classid = classid;
	}
	public String getShoolmedium() {
		return shoolmedium;
	}
	public void setShoolmedium(String shoolmedium) {
		this.shoolmedium = shoolmedium;
	}
	

}
