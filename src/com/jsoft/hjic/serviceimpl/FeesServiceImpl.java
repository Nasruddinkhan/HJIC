package com.jsoft.hjic.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jsoft.hjic.dao.FeesDao;
import com.jsoft.hjic.model.FeeDetail;
import com.jsoft.hjic.model.FeesBean;
import com.jsoft.hjic.model.MasterFeeBean;
import com.jsoft.hjic.service.FeesService;
@Service("FeesService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true,value="mySQLTransactionManager")
public class FeesServiceImpl implements FeesService {
	@Autowired
	FeesDao feesDao;
	@Override
	public FeeDetail getFeesDetails(String grno) {
		// TODO Auto-generated method stub
		return feesDao.getFeesDetails(grno);
	}


	@Override
	public void saveFeesDetails(FeesBean feesbean) {
		// TODO Auto-generated method stub
		feesDao.saveFeesDetails(feesbean);
		
	}


	@Override
	public FeeDetail getStudentDetails(String grno) {
		// TODO Auto-generated method stub
		return feesDao.getStudentDetails(grno);
	}


	@Override
	public List<MasterFeeBean> getFeesMasterDtl() {
		// TODO Auto-generated method stub
		return feesDao.getFeesMasterDtl();
	}


	@Override
	public String saveFeesMasterDetails(MasterFeeBean masterFeeBean) {
		// TODO Auto-generated method stub
		return feesDao.saveFeesMasterDetails(masterFeeBean);
	}


	@Override
	public int deleteFeesMasterByClassId(String classId, String medium) {
		// TODO Auto-generated method stub
		return feesDao.deleteFeesMasterByClassId(classId, medium);
	}


	


}
