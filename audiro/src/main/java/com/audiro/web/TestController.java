package com.audiro.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.audiro.repository.Post;
import com.audiro.service.TestService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor //-> final 필드들을 초기화하는 생성자.의존성 주입
@Controller
@RequestMapping("/community")
public class TestController {
    private final TestService testService;

    /**
     * 특정 페이지의 게시물 목록을 가져오는 메서드
     * @param pageNumber - 요청된 페이지 번호
     * @param model - JSP로 데이터를 전달하는 모델 객체
     * @return JSP 파일 이름 (community/test.jsp)
     */
    @RequestMapping("/maintest/{pageNumber}")
    public String getPagedPosts(@PathVariable("pageNumber") int pageNumber, Model model) {
        log.debug("getPagedPosts()");
        log.debug("pageNumber: {}", pageNumber);

        int pageSize = 20; // 한 페이지당 게시물 수
        List<Post> posts = testService.getPagedPosts(pageNumber, pageSize); // 서비스 클래스를 호출하여 데이터를 가져옵니다
        log.debug("posts: {}", posts);

        int totalPosts = testService.getTotalPostCount(); // 총 게시물 수를 가져옵니다
        log.debug("totalPosts: {}", totalPosts);

        // 모델에 데이터를 추가합니다.
        model.addAttribute("posts", posts); // 현재 페이지의 게시물 리스트
        model.addAttribute("currentPage", pageNumber); // 현재 페이지 번호
        model.addAttribute("totalPages", (int) Math.ceil((double) totalPosts / pageSize)); // 총 페이지 수 계산

        return "community/test"; // community/test.jsp 파일로 이동합니다
    }
    
}


