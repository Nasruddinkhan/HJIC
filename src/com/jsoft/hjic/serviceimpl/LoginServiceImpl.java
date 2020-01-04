package com.jsoft.hjic.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jsoft.hjic.dao.LoginDAO;
import com.jsoft.hjic.model.Users;
import com.jsoft.hjic.service.LoginService;

@Service("LoginService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true,value="mySQLTransactionManager")
public class LoginServiceImpl implements LoginService {

	 @Autowired
	 private LoginDAO loginDAO;

	   public void setLoginDAO(LoginDAO loginDAO) {
              this.loginDAO = loginDAO;
       }
      
       public Users checkLogin(Users user){
            
              return loginDAO.checkLogin(user);
       }
}