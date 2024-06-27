package com.audiro.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.audiro.dto.CommunityPostListDto;
import com.audiro.service.CommunityService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor //-> final 필드들을 초기화하는 생성자.의존성 주입
@Controller
@RequestMapping("/community")
public class CommunityController {
	
	//의존성 주입
	private final CommunityService communityService;
	
	@GetMapping("/main")
	public void main(Model model) {
		log.debug("main()");
		//전체 게시판 최신순/인기순
		List<CommunityPostListDto> allListNew = communityService.readEntirePostCreateTimeDesc();
		List<CommunityPostListDto> allListGood = communityService.readEntirePostGoodDesc();
		
		//여행 메이트 게시판 최신순/인기순
		List<CommunityPostListDto> mateListNew = communityService.readMatePostCreateTimeDesc();
		List<CommunityPostListDto> mateListGood = communityService.readMatePostGoodDesc();
		
		//자유 게시판 최신순/인기순
		List<CommunityPostListDto> freeListNew = communityService.readFreePostCreateTimeDesc();
		List<CommunityPostListDto> freeListGood = communityService.readFreePostGoodDesc();
		
		model.addAttribute("allListNew",allListNew);
		model.addAttribute("allListGood",allListGood);
		model.addAttribute("mateListNew",mateListNew);
		model.addAttribute("mateListGood",mateListGood);
		model.addAttribute("freeListNew",freeListNew);
		model.addAttribute("freeListGood",freeListGood);
		
		
	}

}
