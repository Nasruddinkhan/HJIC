package com.jsoft.hjic.serviceimpl;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jsoft.hjic.dao.StudentDao;
import com.jsoft.hjic.model.Student;
import com.jsoft.hjic.model.StudentSearch;
import com.jsoft.hjic.service.StudentService;

@Service("StudentService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, value = "mySQLTransactionManager")
public class StudentServiceImpl implements StudentService {
	@Autowired
	private StudentDao studentDao;

	@Override
	public List<Student> getStudent(StudentSearch studentSearch) throws ParseException {
		return studentDao.getStudent(studentSearch);
	}

	@Override
	public void saveStudent(Student student) {
		// TODO Auto-generated method stub
		studentDao.saveStudent(student);
	}

	@Override
	public List<Student> getStudents() {
		// TODO Auto-generated method stub
		return studentDao.getStudents();
	}



	@Override
	public int deleteStudentById(int studentId) {
		// TODO Auto-generated method stub
		return studentDao.deleteStudentById(studentId);
	}

	@Override
	public Student getStudentById(Integer studentId) {
		// TODO Auto-generated method stub
		return studentDao.getStudentById(studentId);
	}

	@Override
	public void update(Student student) {
		studentDao.update(student);
		
	}

	@Override
	public boolean checkGRNO(String grno) {
		// TODO Auto-generated method stub
		boolean  isError = false;
		int row = studentDao.checkGRNO(grno);
		if (row >0)
			isError = true;
		else
			isError = false;
		return isError;
	}

}
