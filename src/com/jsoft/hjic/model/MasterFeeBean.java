package com.jsoft.hjic.model;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;
@Entity
@Table(name = "fees_master")
public class MasterFeeBean extends BaseBean implements Serializable {


	private static final long serialVersionUID = 1L;
	@EmbeddedId
	FeesGroup feesGroup;
	private int montly_fees;
	private String financial_year;
	private int exam_fees;
	private int late_fees;
	private int totalfees;
	
	public int getTotalfees() {
		return totalfees;
	}
	public void setTotalfees(int totalfees) {
		this.totalfees = totalfees;
	}
	@Override
	public String toString() {
		return "MasterFeeBean [feesGroup=" + feesGroup + ", montly_fees=" + montly_fees + ", financial_year=" + financial_year
				+ ", exam_fees=" + exam_fees + ", late_fees=" + late_fees + "]";
	}
	public FeesGroup getFeesGroup() {
		return feesGroup;
	}
	public void setFeesGroup(FeesGroup feesGroup) {
		this.feesGroup = feesGroup;
	}
	public int getMontly_fees() {
		return montly_fees;
	}
	public void setMontly_fees(int montly_fees) {
		this.montly_fees = montly_fees;
	}
	public String getFinancial_year() {
		return financial_year;
	}
	public void setFinancial_year(String financial_year) {
		this.financial_year = financial_year;
	}
	public int getExam_fees() {
		return exam_fees;
	}
	public void setExam_fees(int exam_fees) {
		this.exam_fees = exam_fees;
	}
	public int getLate_fees() {
		return late_fees;
	}
	public void setLate_fees(int late_fees) {
		this.late_fees = late_fees;
	}
	

}

