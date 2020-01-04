package com.jsoft.hjic.common;

public enum TransactionStatus {
R("Rejected"),A("Approved"),I("Initiated");
	
	private String status;
	
	TransactionStatus(String status){
		this.status= status;
	}
	public String getStatus(){
		return status;
	}
}


