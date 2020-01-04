package com.jsoft.hjic.dao;

import java.util.List;

import com.jsoft.hjic.model.Users;

public interface UserDao {
public void saveUser(Users user);
public int deleteUserById(int userId);
public Users getUserById(int userId);
public List<Users> getUsers();

Users getUserCriteria(Users user);
int updatePassword(Users user);

}
