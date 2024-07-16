package org.zerock.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.zerock.domain.User;
import org.zerock.service.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	//get 로그인 페이지 요청
	 @GetMapping("/doLogin")
    public String login() {
        return "loginForm";
    }
	 
	// 로그인 버튼 눌렀을 때
    @PostMapping("/endLogin")
    public String login(HttpServletRequest request) {
        String id = request.getParameter("mem_id");
        String pw = request.getParameter("mem_pwd");
        User user = new User();
        user.setMem_id(id);
        user.setMem_pwd(pw);
        //System.out.println("id:" + id + "pw: " + pw);
        	user = loginService.login(user);
        if(user!=null && user.getMem_id()!=null) {
        	HttpSession session = request.getSession();
        	session.setAttribute("mem_id", user.getMem_id()); // 세션에 id를 저장해놓고 저장된 id로 select를 통해 회원 정보를 조회한다.
        	return "afterLogin";
        }
        else {
            // 로그인 실패 시
            return "loginForm";
        }
    }
    
    
    //헤더 홈으로 가는 버튼
    @GetMapping("/endLogin")
    public String goToHome() {
        
        	return "afterLogin";
        }
        
    
    
    
    	// 로그아웃
    	@GetMapping("/logout") 
    	public String logout(HttpServletRequest request) {
    		HttpSession session = request.getSession();
    		if(session.getAttribute("mem_id") != null) {
    			session.removeAttribute("mem_id");
    		}
    		session.invalidate();
    		return "loginForm";
    	}
    }