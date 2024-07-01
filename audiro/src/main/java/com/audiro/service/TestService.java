package com.audiro.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.audiro.repository.Post;
import com.audiro.repository.TestDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor  // final 필드들을 초기화하는 아규먼트를 갖는 생성자->의존성 주입하려고 사용
public class TestService {
    private final TestDao testDao; // 의존성 주입

    /**
     * 특정 페이지와 페이지 크기를 기반으로 데이터를 가져오는 메서드
     * @param page - 현재 페이지 번호
     * @param pageSize - 페이지당 항목 수
     * @return 페이징된 데이터 리스트
     */
    public List<Post> getPagedPosts(int page, int pageSize) {
        int offset = (page - 1) * pageSize; // 시작 행 번호를 계산합니다.
        return testDao.selectPagedCommunutyPosts(offset, pageSize); // DAO 인터페이스를 호출하여 데이터를 가져옵니다.
    }

    /**
     * 총 게시물 수를 가져오는 메서드
     * @return 총 게시물 수
     */
    public int getTotalPostCount() {
        return testDao.countPosts(); // DAO 인터페이스를 호출하여 총 게시물 수를 가져옵니다.
    }
}
