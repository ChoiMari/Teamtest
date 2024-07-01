package com.audiro.repository;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


public interface TestDao {

    // 총 게시물 수를 가져오는 메서드
    int countPosts();

    // 페이징된 데이터를 가져오는 메서드
    List<Post> selectPagedCommunutyPosts(@Param("offset") int offset, @Param("limit") int limit);
}
