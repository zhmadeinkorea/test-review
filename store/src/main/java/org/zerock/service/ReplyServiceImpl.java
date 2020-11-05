package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.ReplyDTO;
import org.zerock.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {
	
	private ReplyMapper mapper;
	
	
	
	@Override
	public List<ReplyDTO> getListReply() {
		log.info("getListReply.............");
		return mapper.getListReply();
		
	}

	@Override
	public void addReply(ReplyDTO reply) {
		log.info("add Reply.............");
		mapper.insertReply(reply);
		
	}
	
	

}
