package org.zerock.mapper;

import java.util.Collection;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.StoreDTO;

@Mapper
public interface StoreMapper {
	
	public List<StoreDTO> getListStore(); //전체 목록
	public int insertReview(StoreDTO store); //리뷰 등록
	public int updateReview(StoreDTO store); //리뷰 수정
	public int deleteReview(int sno); //리뷰 삭제
	
	public List<StoreDTO> getListCa(String category);
	public List<StoreDTO> getCategory(); //카테고리 목록
	

	public StoreDTO read(int sno); //게시글 읽기
	
	public List<StoreDTO> getListWithPaging(Criteria cri); //페이징처리 전체목록
	public List<StoreDTO> getListWithPagingCategory(@Param("category")String category, @Param("cri")Criteria cri); //페이징처리 카테고리별 목록
	
	public int getTotalCount(Criteria cri); //데이터 개수 처리
	public int getTotalCountCategory(@Param("category")String category, @Param("cri")Criteria cri); //데이터 개수 처리 카테고리별
	
	public List<StoreDTO> getListRatingDesc(Criteria cri);
	public List<StoreDTO> getListRatingDescCategory(@Param("category")String category, @Param("cri")Criteria cri);
	
	
	

}
