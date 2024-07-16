package org.zerock.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.BookVO;
import org.zerock.service.BookService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/book/")
@RestController
@Log4j
@AllArgsConstructor
public class BookRestController {
	
	private BookService bookService;
	
	@PostMapping(
			value = "/getSuiteCount"
			, consumes = "application/json"
			, produces = { MediaType.APPLICATION_JSON_UTF8_VALUE }
			)
	public ResponseEntity<Map> getSuiteCount(@RequestBody BookVO vo) {
		
		int count = bookService.getBookedCount(vo);
		Map map = new HashMap();
		map.put("count",count);

		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	@PostMapping(
			value = "/getStandardCount"
			, consumes = "application/json"
			, produces = { MediaType.APPLICATION_JSON_UTF8_VALUE }
			)
	public ResponseEntity<Map> getStandardCount(@RequestBody BookVO vo) {
		
		int count = bookService.getBookedCount(vo);
		Map map = new HashMap();
		map.put("count",count);

		return new ResponseEntity<>(map, HttpStatus.OK);
	}

}
