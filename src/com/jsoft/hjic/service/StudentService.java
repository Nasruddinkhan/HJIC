package com.jsoft.hjic.service;

import java.text.ParseException;
import java.util.List;

import com.jsoft.hjic.model.Student;
import com.jsoft.hjic.model.StudentSearch;


public interface StudentService {
	public List<Student> getStudent(StudentSearch studentSearch) throws ParseException;
	public void saveStudent(Student student);
	public List<Student> getStudents();
	public int deleteStudentById(int studentId);
	public Student getStudentById(Integer studentId);
	public void update(Student student);
	public boolean checkGRNO(String grno);
}
