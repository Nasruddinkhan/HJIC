package com.jsoft.hjic.model;

public class FeeDetail {
	private int studentid;
	private String doj;
	private String studentName;
	private String classId;
	private int examfees;
	private int travelfees;
	private int totalfees;
	private int monthlyfees;
	private String contactNo;
	private String errCode;
	private String errMsg;
	private String payMonth;
	private int balancefees;
	private String payExamFee;
	private String payTravelFee;
	
	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public String getErrCode() {
		return errCode;
	}

	public void setErrCode(String errCode) {
		this.errCode = errCode;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	public int getStudentid() {
		return studentid;
	}

	public void setStudentid(int studentid) {
		this.studentid = studentid;
	}

	public String getDoj() {
		return doj;
	}

	public void setDoj(String doj) {
		this.doj = doj;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
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
	
	public String getPayMonth() {
		return payMonth;
	}

	public void setPayMonth(String payMonth) {
		this.payMonth = payMonth;
	}

	public int getBalancefees() {
		return balancefees;
	}

	public void setBalancefees(int balancefees) {
		this.balancefees = balancefees;
	}

	public String getPayExamFee() {
		return payExamFee;
	}

	public void setPayExamFee(String payExamFee) {
		this.payExamFee = payExamFee;
	}

	public String getPayTravelFee() {
		return payTravelFee;
	}

	public void setPayTravelFee(String payTravelFee) {
		this.payTravelFee = payTravelFee;
	}

	@Override
	public String toString() {
		return "FeeDetail [studentid=" + studentid + ", doj=" + doj + ", studentName=" + studentName + ", classId="
				+ classId + ", examfees=" + examfees + ", travelfees=" + travelfees
				+ ", totalfees=" + totalfees + ", monthlyfees=" + monthlyfees + ", contactNo=" + contactNo
				+ ", errCode=" + errCode + ", errMsg=" + errMsg + ", payMonth=" + payMonth + ", balancefees="
				+ balancefees + ", payExamFee=" + payExamFee + ", payTravelFee=" + payTravelFee + "]";
	}
	
	

}
