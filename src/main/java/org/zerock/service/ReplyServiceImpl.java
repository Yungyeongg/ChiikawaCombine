package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyMapper reply;

	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		
		return reply.readReply(bno);
	}

	@Override
	@Transactional
	public void writeReply(ReplyVO vo) throws Exception {
		
		reply.writeReply(vo);
		
	}

	@Override
	@Transactional
	public void updateReply(ReplyVO vo) throws Exception {
		
		reply.updateReply(vo);
		
	}

	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		
		reply.deleteReply(vo);
		
	}

	@Override
	public ReplyVO selectReply(int rno) throws Exception {
		
		return reply.selectReply(rno);
	}

}
