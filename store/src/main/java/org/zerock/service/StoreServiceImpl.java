package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.StoreDTO;
import org.zerock.mapper.StoreMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class StoreServiceImpl implements StoreService {
	
	private StoreMapper mapper;
	
	@Override
	public List<StoreDTO> getListStore(Criteria cri) {
		log.info("get List with criteria : " + cri);
		//return mapper.getListStore();
		return mapper.getListWithPaging(cri);
	}
	

	@Override
	public List<StoreDTO> getListStoreCategory(String category, Criteria cri) {
		log.info("get List with criteria&category............");
		return mapper.getListWithPagingCategory(category, cri);
	}

	@Override
	public void addReview(StoreDTO store) {
		log.info("add Review..............");
		mapper.insertReview(store);
	}

	@Override
	public boolean modifyReview(StoreDTO store) {
		log.info("modify..............." + store);
		return mapper.updateReview(store) == 1;
	}

	@Override
	public boolean removeReview(int sno) {
		log.info("remove......." + sno);
		return mapper.deleteReview(sno) == 1;
		
		
	}

	@Override
	public List<StoreDTO> getListStoreCa(String category) {
		log.info("getList............");
		return mapper.getListCa(category);
	}

	
	@Override
	public List<StoreDTO> getListCategory(){
		return mapper.getCategory();
		
	}

	@Override
	public StoreDTO get(int sno) {
		log.info("get..........." + sno);
		return mapper.read(sno);
	}

	
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
		
	}

	@Override
	public int getTotalCategory(String category, Criteria cri) {
		log.info("get total count category");
		return mapper.getTotalCountCategory(category, cri);
		
	}


	@Override
	public List<StoreDTO> getRatingDesc(Criteria cri) {
		log.info("get List Rating desc............");
		return mapper.getListRatingDesc(cri);
	}

	@Override
	public List<StoreDTO> getRatingDescCategory(String category, Criteria cri){
		log.info("get List Rating Desc Category.............");
		return mapper.getListRatingDescCategory(category, cri);
		
	}

}
