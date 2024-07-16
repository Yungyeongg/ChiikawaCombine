package org.zerock.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.domain.ReplyVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.User;
import org.zerock.service.BoardService;
import org.zerock.service.LoginService;
import org.zerock.service.ReplyService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private LoginService loginService;

	@Autowired
	BoardService service;
	
	
	@Autowired
	ReplyService replyService;
	
	// 게시판 글 작성 화면
		@RequestMapping(value = "/writeView", method = RequestMethod.GET)
		public void writeView() throws Exception{
			logger.info("writeView");
			
		}
		
	// 게시판 글 작성
		@RequestMapping(value = "/board/write", method = RequestMethod.POST)
	
		public String insert(BoardVO boardVO, HttpServletRequest request) throws Exception{
			logger.info("write");
			
			HttpSession session = request.getSession();
			String mem_id = (String)session.getAttribute("mem_id");
			
			 
			String writer = mem_id;
			
			boardVO.setWriter(writer);
			service.insert(boardVO);

        	
			return "redirect:/board/list";
        	
        	

        	
		}
	
		
	
	// 게시글 조회
		@RequestMapping(value = "/readView", method = RequestMethod.GET)
		public String read(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model, HttpServletRequest request) throws Exception{
			logger.info("read");
			
			HttpSession session = request.getSession();
			String mem_id = (String)session.getAttribute("mem_id");
			
			
			model.addAttribute("read", service.read(boardVO.getBno()));
			model.addAttribute("scri", scri);
			model.addAttribute("mem_id", mem_id);
			List<ReplyVO> replyList = replyService.readReply(boardVO.getBno());
			model.addAttribute("replyList",replyList);
			
			return "board/readView";
		}
		
	// 게시판 목록 조회
		@RequestMapping(value = "/list", method = RequestMethod.GET)
		public String list(Model model, @ModelAttribute("scri") SearchCriteria scri, HttpServletRequest request) throws Exception{
			logger.info("list");
			
			HttpSession session = request.getSession();
			String mem_id = (String)session.getAttribute("mem_id");
//			User user = userService.getUserInfo(mem_id);
//			model.addAttribute("user", user);
			
			model.addAttribute("list",service.list(scri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(service.listCount(scri));
			
			model.addAttribute("pageMaker", pageMaker);
			
			
			
			return "board/list";
			
		}

	// 게시글 수정뷰
		@RequestMapping(value = "/updateView", method = RequestMethod.GET)
		public String updateView(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
			logger.info("updateView");
			
			model.addAttribute("update", service.read(boardVO.getBno()));
			model.addAttribute("scri", scri);
			return "board/updateView";
		}
		
		
	// 게시글 수정
	//	@ResponseBody
		@RequestMapping(value = "/update", method = RequestMethod.POST, produces = "text/html; charset=utf-8")
		public String update(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr, HttpServletRequest request) throws Exception{
			logger.info("update");
			
			//세션에서 사용자 id 가져오기
			HttpSession session = request.getSession();
			String mem_id = (String)session.getAttribute("mem_id");
			
			//게시글 작성자의 id 가져오기
			// String userName = boardVO.getUserName();
			BoardVO original = service.read(boardVO.getBno());
			String userName = original.getWriter();
			System.out.println(userName);
			
			//세션에 저장된 사용자 id와 게시글 작성자의 id 비교
			if(mem_id != null && mem_id.equals(userName)){
				
				service.update(boardVO);
				
				rttr.addAttribute("page", scri.getPage());
				rttr.addAttribute("perPageNum", scri.getPerPageNum());
				rttr.addAttribute("searchType", scri.getSearchType());
				rttr.addAttribute("keyword", scri.getKeyword());
				
				return "redirect:/board/list";
				
//				String msg = "<script type='text/javascript'>";
//			//	msg += "window.location.href='/WEB-INF/views/board/list.jsp';";
//				msg += "history.go(-3);";
//				msg += "</script>";
//				
//				return msg;
				
				
			} else {
			//권한이 없을 경우의 처리	
				rttr.addFlashAttribute("msg", "수정 권한이 없습니다.");
//				 String msg = "<script type='text/javascript'>";
//				  
//		           msg += "alert('권한이 없습니다.');";
//		       
//		        msg += "history.go(-3);"; // 이전 페이지로 돌아가기
//		        msg += "</script>";
//			
//		        	return "redirect:/board/updateView?bno=" + boardVO.getBno();
				return "redirect:/board/list";
//			return msg;
		}
			

			
			
		}
		
		// 게시글 삭제
//		@ResponseBody
		@RequestMapping(value = "/delete", method = RequestMethod.POST)
		public String delete(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr, HttpServletRequest request) throws Exception{
			
			logger.info("delete");
			
			//세션에서 사용자 id 가져오기
			HttpSession session = request.getSession();
			String mem_id = (String)session.getAttribute("mem_id");
			
			//게시글 작성자의 id 가져오기
			// String userName = boardVO.getUserName();
			BoardVO original = service.read(boardVO.getBno());
			String userName = original.getWriter();
			System.out.println(userName);
			
			//세션에 저장된 사용자 id와 게시글 작성자의 id 비교
			if(mem_id != null && mem_id.equals(userName)){
			
			service.delete(boardVO.getBno());
			
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			//@responsebody가 없을 경우 이걸로 가능
			return "redirect:/board/list";
			
			//@responsebody 때문에 이런 식으로 작성해야 함..새로고침도 필요
//			String msg = "<script type='text/javascript'>";
//			//	msg += "window.location.href='/WEB-INF/views/board/list.jsp';";
//				msg += "history.go(-3);";
//				msg += "</script>";
				
//				return msg;
			} else {
				//권한이 없을 경우의 처리	
					rttr.addFlashAttribute("msg", "수정 권한이 없습니다.");
//					 String msg = "<script type='text/javascript'>";
//					  
//			           msg += "alert('권한이 없습니다.');";
//			       
//			        msg += "history.go(-3);"; // 이전 페이지로 돌아가기
//			        msg += "</script>";
//				
//			        	return "redirect:/board/updateView?bno=" + boardVO.getBno();
//				return msg;
					return "redirect:/board/readView";
			}
		}
		
	//댓글 작성
		@RequestMapping(value="/replyWrite", method = RequestMethod.POST)
		public String replyWrite(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
			logger.info("reply Write");
			
			HttpSession session = request.getSession();
			String mem_id = (String)session.getAttribute("mem_id");
			
			 
			String writer = mem_id;
			
			vo.setWriter(writer);
			
			replyService.writeReply(vo);
			
			rttr.addAttribute("bno", vo.getBno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/board/readView";
		}
		
	//댓글 수정 GET
		@RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
		public String replyUpdateView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
			logger.info("reply Write");
			
			model.addAttribute("replyUpdate", replyService.selectReply(vo.getRno()));
			model.addAttribute("scri", scri);
			
			return "board/replyUpdateView";
			
		}
		
	//댓글 수정 POST
//		@ResponseBody
		@RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
		public String replyUpdate(ReplyVO vo, BoardVO boardVO, SearchCriteria scri, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
			logger.info("reply Write");
			
			
			//세션에서 사용자 id 가져오기
			HttpSession session = request.getSession();
			String mem_id = (String)session.getAttribute("mem_id");
			
			//댓글 작성자의 id 가져오기
			ReplyVO original = replyService.selectReply(vo.getRno());
			String userName = original.getWriter();
			System.out.println(userName);
			
			//세션에 저장된 사용자 id와 게시글 작성자의 id 비교
			if(mem_id != null && mem_id.equals(userName)){
			
			replyService.updateReply(vo);
			
			rttr.addAttribute("bno", vo.getBno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/board/readView";
			
			
//			//@responsebody 때문에 이런 식으로 작성해야 함..새로고침도 필요
//			String msg = "<script type='text/javascript'>";
//			//	msg += "window.location.href='/WEB-INF/views/board/list.jsp';";
//				msg += "history.go(-3);";
//				msg += "</script>";
//				
//				return msg;
			
		} else {
			//권한이 없을 경우의 처리	
			
//				 String msg = "<script type='text/javascript'>";
//				  
//		           msg += "alert('권한이 없습니다.');";
//		       
//		        msg += "history.go(-3);"; // 이전 페이지로 돌아가기
//		        msg += "</script>";
//			
//		        	return "redirect:/board/replyUpdateView?bno=" + boardVO.getBno();
//			return msg;
			return "redirect:/board/list";
		}
	}
		
	//댓글 삭제 GET
		@RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
		public String replyDeleteView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
			logger.info("reply Write");
			
			model.addAttribute("replyDelete", replyService.selectReply(vo.getRno()));
			model.addAttribute("scri", scri);
			

			return "board/replyDeleteView";
			
		}
		
	//댓글 삭제 POST
//		@ResponseBody
		@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
		public String replyDelete(ReplyVO vo, BoardVO boardVO, SearchCriteria scri, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
			logger.info("reply Write");
			
			//세션에서 사용자 id 가져오기
			HttpSession session = request.getSession();
			String mem_id = (String)session.getAttribute("mem_id");
			
			//댓글 작성자의 id 가져오기
			ReplyVO original = replyService.selectReply(vo.getRno());
			String userName = original.getWriter();
			System.out.println(userName);
			
			//세션에 저장된 사용자 id와 댓글 작성자의 id 비교
			if(mem_id != null && mem_id.equals(userName)){
			
			replyService.deleteReply(vo);
			
			rttr.addAttribute("bno", vo.getBno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/board/readView";
			
//			//@responsebody 때문에 이런 식으로 작성해야 함..새로고침도 필요
//			String msg = "<script type='text/javascript'>";
//			//	msg += "window.location.href='/WEB-INF/views/board/list.jsp';";
//				msg += "history.go(-3);";
//				msg += "</script>";
//				
//				return msg;
		} else {
			//권한이 없을 경우의 처리	
				rttr.addFlashAttribute("msg", "수정 권한이 없습니다.");
//				 String msg = "<script type='text/javascript'>";
//				  
//		           msg += "alert('You can't.');";
//		       
//		        msg += "history.go(-3);"; // 이전 페이지로 돌아가기
//		        msg += "</script>";
//			
//		        	return "redirect:/board/updateView?bno=" + boardVO.getBno();
//			return msg;
				return "redirect:/board/list";
		}
	}
}
