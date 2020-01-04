package com.jsoft.hjic.dao;

import java.text.ParseException;
import java.util.List;

import com.jsoft.hjic.model.Student;
import com.jsoft.hjic.model.StudentSearch;

public interface StudentDao {
	List<Student> getStudent(StudentSearch studentSearch) throws ParseException;
	void saveStudent(Student student);
	List<Student> getStudents();
	int deleteStudentById(int studentId);
	Student getStudentById(Integer studentId);
	public void update(Student student);
	public int checkGRNO(String grno);
}
