package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;

public interface BoardMapper {
	
	public void insert(BoardVO boardVO);
	
	public List<BoardVO> list(SearchCriteria scri); 
	
	public int listCount(SearchCriteria scri) throws Exception;
		
	public int update(BoardVO boardVO);
	
	public int delete(int bno);
	
	public BoardVO read(int bno);

	public List<BoardVO> listPage(Criteria cri);
	
	
}
