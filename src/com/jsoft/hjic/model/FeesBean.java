package com.jsoft.hjic.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="fees_details")
public class FeesBean  extends  BaseBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int feesID;
	private int feesPay;
	private String classid;
	private String payMonth;
	private int monthfees;
	private Integer examfees;
	private Integer travelFees;
	private String examfeesPayFlag;
    private String travelFessPayFlag;	
    private String financialYear;
    private int totalfess;
    private String grno;
	public String getGrno() {
		return grno;
	}
	public void setGrno(String grno) {
		this.grno = grno;
	}
	public Integer getExamfees() {
		return examfees;
	}
	public void setExamfees(Integer examfees) {
		this.examfees = examfees;
	}

	public Integer getTravelFees() {
		return travelFees;
	}

	public void setTravelFees(Integer travelFees) {
		this.travelFees = travelFees;
	}

	@Override
	public String toString() {
		return "FeesBean [feesID=" + feesID + ", feesPay=" + feesPay + ", classid="
				+ classid + ", payMonth=" + payMonth + ", monthfees=" + monthfees + ", examfees=" + examfees
				+ ", travelFees=" + travelFees + ", examfeesPayFlag=" + examfeesPayFlag + ", travelFessPayFlag="
				+ travelFessPayFlag + ", financialYear=" + financialYear + ", totalfess=" + totalfess + "]";
	}

	public int getTotalfess() {
		return totalfess;
	}
	public void setTotalfess(int totalfess) {
		this.totalfess = totalfess;
	}
	public String getPayMonth() {
		return payMonth;
	}
	public void setPayMonth(String payMonth) {
		this.payMonth = payMonth;
	}
	public int getMonthfees() {
		return monthfees;
	}
	public void setMonthfees(int monthfees) {
		this.monthfees = monthfees;
	}

	
	public String getExamfeesPayFlag() {
		return examfeesPayFlag;
	}
	public void setExamfeesPayFlag(String examfeesPayFlag) {
		this.examfeesPayFlag = examfeesPayFlag;
	}
	public String getTravelFessPayFlag() {
		return travelFessPayFlag;
	}
	public void setTravelFessPayFlag(String travelFessPayFlag) {
		this.travelFessPayFlag = travelFessPayFlag;
	}
	public String getFinancialYear() {
		return financialYear;
	}
	public void setFinancialYear(String financialYear) {
		this.financialYear = financialYear;
	}
	public String getClassid() {
		return classid;
	}
	public void setClassid(String classid) {
		this.classid = classid;
	}

	public int getFeesID() {
		return feesID;
	}
	public void setFeesID(int feesID) {
		this.feesID = feesID;
	}
	public int getFeesPay() {
		return feesPay;
	}
	public void setFeesPay(int feesPay) {
		this.feesPay = feesPay;
	}
}
