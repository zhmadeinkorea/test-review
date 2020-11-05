package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.StoreDTO;

public interface StoreService {
	
	//public List<StoreDTO> getListStore();
	public void addReview(StoreDTO store);
	public boolean modifyReview(StoreDTO store);
	public boolean removeReview(int sno);
	
	public List<StoreDTO> getListStoreCa(String category); //카테고리에 해당하는 리스트
	public List<StoreDTO> getListCategory(); //카테고리 목록
	
	public StoreDTO get(int sno);
	
	public List<StoreDTO> getListStore(Criteria cri);
	public List<StoreDTO> getListStoreCategory(String category,Criteria cri);
	
	public int getTotal(Criteria cri);
	public int getTotalCategory(String category, Criteria cri);


	public List<StoreDTO> getRatingDesc(Criteria cri);
	public List<StoreDTO> getRatingDescCategory(String category, Criteria cri);
	
	
	
	
}
