package com.jsoft.hjic.service;

import java.util.List;

import com.jsoft.hjic.model.FeeDetail;
import com.jsoft.hjic.model.FeesBean;
import com.jsoft.hjic.model.MasterFeeBean;
public interface FeesService {
	FeeDetail getFeesDetails(String grno);
		void saveFeesDetails(FeesBean feesbean);
		FeeDetail getStudentDetails( String rollNo);
		List<MasterFeeBean> getFeesMasterDtl();
		String saveFeesMasterDetails(MasterFeeBean masterFeeBean );
		int deleteFeesMasterByClassId(String classId,String medium);
}
