package com.jsoft.hjic.controller;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jsoft.hjic.model.Users;
import com.jsoft.hjic.service.LoginService;

@Controller
@RequestMapping("login")
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	public LoginService loginService;

	
	@RequestMapping(method = RequestMethod.GET)
	public String showForm(HttpServletRequest request, Map model) {
		System.out.println("LoginController.showForm()");
		logger.info("SHOW LOGIN PAGE");
		Users user = new Users();
		model.put("login", user);
		return "login";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String processForm(@Valid Users user, BindingResult result, Map model, HttpServletRequest request) {

		if (result.hasErrors()) {
			return "login";
		}
		logger.info("check login");
		/*
		 * String userName = "UserName"; String password = "password"; loginForm
		 * = (LoginForm) model.get("loginForm"); if
		 * (!loginForm.getUserName().equals(userName) ||
		 * !loginForm.getPassword().equals(password)) { return "loginform"; }
		 */
		/*
		 * Enumeration<String> attributeNames =
		 * request.getSession().getAttributeNames();
		 * System.out.println(attributeNames); while
		 * (attributeNames.hasMoreElements()) { String string = (String)
		 * attributeNames.nextElement(); System.out.println("Sessions="+string);
		 * 
		 * }
		 */

		/*
		 * Users
		 * userFromSession=(Users)request.getSession().getAttribute("User");
		 * 
		 * System.out.println("UserFrom Session="+userFromSession);
		 * if(null!=userFromSession){ System.out.println("UserFrom Session Id="
		 * +userFromSession.getUserName()); }
		 */

		Users loginUser = loginService.checkLogin(user);
		/*
		 * try { Thread.sleep(1000); } catch (InterruptedException e) { // TODO
		 * Auto-generated catch block e.printStackTrace(); }
		 */
		if (null != loginUser && null != loginUser.getId()) {
			logger.info("login success");

			HttpSession session = request.getSession(true);
			session.setAttribute("User", loginUser);
			
			//Handle multiple sessions
			// System.out.println(loginUser.isAlreadyLoggedIn());
			logger.warn("login from Other machine=" + loginUser.isAlreadyLoggedIn());
			if (loginUser.isAlreadyLoggedIn()) {
				logger.warn("This user have already Logged in from diffrent system");
				model.put("Error", "This user have already Logged in from diffrent system");
				model.put("login", user);
				return "login";
			}
			//End
			
			session.setAttribute("loginTime", new Date());
			//setTasks(model, loginUser);

			// Users
			// userFromSession1=(Users)request.getSession().getAttribute("User");
			// System.out.println(userFromSession1);

			model.put("login", loginUser);
			return "home";
		} else {
			logger.info("login failed");
			model.put("Error", "Invalid User Name");
			model.put("login", user);
			return "login";
		}
	}

/*	private void setTasks(Map model, Users loginUser) {
		if (ApplicationConstants.USER_LEVEL.CHECKER.equalsIgnoreCase(loginUser.getUserLevel())) {
			logger.info("CHECKER USER");
			FileHeader fileHeader = new FileHeader();
			List<FileHeader> fileheadersInitiated = uploadService
					.getFileDetailsByStatus(ApplicationConstants.FILE_STATUS.INITIATED);
			List<FileHeader> fileheadersApproveNReject = uploadService.getFileDetailsByStatus(
					ApplicationConstants.FILE_STATUS.APPROVED, ApplicationConstants.FILE_STATUS.REJECTED);

			model.put("fileListInitiated", fileheadersInitiated);
			model.put("fileListApprovNReject", fileheadersApproveNReject);
			// model.addAttribute("months", getMonths());
			// model.addAttribute("mode", "UPLOAD");

		}
	}*/

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, Map model) {
		logger.info("Show logout page");

		request.getSession().invalidate();
		return "logOut";
	}

	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Map model) {

		Users usersFromSession = (Users) request.getSession().getAttribute("User");
		//setTasks(model, usersFromSession);
		logger.info("Show home page");
		return "home";
	}
}