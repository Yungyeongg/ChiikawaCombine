package org.zerock.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.User;
import org.zerock.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor    
@RequestMapping("/user")
public class UserController {
	    @Autowired
	    private UserService userService; 
	  //  BCryptPasswordEncoder pwEncoder;	// 비밀번호 암호화
	    
	    // 홈에서 회원가입 버튼 눌렀을 때
	    @GetMapping("/register") 
	    public String showRegisterForm() {
	        return "register";
	    }
	    
	    // 회원 가입 완료 했을 때 user를 파라미터로 던져서 저장
	    @PostMapping("/register") 
	    public String registerUser(User user) {
	    	userService.registerUser(user);
	    	 return "loginForm";
	    }
	    
	  //Id 중복 확인
		@PostMapping("/ConfirmId")
		@ResponseBody
		public ResponseEntity<Boolean> confirmId(String mem_id) {
			log.info("ConfirmId.........");
			log.info("id : " + mem_id);
			//boolean result = true;
			boolean result = !mem_id.trim().isEmpty() && !userService.selectId(mem_id);
//			if(mem_id.trim().isEmpty()) {
//				log.info("id : " + mem_id);
//				result = false;
//			} else {
//				if (userService.selectId(mem_id)) {
//					result = false;
//				} else {
//					result = true;
//				}
//			}
			
			return new ResponseEntity<>(result, HttpStatus.OK);
		}

	    // 마이페이지 이동, 회원 정보 조회
	    @GetMapping("/mypage") 
	    public String goMypage(HttpServletRequest request, Model model) {
	    	 HttpSession session = request.getSession();
	    	 String mem_id = (String) session.getAttribute("mem_id");
		            User user = userService.getUserInfo(mem_id);
		            model.addAttribute("user", user);		         
	    	 //model.addAttribute("user", userService.getUserInfo(mem_id));    
	    	 return "mypage";
	    }
	    
	    // 회원 정보 변경 페이지 이동
	    @GetMapping("/goChangeMember")
	    public String changeMember(HttpServletRequest request, Model model) {
	    	 HttpSession session = request.getSession();
	    	 String mem_id = (String) session.getAttribute("mem_id");
		            User user = userService.getUserInfo(mem_id);
		            model.addAttribute("user", user);	
	    	return "memberInfo";
	    }
	    
	    // 회원 정보 변경 하기
	    @PostMapping("/updateUser")
	    public String updateUser(User user, HttpServletRequest request) {
	    	HttpSession session = request.getSession();
	    	String mem_id = (String) session.getAttribute("mem_id");
	    	
	    	if(mem_id == null) {
	    		return "loginForm"; //로그인 되지 않은 상태는 로그인 폼으로 가기
	    	}
	    	user.setMem_id(mem_id); // 세션에서 아이디를 가져와서 설정
	    	userService.updateUser(user);
	    	return "mypage"; // 수정 후 마이페이지로 가기
	    }
	    
	    // 회원 탈퇴
	    @GetMapping("/mem_out")
	    public String memOut(HttpServletRequest request) {
	    	HttpSession session = request.getSession();
	        String mem_id = (String) session.getAttribute("mem_id");
	    	if (mem_id != null) {
	    		userService.memOut(mem_id);
	 	    	session.invalidate();
	 	    	return "memOut";
	    	}
	       return "accessError";
	    }
	    
	    // 로그인 폼 -> 아이디찾기폼 으로 가기
	    @GetMapping("/goFindId")
	    public String goFindId() {
	    	return "findId";
	    }
	    
	    // 아이디 찾기 폼에서 이름, 이메일 입력 후 전송
	    @PostMapping("/findId")
		public String findId(HttpServletRequest request, Model model, User user,
				@RequestParam String mem_name, 
				@RequestParam String mem_email) {
			try {
				user.setMem_name(mem_name);
				user.setMem_email(mem_email);
				User mem_id = userService.findId(user);

				model.addAttribute("findId", mem_id);

			} catch (Exception e) {
				model.addAttribute("msg", "오류가 발생되었습니다.");
				e.printStackTrace();
			}
			return "findIdCheck";
		}
	    
	    // 비밀번호 찾기로 가기
	    @GetMapping("/goFindPwd")
	    public String findPwd() {
	    	return "findPwd";
	    }
	    
	    // 비밀번호 찾기 버튼 누른후
	    @PostMapping("/findPwd")
	    public String findPwdCheck(HttpServletRequest request, Model model,
	    		@RequestParam String mem_id, @RequestParam String mem_name, @RequestParam String mem_email,
	    		User user) {
	    	try {
	    		user.setMem_id(mem_id);
	    		user.setMem_name(mem_name);
	    		user.setMem_email(mem_email);
	    		int search = userService.pwdCheck(user);
	    		
	    		if(search == 0) {
	    			model.addAttribute("msg", "기입된 정보가 잘못되었습니다. 다시 입력해주세요.");
	    		}
	    		String newPwd = RandomStringUtils.randomAlphanumeric(10);
	    		user.setMem_pwd(newPwd);
				userService.pwdUpdate(user);
				model.addAttribute("newPwd", newPwd);
				model.addAttribute("mem_id", mem_id);
				model.addAttribute("search", search);
				
				
	    	} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", "오류가 발생되었습니다.");
			}
	    		return "findPwdCheck";
	    }
}