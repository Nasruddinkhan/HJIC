package com.jsoft.hjic.service;




import java.util.List;
import java.util.Map;

import com.jsoft.hjic.model.ApplicantTypeLookup;

public interface CommonService {
public Map<Integer, String> getCities();
public Map<Integer, String> getStates();
public List getDepartments();
Map<String, String> getGenders();
public Map getRoles();
List<ApplicantTypeLookup> getApplicantTypeLookup();
Map<Integer, String> getCourseDetail();
public String getCurrentDateANDTime();
public List<String> getAllClass();

}
