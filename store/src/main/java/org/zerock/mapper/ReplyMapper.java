package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.zerock.domain.ReplyDTO;

@Mapper
public interface ReplyMapper {
	
	public List<ReplyDTO> getListReply(); //전체 목록
	public int insertReply(ReplyDTO reply); //리뷰 등록

}
