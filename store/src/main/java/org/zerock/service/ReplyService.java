package org.zerock.service;

import java.util.List;

import org.zerock.domain.ReplyDTO;

public interface ReplyService {
	
	
	public List<ReplyDTO> getListReply();
	public void addReply(ReplyDTO reply);

}
