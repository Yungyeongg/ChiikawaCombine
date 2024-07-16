package org.zerock.mapper;

import org.zerock.domain.User;

public interface UserMapper {
	   
		public int insertUser(User user); // 회원 가입 // insert는 int반환타입으로 하면 건수를 반환한다
	    
	    public boolean selectId(String mem_id); // 중복 Id 검색
	    
	    public User getUserInfo(String mem_id); // 회원 정보 조회
	    
	    public void updateUser(User user); // 회원 정보 수정
	    
	    public void memOut(String mem_id); // 회원 탈퇴
	    
	    public User findId(User user); // 회원 아이디 찾기
	    
	    public int pwdCheck(User user); // 회원 비밀번호 찾기 1. 유효성 검사
	    
	    public int pwdUpdate(User user); // 회원 비밀번호 찾기 2. 새로 발급된 비밀번호 업데이트
}
