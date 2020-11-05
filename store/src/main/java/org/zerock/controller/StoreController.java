package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.domain.StoreDTO;
import org.zerock.service.StoreService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class StoreController {
	
	private StoreService service;
	
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		log.info("list");
		int total = service.getTotal(cri);
		model.addAttribute("list", service.getListStore(cri));
		model.addAttribute("pageMaker" , new PageDTO(cri, total));
		model.addAttribute("category", service.getListCategory());
		
	}
	
	
	@GetMapping("/list2")
	public void listCategory(String category, Model model, Criteria cri) {
		log.info("list");
		int total = service.getTotalCategory(category, cri);
		model.addAttribute("category", service.getListCategory()); //상단 카테고리 메뉴 표시
		//model.addAttribute("list", service.getListStoreCa(category)); 
		model.addAttribute("list", service.getListStoreCategory(category, cri));
		model.addAttribute("pageMaker" , new PageDTO(cri, total));
		
	}
	
	@GetMapping("/list3")
	public void ratinDesc(Model model, Criteria cri) {
		log.info("rating desc..........");
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker" , new PageDTO(cri, total));
		model.addAttribute("rating", service.getRatingDesc(cri));
		
		model.addAttribute("category", service.getListCategory()); //상단 카테고리 메뉴 표시
		
		
	}
	
	@GetMapping("/list4")
	public void ratinDescCategory(String category, Model model, Criteria cri) {
		log.info("rating desc category..........");
		int total = service.getTotalCategory(category, cri);
		model.addAttribute("pageMaker" , new PageDTO(cri, total));
		model.addAttribute("rating", service.getRatingDescCategory(category, cri));
		
		model.addAttribute("category", service.getListCategory()); //상단 카테고리 메뉴 표시
	}
	
	
	@GetMapping("/register")
	public void addReview(Model model) {
		model.addAttribute("category", service.getListCategory());
	}
	
	@PostMapping("/register")
	public String addReview(StoreDTO store, RedirectAttributes rttr) {
		
		try {
			log.info("addReview"+store);
			service.addReview(store);
			rttr.addFlashAttribute("result", store.getSno());
			return "redirect:/board/list";
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board/register";
	}
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("sno") int sno, Model model, @ModelAttribute("cri")Criteria cri) {
		log.info("/get");
		model.addAttribute("store", service.get(sno));
		model.addAttribute("category", service.getListCategory());
	}
	
	@PostMapping("/modify")
	public String modify(StoreDTO store, RedirectAttributes rttr, @ModelAttribute("cri")Criteria cri, Model model) {
		model.addAttribute("category", service.getListCategory());
		try{
			log.info("modify:  " + store);
			if(service.modifyReview(store)) {
				rttr.addFlashAttribute("result","success");
				return "redirect:/board/list" + cri.getListLink();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board/list"  + cri.getListLink();
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("sno") int sno, RedirectAttributes rttr, @ModelAttribute("cri")Criteria cri) {
		log.info("remove...."+sno);
		if(service.removeReview(sno)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/board/list" + cri.getListLink();
	}
	
	
	@GetMapping("/check")
	public void check(@RequestParam("sno") int sno, RedirectAttributes rttr, Model model, @ModelAttribute("cri")Criteria cri) {
		log.info("check........." + sno);
		model.addAttribute("store", service.get(sno));
		model.addAttribute("category", service.getListCategory());
		
	}
	
	@GetMapping("/chat")
	public void chat() {
	}
	
	@GetMapping("/map")
	public void map() {
		
		
	}
}
