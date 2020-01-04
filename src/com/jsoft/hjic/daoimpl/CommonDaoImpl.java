package com.jsoft.hjic.daoimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.jsoft.hjic.dao.CommonDao;
import com.jsoft.hjic.model.ApplicantTypeLookup;
import com.jsoft.hjic.model.Department;

@Repository("CommonDao")
public class CommonDaoImpl implements CommonDao {
	//Changes for oracle connection 
	@Autowired
	@Qualifier(value="mySQLSessionFactory")
	private SessionFactory sessionFactory;

	
	@Override
	public List<Department> getDepartments() {		
		String hqlC="from Department c";
		Query createQuery = sessionFactory.getCurrentSession().createQuery(hqlC);		
		return createQuery.list();
	}
	
	@Override
	public List<ApplicantTypeLookup> getApplicantTypeLookup() {		
		String hqlC="from ApplicantTypeLookup c";
		Query createQuery = sessionFactory.getCurrentSession().createQuery(hqlC);		
		return createQuery.list();
	}

	@Override
	public Map<Integer, String> getCourseDetail() {
		// TODO Auto-generated method stub
		Query createQuery;
		List<List<Object>>  list = null;
		Map<Integer, String> map = null;
		try {
			System.out.println("SESSION"+ sessionFactory.getCurrentSession());
			list = sessionFactory.getCurrentSession().createSQLQuery("select classid, classname  from Fees where shoolmedium = 'H'") .setResultTransformer(Transformers.TO_LIST).list();
			System.out.println(list);
			map= new HashMap<Integer,String>();
			for(List<Object> value: list){ 
				map.put((Integer)value.get(0),(String)value.get(1));
			}
		} catch (HibernateException e) {
			// TODO Auto-generated catch block
			System.out.println("CommonDaoImpl.getCourseDetail()["+e.getMessage()+"]");
			e.printStackTrace();
		}		
		return map;
	}
	
	@Override
	public List<String> getAllClass(){
		List<List<Object>>  list = sessionFactory.getCurrentSession().createSQLQuery("SELECT CLASS_ID FROM  fees_master") .setResultTransformer(Transformers.TO_LIST).list();
		System.out.println(list);
		List<String> classList= new ArrayList<String>();
		for(List<Object> value : list){ 
			classList.add((String)value.get(0));
		}
		return classList;

	}

}
