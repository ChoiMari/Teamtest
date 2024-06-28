package com.audiro.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.audiro.dto.CommunityPostListDto;
import com.audiro.dto.CommunityRankingDto;
import com.audiro.repository.CommunityDao;
import com.audiro.repository.Post;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor  // final 필드들을 초기화하는 아규먼트를 갖는 생성자->의존성 주입하려고 사용
public class CommunityService {
	
	private final CommunityDao communityDao;//->의존성 주입
	
	//-----게시판 : 전체/여행메이트/자유 게시판 목록 불러오기 시작 ------
	//전체 게시판 목록 dao에서 최신순으로 가져옴
	public List<CommunityPostListDto> readEntirePostCreateTimeDesc(){ //select 해온걸 dto타입으로 변환
		log.debug("readTotalPostEntire()");
		List<Post> list = communityDao.selectEntireOrderByCreatedTimeDesc();
		log.debug(list.toString());
		return list.stream()
				.map(CommunityPostListDto::fromEntity)
				.toList();
	}
	
	//전체 게시판 목록 dao에서 인기순으로 가져옴
	public List<CommunityPostListDto> readEntirePostGoodDesc(){
		log.debug("readEntirePostGood()");
		List<Post> list = communityDao.selectEntireOrderByGoodDesc();
		log.debug(list.toString());
		return list.stream()
				.map(CommunityPostListDto::fromEntity)
				.toList();
	}
	
	//여행 메이트 게시판 목록 dao에서 최신순으로 가져옴
	public List<CommunityPostListDto> readMatePostCreateTimeDesc(){
		log.debug("readMatePostCreateTimeDesc()");
		List<Post> list = communityDao.selectMateOrderByCreatedTimeDesc();
		log.debug(list.toString());
		return list.stream()
				.map(CommunityPostListDto::fromEntity)
				.toList();		
	}
	
	//여행 메이트 게시판 목록 dao에서 인기순으로 가져옴
	public List<CommunityPostListDto> readMatePostGoodDesc(){
		log.debug("readMatePostGoodDesc()");
		List<Post> list = communityDao.selectMateOrderByGoodDesc();
		log.debug(list.toString());
		return list.stream()
				.map(CommunityPostListDto::fromEntity)
				.toList();		
	}
	
	//자유 게시판 목록 dao에서 최신순으로 가져옴
	public List<CommunityPostListDto> readFreePostCreateTimeDesc(){
		log.debug("readFreePostCreateTimeDesc()");
		List<Post> list = communityDao.selectFreeOrderByCreatedTimeDesc();
		log.debug(list.toString());
		return list.stream()
				.map(CommunityPostListDto::fromEntity)
				.toList();		
	}
	
	//자유 게시판 목록 dao에서 인기순으로 가져옴
	public List<CommunityPostListDto> readFreePostGoodDesc(){
		log.debug("readFreePostCreateTimeDesc()");
		List<Post> list = communityDao.selectFreeOrderByGoodDesc();
		log.debug(list.toString());
		return list.stream()
				.map(CommunityPostListDto::fromEntity)
				.toList();		
	}
	//-----게시판 : 전체/여행메이트/자유 게시판 목록 불러오기 끝 ------
	
	//랭킹
	public List<CommunityRankingDto> readRankingLikeUserTop3() {
		log.debug("readRankingLikeUserTop3()");
		List<CommunityRankingDto> list = communityDao.selectLikeUserTop3();
		log.debug(list.toString());
		return list;
		
	}
	

}
