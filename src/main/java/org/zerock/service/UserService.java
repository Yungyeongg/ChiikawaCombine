package org.zerock.service;

import org.zerock.domain.User;


public interface UserService {
	
	public void registerUser(User user); // 회원가입
	
	public boolean selectId(String mem_id); //중복 Id 검색
	
	public User getUserInfo(String mem_id); // 회원 정보 조회
	
	public void updateUser(User user); // 회원 정보 변경 
	
	public void memOut(String mem_id); // 회원 탈퇴
	
	public User findId(User user);	// 회원 아이디 찾기
	
	public int pwdCheck(User user);	// 회원 비밀번호 찾기 1. 유효성 검사
	
	public void pwdUpdate(User user); // 회원 비밀번호 찾기 2. 새로 발급된 비밀번호 업데이트
}
