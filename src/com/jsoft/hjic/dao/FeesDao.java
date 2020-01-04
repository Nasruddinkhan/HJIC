package com.jsoft.hjic.dao;

import java.util.List;

import com.jsoft.hjic.model.FeeDetail;
import com.jsoft.hjic.model.FeesBean;
import com.jsoft.hjic.model.MasterFeeBean;

public interface FeesDao {
	FeeDetail getFeesDetails(String grno);
	void saveFeesDetails(FeesBean feesbean);
	FeeDetail getStudentDetails( String rollNo);
	String saveFeesMasterDetails(MasterFeeBean masterFeeBean);
	List<MasterFeeBean> getFeesMasterDtl();
	int deleteFeesMasterByClassId(String classId,String medium);
}
