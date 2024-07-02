package com.audiro.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.audiro.repository.Post;

import com.audiro.service.PagingService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping
public class PagingRestController {

	private final PagingService pagingService;
	
    @GetMapping("/community/api/posts")
    public Map<String, Object> getPosts(@RequestParam(defaultValue = "1") int page) {
        int pageSize = 10;
        List<Post> posts = pagingService.getSelectPagingNewOrderByIdDesc(page, pageSize);
        int totalPages = pagingService.getTotalPages(pageSize);

        Map<String, Object> response = new HashMap<>();
        response.put("posts", posts);
        response.put("totalPages", totalPages);

        return response;
    }
}
