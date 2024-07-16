package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.User;
import org.zerock.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@Service
public class UserServiceImpl implements UserService {
	
	
	@Autowired
    private UserMapper userMapper;
	//BCryptPasswordEncoder pwEncoder; //암호화
	
//	public UserServiceImpl() {
//		pwEncoder = new BCryptPasswordEncoder();
//	}
	
	// 회원 가입
	@Transactional
	@Override
    public void registerUser(User user) {
		//비번 암호화하기
		//String mem_pwd = pwEncoder.encode(user.getMem_pwd());
		//user.setMem_pwd(mem_pwd); //jsp 적용
			userMapper.insertUser(user);
    }
	
	// 중복 아이디 조회
	@Transactional
	@Override
	public boolean selectId(String mem_id) {
		log.info("Service :: selectId...................");
		return userMapper.selectId(mem_id);
	}
	
	// 회원 정보 조회
	@Transactional
	@Override
	public User getUserInfo(String mem_id) {
		return userMapper.getUserInfo(mem_id);
	}
	
	// 회원 정보 변경
	@Transactional
	@Override
	public void updateUser(User user) {
		userMapper.updateUser(user);
	}
	
	// 회원 탈퇴
	@Transactional
	@Override
	 public void memOut(String mem_id) {
		userMapper.memOut(mem_id);
	}
	
	// 회원 아이디 찾기
	@Transactional
	@Override
	public User findId(User user) {
		return userMapper.findId(user);
	}
	
	// 회원 비밀번호 찾기 1. 유효성 체크
	@Transactional
	@Override
	public int pwdCheck(User user) {
		return userMapper.pwdCheck(user);
	}
	
	// 회원 비밀번호 찾기 2. 새로 발급된 비밀번호 저장
	public void pwdUpdate(User user) {
		String newUpdatePwd = user.getMem_pwd();
		user.setMem_pwd(newUpdatePwd);
		userMapper.pwdUpdate(user);
	}
}