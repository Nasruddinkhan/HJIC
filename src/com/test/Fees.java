package com.test;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
@Entity
public class Fees  implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private FeesGroup classid;
	public FeesGroup getFeesid() {
		return classid;
	}
	public void setFeesid(FeesGroup classid) {
		this.classid = classid;
	}
	private String shoolmedium;
	private String classname;
	private int examfees;
	private int travelfees;
	private int totalfees;
	private int monthlyfees;
	@Override
	public String toString() {
		return "Fees [classid=" + classid + ", classname=" + classname + ", examfees=" + examfees + ", travelfees="
				+ travelfees + ", totalfees=" + totalfees + ", monthlyfees=" + monthlyfees + "]";
	}
	public String getShoolmedium() {
		return shoolmedium;
	}
	public void setShoolmedium(String shoolmedium) {
		this.shoolmedium = shoolmedium;
	}


/*	public Integer getClassid() {
		return classid;
	}
	public void setClassid(Integer classid) {
		this.classid = classid;
	}
	public void setFeeid(int feeid) {
		this.feeid = feeid;
	}
	public FeesGroup getClassid() {
		return classid;
	}*/
	/*public void setClassid(FeesGroup classid) {
		this.classid = classid;
	}*/
	public String getClassname() {
		return classname;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}
	public int getExamfees() {
		return examfees;
	}
	public void setExamfees(int examfees) {
		this.examfees = examfees;
	}
	public int getTravelfees() {
		return travelfees;
	}
	public void setTravelfees(int travelfees) {
		this.travelfees = travelfees;
	}
	public int getTotalfees() {
		return totalfees;
	}
	public void setTotalfees(int totalfees) {
		this.totalfees = totalfees;
	}
	public int getMonthlyfees() {
		return monthlyfees;
	}
	public void setMonthlyfees(int monthlyfees) {
		this.monthlyfees = monthlyfees;
	}
	


}
