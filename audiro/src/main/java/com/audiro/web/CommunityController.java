package com.audiro.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.audiro.dto.CommunityPostListDto;
import com.audiro.dto.CommunityRankingDto;
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
		log.debug(allListNew.toString());
		List<CommunityPostListDto> allListGood = communityService.readEntirePostGoodDesc();
		log.debug(allListGood.toString());
		//여행 메이트 게시판 최신순/인기순
		List<CommunityPostListDto> mateListNew = communityService.readMatePostCreateTimeDesc();
		log.debug(mateListNew.toString());
		List<CommunityPostListDto> mateListGood = communityService.readMatePostGoodDesc();
		log.debug(mateListGood.toString());
		//자유 게시판 최신순/인기순
		List<CommunityPostListDto> freeListNew = communityService.readFreePostCreateTimeDesc();
		log.debug(freeListNew.toString());
		List<CommunityPostListDto> freeListGood = communityService.readFreePostGoodDesc();
		log.debug(freeListGood.toString());
		
		model.addAttribute("allListNew",allListNew);
		model.addAttribute("allListGood",allListGood);
		model.addAttribute("mateListNew",mateListNew);
		model.addAttribute("mateListGood",mateListGood);
		model.addAttribute("freeListNew",freeListNew);
		model.addAttribute("freeListGood",freeListGood);
		
		
	}
	
	//TODO : main test ------------------------------------------------시작
	@GetMapping("/maintest")
	public void maintest(Model model) {
		log.debug("maintest()");
		//전체 게시판 최신순/인기순
		List<CommunityPostListDto> allListNew = communityService.readEntirePostCreateTimeDesc();
		log.debug(allListNew.toString());
		List<CommunityPostListDto> allListGood = communityService.readEntirePostGoodDesc();
		log.debug(allListGood.toString());
		//여행 메이트 게시판 최신순/인기순
		List<CommunityPostListDto> mateListNew = communityService.readMatePostCreateTimeDesc();
		log.debug(mateListNew.toString());
		List<CommunityPostListDto> mateListGood = communityService.readMatePostGoodDesc();
		log.debug(mateListGood.toString());
		//자유 게시판 최신순/인기순
		List<CommunityPostListDto> freeListNew = communityService.readFreePostCreateTimeDesc();
		log.debug(freeListNew.toString());
		List<CommunityPostListDto> freeListGood = communityService.readFreePostGoodDesc();
		log.debug(freeListGood.toString());
		
		model.addAttribute("allListNew",allListNew);
		model.addAttribute("allListGood",allListGood);
		model.addAttribute("mateListNew",mateListNew);
		model.addAttribute("mateListGood",mateListGood);
		model.addAttribute("freeListNew",freeListNew);
		model.addAttribute("freeListGood",freeListGood);
		
		
	}
	
	
	@GetMapping("/maintest3")
	public void maintest3(Model model) {
		log.debug("maintest3()");
		//전체 게시판 최신순/인기순
		List<CommunityPostListDto> allListNew = communityService.readEntirePostCreateTimeDesc();
		log.debug(allListNew.toString());
		List<CommunityPostListDto> allListGood = communityService.readEntirePostGoodDesc();
		log.debug(allListGood.toString());
		//여행 메이트 게시판 최신순/인기순
		List<CommunityPostListDto> mateListNew = communityService.readMatePostCreateTimeDesc();
		log.debug(mateListNew.toString());
		List<CommunityPostListDto> mateListGood = communityService.readMatePostGoodDesc();
		log.debug(mateListGood.toString());
		//자유 게시판 최신순/인기순
		List<CommunityPostListDto> freeListNew = communityService.readFreePostCreateTimeDesc();
		log.debug(freeListNew.toString());
		List<CommunityPostListDto> freeListGood = communityService.readFreePostGoodDesc();
		log.debug(freeListGood.toString());
		
		model.addAttribute("allListNew",allListNew);
		model.addAttribute("allListGood",allListGood);
		model.addAttribute("mateListNew",mateListNew);
		model.addAttribute("mateListGood",mateListGood);
		model.addAttribute("freeListNew",freeListNew);
		model.addAttribute("freeListGood",freeListGood);
		
		//랭킹
		List<CommunityRankingDto> userLikeTop3List = communityService.readRankingLikeUserTop3();
		model.addAttribute("userLikeTop3List", userLikeTop3List);
		
	}
	//main test ------------------------------------------------끝
	
	
}//컨트롤러 클레스 끝
