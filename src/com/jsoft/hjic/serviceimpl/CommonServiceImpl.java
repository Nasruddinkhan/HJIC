package com.jsoft.hjic.serviceimpl;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ibm.icu.text.SimpleDateFormat;
import com.jsoft.hjic.dao.CommonDao;
import com.jsoft.hjic.model.ApplicantTypeLookup;
import com.jsoft.hjic.model.Department;
import com.jsoft.hjic.service.CommonService;
@Service("CommonService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class CommonServiceImpl implements CommonService{
	
	@Autowired
	private CommonDao commonDao;

	@Override
	public Map<Integer, String> getCities() {
		//TODO : Fetch from DB
				Map<Integer, String> map = new LinkedHashMap<Integer, String>();
				map.put(1,"Mumbai" );
				map.put(2,"Delhi" );
				return map;
	}

	@Override
	public Map<Integer, String> getStates() {
		//TODO : Fetch from DB
				Map<Integer, String> map = new LinkedHashMap<Integer, String>();
				map.put(1,"Maharashtra" );
				map.put(2,"Tamil Nadu" );
				return map;
	}
	@Override
	public List<Department> getDepartments() {
				
		return  commonDao.getDepartments();
				
	}
	@Override
	public List<ApplicantTypeLookup> getApplicantTypeLookup() {
				
		return  commonDao.getApplicantTypeLookup();
				
	}

	@Override
	public Map<String, String> getGenders() {
		//TODO : Fetch from DB
				Map<String, String> map = new LinkedHashMap<String, String>();
				map.put("MALE","MALE" );
				map.put("FEMALE","FEMALE" );
				return map;
	}
	@Override
	public Map<String, String> getRoles() {
		//TODO : Fetch from DB
				Map<String, String> map = new LinkedHashMap<String, String>();
				map.put("1","Maker/uploader" );
				map.put("2","Checker/Authorizer" );
				return map;
	}

	@Override
	public Map<Integer, String> getCourseDetail() {
		// TODO Auto-generated method stub
		return commonDao.getCourseDetail();
	}
	@Override
	public String getCurrentDateANDTime(){
		return new  SimpleDateFormat("dd-MMM-yyyy hh:mm:ss").format( new Date());
	}

	@Override
	public List<String> getAllClass() {
		// TODO Auto-generated method stub
		return commonDao.getAllClass();
	}
	
}

