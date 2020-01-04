package com.jsoft.hjic.daoimpl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.jsoft.hjic.dao.StudentDao;
import com.jsoft.hjic.model.Student;
import com.jsoft.hjic.model.StudentSearch;
import com.test.Fees;
@Repository("StudentDao")
public class StudentDaoImpl implements StudentDao {
	//Changes for oracle connection
	@Resource(name = "mySQLSessionFactory")
	private SessionFactory sessionFactory;

	Logger logger = Logger.getLogger(StudentDaoImpl.class);

	@Override
	public List<Student> getStudent(StudentSearch studentSearch) throws ParseException {
		System.out.println("StudentDaoImpl.getStudent()");
		Criteria criteria = null;
		Session session = null;
		List list = null;
		try {
			String hqlC = "from Student";
			session = sessionFactory.openSession();
			java.util.Date fromDate = null;
			java.util.Date toDate = null;
			if (studentSearch.getFromDate() != null && !studentSearch.getFromDate().isEmpty()
					&& studentSearch.getToDate() != null && !studentSearch.getToDate().isEmpty()) {
				logger.info("From Date=" + studentSearch.getFromDate());
				logger.info("To Date=" + studentSearch.getToDate());
				SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
				//fromDate = sdf1.parse(studentSearch.getFromDate());
				//toDate = sdf1.parse(studentSearch.getToDate());
				logger.info("From Date=" + fromDate);
				logger.info("To Date=" + toDate);
				hqlC += " where joiningdate between :fromDate and :toDate ";
			}else{
				hqlC += " where classid = :studentClass ";
			
			}
			Query createQuery = session.createQuery(hqlC);
			if (studentSearch.getFromDate() != null && !studentSearch.getFromDate().isEmpty()
					&& studentSearch.getToDate() != null && !studentSearch.getToDate().isEmpty()) {
				createQuery.setParameter("fromDate", studentSearch.getFromDate());
				createQuery.setParameter("toDate", studentSearch.getToDate());
			}else{
				createQuery.setParameter("studentClass", studentSearch.getStudentClass());
			}

			list = createQuery.list();
			System.out.println(list);
			logger.info("list="+list.size());
		} finally {

			session.close();
		}
		System.out.println(list);

		return list;
	}

	@Override
	public void saveStudent(Student student) {
		// TODO Auto-generated method stub
		System.out.println("Save uuuuuu=>>>>>>>"+student);
		Session session=sessionFactory.getCurrentSession();
		session.save(student);
	}

	@Override
	public List<Student> getStudents() {
		// TODO Auto-generated method stub
		String hqlC = "from Student";
		return sessionFactory.getCurrentSession().createQuery(hqlC).list();
	
	}
	


	@Override
	public int deleteStudentById(int studentId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session
				.createQuery("delete Student  where studentId=:studentId");
		query.setParameter("studentId", studentId);
		return query.executeUpdate();
	}

	@Override
	public Student getStudentById(Integer studentId) {
		// TODO Auto-generated method stub
		String hqlQ = "from Student s where s.studentId=:studentId";
		Session session = sessionFactory.getCurrentSession();
		Query createQuery = session
				.createQuery(hqlQ);
		createQuery.setInteger("studentId", studentId);
		return (Student) createQuery.uniqueResult();
	}

	@Override
	public void update(Student student) {
		System.out.println("Update uuuuuu=>>>>>>>"+student);
		Session session=sessionFactory.getCurrentSession();
		Query query =	session.createQuery("update Student set grno=:grno,  firstname=:firstname, lastname=:lastname, fathername=:fathername, mothername=:mothername, mobileno=:mobileno, aadharno=:aadharno, email=:email, tellphno=:tellphno, parmanent_addr=:parmanent_addr, local_addr=:local_addr, status=:status, classid=:division where studentId=:studentId");
		query.setParameter("grno", student.getGrno());
		query.setParameter("firstname", student.getFirstname());
		query.setParameter("lastname", student.getLastname());
		query.setParameter("fathername", student.getFathername());
		query.setParameter("mothername", student.getMothername());
		query.setParameter("mobileno", student.getMobileno());
		query.setParameter("aadharno", student.getAadharno());
		query.setParameter("email", student.getEmail());
		query.setParameter("tellphno", student.getTellphno());
		query.setParameter("parmanent_addr", student.getParmanent_addr());
		query.setParameter("local_addr", student.getLocal_addr());
		query.setParameter("status", student.getStatus());
		query.setParameter("division", student.getClassid());
		query.setParameter("studentId", student.getStudentId());
		query.executeUpdate();
	}

	@Override
	public int checkGRNO(String grno) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		// rowCount Projection
		Criteria criteriaRowCount = session.createCriteria(Student.class);
		criteriaRowCount.add(Restrictions.eq("grno", grno));
		criteriaRowCount.setProjection(Projections.rowCount());
		List rowCountList = criteriaRowCount.list();
		System.out.println("Total No of Student is = " + rowCountList.get(0));
		return (int) rowCountList.get(0);
	}



	
}