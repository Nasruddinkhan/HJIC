package com.jsoft.hjic.model;

import java.io.Serializable;
public class StudentSearch implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer studentId;
	private String studentName;
	private String studentClass;
	private String fromDate;
	private String toDate;
	public String getFromDate() {
		return fromDate;
	}

	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	public String getToDate() {
		return toDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

	public Integer getStudentId() {
		return studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getStudentClass() {
		return studentClass;
	}

	public void setStudentClass(String studentClass) {
		this.studentClass = studentClass;
	}

	@Override
	public String toString() {
		return "StudentSearch [studentId=" + studentId + ", studentName=" + studentName + ", studentClass="
				+ studentClass + ", fromDate=" + fromDate + ", toDate=" + toDate + "]";
	}
	
}
