package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.User;
import org.zerock.mapper.LoginMapper;

@Service
public class LoginServiceImpl implements LoginService {	
	
	 @Autowired
	 private LoginMapper loginMapper;
	
	public User login(User user) {
		return loginMapper.login(user);
	}
}
