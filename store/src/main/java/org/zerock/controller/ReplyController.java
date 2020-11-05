package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.ReplyDTO;
import org.zerock.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class ReplyController {
	
	private ReplyService service;
	
	@GetMapping("/comment")
	public void list(Model model) {
		model.addAttribute("replyList",service.getListReply());
	}
	
	
	@GetMapping("/commentRegister")
	public String addReply(ReplyDTO reply, RedirectAttributes rttr) {
		try {
			log.info("addReview"+reply);
			service.addReply(reply);
			rttr.addFlashAttribute("result", reply.getRno());
			return "redirect:/board/comment";
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board/comment";
	}
	
	

}
