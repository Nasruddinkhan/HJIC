package com.jsoft.hjic.dao;

import java.util.List;
import java.util.Map;

import com.jsoft.hjic.model.ApplicantTypeLookup;
import com.jsoft.hjic.model.Department;

public interface CommonDao {

	List<Department> getDepartments();

	List<ApplicantTypeLookup> getApplicantTypeLookup();
	
	Map<Integer, String> getCourseDetail();
	public List<String> getAllClass();
}
