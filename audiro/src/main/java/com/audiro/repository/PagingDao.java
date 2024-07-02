package com.audiro.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface PagingDao {//-> 구현은 mybatis가함
	//페이징 처리를 위한 총 게시글의 수를 count하는 sql를 실행하는 메서드 
	public Integer countPosts();
	//전체(여행메이트+자유게시판) 최신순으로 목록 select하는 메서드
	// 아규먼트로 페이지 시작점(offset)과 페이지 당 게시물 수(limit)를 받습니다. 
	//예) offset 0이면 1행부터 limit개 가져와라 라는 뜻 offset이 시작점. limit가 시작점부터 가져올 행의 개수
	public List<Post> selectPagingEntireOrderByIdDesc(@Param("offset") int offset, @Param("limit") int limit);
}
