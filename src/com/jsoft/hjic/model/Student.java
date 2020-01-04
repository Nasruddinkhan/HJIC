package com.jsoft.hjic.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Students")
public class Student extends BaseBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer studentId;
	@Column(unique = true)
    private String grno;
	private String firstname;
	private String lastname;
	private String fathername;
	private String mothername;
	private String mobileno;
	private long aadharno;
	private String email;
	private String tellphno;
	private String parmanent_addr;
	private String local_addr;
	private String status;
	private String joiningdate;
	private String dob;
	private String classid;
	
	
	public String getClassid() {
		return classid;
	}
	public void setClassid(String classid) {
		this.classid = classid;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getJoiningdate() {
		return joiningdate;
	}
	public void setJoiningdate(String joiningdate) {
		this.joiningdate = joiningdate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getFathername() {
		return fathername;
	}
	public void setFathername(String fathername) {
		this.fathername = fathername;
	}
	public String getMothername() {
		return mothername;
	}
	public void setMothername(String mothername) {
		this.mothername = mothername;
	}
	public String getMobileno() {
		return mobileno;
	}
	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}
	public long getAadharno() {
		return aadharno;
	}
	public void setAadharno(long aadharno) {
		this.aadharno = aadharno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTellphno() {
		return tellphno;
	}
	public void setTellphno(String tellphno) {
		this.tellphno = tellphno;
	}
	public String getParmanent_addr() {
		return parmanent_addr;
	}
	public void setParmanent_addr(String parmanent_addr) {
		this.parmanent_addr = parmanent_addr;
	}
	public String getLocal_addr() {
		return local_addr;
	}
	public void setLocal_addr(String local_addr) {
		this.local_addr = local_addr;
	}
	public Integer getStudentId() {
		return studentId;
	}
	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}
	public String getGrno() {
		return grno;
	}
	public void setGrno(String grno) {
		this.grno = grno;
	}
	@Override
	public String toString() {
		return "Student [studentId=" + studentId + ", grno=" + grno + ", firstname=" + firstname + ", lastname="
				+ lastname + ", fathername=" + fathername + ", mothername=" + mothername + ", mobileno=" + mobileno
				+ ", aadharno=" + aadharno + ", email=" + email + ", tellphno=" + tellphno + ", parmanent_addr="
				+ parmanent_addr + ", local_addr=" + local_addr + ", status=" + status + ", division=" +classid + "]";
	}

}
