package com.jsoft.hjic.controller;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jsoft.hjic.model.Student;
import com.jsoft.hjic.model.StudentSearch;
import com.jsoft.hjic.service.CommonService;
import com.jsoft.hjic.service.StudentService;

@Controller
@RequestMapping(value = "/student")
public class StudentController {
	Logger logger = Logger.getLogger(StudentController.class);
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private CommonService commonService;

	@RequestMapping(value = "/students",  method = {RequestMethod.GET, RequestMethod.POST})
	public String getAllStudents(Model model, @ModelAttribute Student student,  @ModelAttribute StudentSearch studentSearch) {
		System.out.println("StudentController.getAllStudents()");
		List<Student> students = studentService.getStudents();
		model.addAttribute("studentList", students);
		model.addAttribute("studentDivision", getAllClass());
		return "student";
	}
	@RequestMapping(value = "/studentsSearch",  method =  RequestMethod.POST)
	public String getSearchStudents(Model model, @ModelAttribute("studentSearch") StudentSearch student) {
		System.out.println("StudentController.getSearchStudents() ["+student+"]");
		List<Student> students = null;
		try {
			 students = studentService.getStudent(student);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("studentList", students);
		model.addAttribute("studentDivision", getAllClass());
		return "student";
	}
	
	
	@RequestMapping(value = "/showStudentPage", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView showFeesForm(@ModelAttribute("student") Student student,
			BindingResult result) {
		ModelAndView mv = new ModelAndView("add_student");
		System.out.println( "hbhjbmnbnmbmnb"+getAllClass());
		mv.addObject("studentDivision", getAllClass());
		return mv;
	}
	
	@RequestMapping(value = "/saveStudent", method = RequestMethod.POST)
	public String saveStudent(
			HttpServletRequest req, Model model,
			@ModelAttribute("student") Student student, BindingResult result) {
		System.out.println("student ["+student);
		if (null == student.getStudentId() || 0 == student.getStudentId()){
			studentService.saveStudent(student);
			model.addAttribute("message", "Student added succesfully");
			return "forward:/student/students.do";
		}
		else{
			studentService.update(student);
			System.out.println(student.getStudentId());
			model.addAttribute("message", "Student updated succesfully");
			return "forward:/student/students.do";
		}
	}
	
	@RequestMapping(value = "/deleteStudent/{studentid}", method = RequestMethod.GET)
	public String deleteStudent(Model model, @PathVariable("studentid") int studentid) {
		System.out.println("StudentController.deleteStudent()" + studentid);
		int deleteStudentId = studentService.deleteStudentById(studentid);
		if (deleteStudentId == 0)
			model.addAttribute("message", "User not deleted successfully");
		else
			model.addAttribute("message", "User deleted successfully");
		return "forward:/student/students.do";
	}
	@RequestMapping(value = "/viewStudent/{studentid}", method = RequestMethod.GET)
	public ModelAndView viewUser(@PathVariable("studentid") Integer studentId,
			ModelMap map) {
		Student studentById = studentService.getStudentById(studentId);
		ModelAndView mv = new ModelAndView("view_students");
		mv.addObject(studentById);
		return mv;
	}
	@RequestMapping(value = "/editStudentById/{studentid}", method = RequestMethod.GET)
	public ModelAndView editVehicleById(@PathVariable("studentid") Integer studentid,
			ModelMap map) {
		Student studentById = studentService.getStudentById(studentid);
		ModelAndView mv = new ModelAndView("add_student");
		mv.addObject(studentById);
		mv.addObject("studentDivision", getAllClass());
		return mv;
	}

	@RequestMapping(value = "/checkGrNO", method = RequestMethod.POST, headers = "Accept=*/*")
	public @ResponseBody boolean checkGRNo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String grno = request.getParameter("grno");
		boolean checkGrno = studentService.checkGRNO( grno);
		System.out.println("StudentController.checkGRNo() ::: ["+checkGrno+"]");
		return checkGrno;

	}

	public List<String> getAllClass() {
		// TODO Auto-generated method stub
		return commonService.getAllClass();
	}

}
