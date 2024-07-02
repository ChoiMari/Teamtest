package com.audiro.service;

import java.util.List;

import org.springframework.stereotype.Service;


import com.audiro.repository.PagingDao;
import com.audiro.repository.Post;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor  // final 필드들을 초기화하는 아규먼트를 갖는 생성자->의존성 주입하려고 사용
public class PagingService {
	private final PagingDao pagingDao;
	
	//전체 페이지 수를 가져오는 서비스
    public int getTotalPages(int pageSize) {
    	log.debug("getTotalPages()");
    	log.debug("pageSize:{}",pageSize);
        //pagingDao를 사용하여 전체 게시물 수를 가져옵니다.
        int totalPosts = pagingDao.countPosts();
        log.debug("전체 게시물 수:{}",totalPosts);
        int resultpage = (int) Math.ceil((double) totalPosts / pageSize);
        log.debug("전체 페이지 수:{}",resultpage);
        // 전체 페이지 수를 계산하여 반환합니다.
        return (int) Math.ceil((double) totalPosts / pageSize);
    }
    
    // 특정 페이지의 게시물 목록을 가져오는 메서드입니다.
    public List<Post> getSelectPagingNewOrderByIdDesc(int page, int pageSize) {
    	//-> pageSize한 페이지당 몇 개 가져올건지 내가 컨트롤러에서 지정한 개수
    	//page는 현재 페이지.
        // 페이지 시작점을 계산합니다.
        int offset = (page - 1) * pageSize;
        // PostMapper를 사용하여 게시물 목록을 가져옵니다.
        return pagingDao.selectPagingEntireOrderByIdDesc(offset, pageSize);
    }
}
