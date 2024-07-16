package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
import org.zerock.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	

	@Autowired
	BoardMapper boardMapper;
	
	// 게시글 작성
	@Override
	@Transactional
	public void insert(BoardVO boardVO) throws Exception {
		boardMapper.insert(boardVO);
	}	
	// 게시물 목록 조회
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		return boardMapper.listPage(scri);
//		return sqlSession.selectList("BoardMapper.list");
		
	}
	// 게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.listCount(scri);
	}
	// 게시물 수정
	@Override
	@Transactional
	public void update(BoardVO boardVO) throws Exception{
		boardMapper.update(boardVO);
//		sqlSession.update("boardMapper.update", boardVO);
	}
	// 게시물 삭제
	@Override
	public void delete(int bno) throws Exception{
		boardMapper.delete(bno);
//		sqlSession.delete("boardMapper.delete", bno);
	}
	
	// 게시물 조회
	@Override
	public BoardVO read(int bno) throws Exception{
		return boardMapper.read(bno);
//		return sqlSession.selectOne("boardMapper.read", bno);
	}
	

}
