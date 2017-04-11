package com.sb.springsecurity.service.impl;

import com.sb.springsecurity.dao.UserDao;
import com.sb.springsecurity.model.User;
import com.sb.springsecurity.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

	private final UserDao dao;

	@Autowired
	public UserServiceImpl(UserDao dao) {
		this.dao = dao;
	}

	public User findById(int id) {
		return dao.findById(id);
	}

	public User findBySso(String sso) {
		return dao.findBySSO(sso);
	}

}
