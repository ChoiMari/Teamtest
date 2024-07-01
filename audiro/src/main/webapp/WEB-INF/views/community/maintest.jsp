<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--initial-scale=1는 브라우저 기본 비율 이용 -->
<title>Community</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous">
<!-- integrity 보안 -->

</head>

<body> 
    <!-- URL 매핑 -->
    <c:url var="maintest3" value="/community/maintest3"></c:url>
    <a href="${maintest3}">test3</a>
    
    <!-- 페이지 내용 시작 -->
    <div class="container-fluid" style="width: 90%;">
        <%-- 상위 폴더로 올라가서 헤더 파일 포함 --%>
        <%-- <%@ include file="../fragments/header.jspf"%> --%>
        
        <!-- 페이지 제목 -->
        <div class="m-3 p-2">
            <h3 style="text-align: center;">
                <span class="p-2 bg-primary-subtle"> 여행 연결 고리 </span>
            </h3>
        </div>
        
        <!-- 인기 여행 후기 -->
        <div class="mb-3">
            <h5>💜인기 여행 후기 Top10💜</h5>
        </div>
        
        <!-- 게시판 제목 -->
        <div class="m-3"><h5></h5></div>

        <!-- 검색 폼 시작 -->
        <div class="ms-3 row mt-2 mb-4">
            <div class="col-md-8" style="flex: 0 0 73.5%;">
                <div style="background-color:white;">
                    <div class="card-header text-center">
                        <!-- 검색에 쓸 폼 생성 -->
                        <c:url var="postSearchPage" value="/post/search" />
                        <form method="get" action="${postSearchPage}">
                            <div class="row">
                                <!-- 부트스트랩은 기본적으로 화면을 세로로 12개로 나눔 -->
                                <!-- 12개 컬럼을 3:5:4 비율로 사용 -->
                                <div class="col-2">
                                    <select class="form-control" name="category">
                                        <option value="t">제목</option>
                                        <option value="c">내용</option>
                                        <option value="tc">제목+내용</option>
                                        <!-- and 조건이 아닌 or 조건으로 검색 -->
                                        <option value="a">작성자</option>
                                    </select>
                                </div>
                                <div class="col-8">
                                    <input type="text" class="form-control" name="keyword" placeholder="검색어 입력" required />
                                </div>
                                <div class="col-2">
                                    <input type="submit" class="form-control btn btn-outline-secondary" value="검색" />
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
                                                <!-- 버튼 목록 -->
                            <div class="col-3" style="flex: 0 0 20%;">
                                <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                    <!-- 각 버튼은 tab-pane의 id와 연결 -->
                                    <%--드롭다운탭 시작 --%>
                                    <ul class="nav nav-pills">
                                        <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">글쓰기</a>
                                            <ul class="dropdown-menu">
                                                <li><a class="dropdown-item" href="#">여행메이트 게시판</a></li>
                                                <li><a class="dropdown-item" href="#">자유 게시판</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                    <%--드롭다운탭 끝 --%>
                                </div>
                            </div>
                            <!-- 버튼 끝 -->
        </div>
        <!-- 검색 폼 끝 -->
        <!-- 전체 레이아웃을 중앙에 배치하는 row 요소 -->
        <div class="card pt-5">
        <div class="d-flex justify-content-center">       
            <div class="row" style="overflow: hidden; width: 100%;">
                <!-- 탭과 콘텐츠 영역 -->
                <div class="col-md-9" style="flex: 0 0 76.5%;">
                    <div class="container">
                        <div class="row">
                            <!-- 버튼 목록 -->
                            <div class="col-3 ms-3" style="flex: 0 0 20%;">
                                <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                    <!-- 각 버튼은 tab-pane의 id와 연결 -->
                                    <button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">전체</button>
                                    <button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">여행메이트 찾기</button>
                                    <button class="nav-link" id="v-pills-contact-tab" data-bs-toggle="pill" data-bs-target="#v-pills-contact" type="button" role="tab" aria-controls="v-pills-contact" aria-selected="false">자유게시판</button>
                                </div>
                            </div>
                            <!-- 버튼 끝 -->
                            <!-- 탭 콘텐츠 -->
                            <div class="col-9" style="flex: 0 0 78%;">
                                <div class="tab-content" id="v-pills-tabContent">
                                    <!-- Home 탭 콘텐츠 -->
                                    <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                                        <h3>전체</h3>
                                        <!-- 테이블 시작 -->
                                        <div style="overflow: hidden;">
                                            <div style="float: left; width: 100%;">
                                                <div class="card-body">
                                                    <table class="table table-striped table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Title</th>
                                                                <th>Nickname</th>
                                                                <th>Created Time</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <!-- 테이블 바디 -->
                                                            <c:forEach items="${posts}" var="an">
                                                                <!-- Post 컨트롤러에서 애트리뷰트한 이름 "allListNew" -->
                                                                <!-- 쓸 때는 var 값으로 .해서 사용 -->
                                                                <tr>
                                                                    <td>${an.postId}</td>
                                                                    <!-- 객체에서 getPostId 호출하는 것 -->
                                                                    <!-- TODO: 제목 클릭하면 그 글의 상세페이지로 이동 -->
                                                                    <td>
                                                                        <c:url var="communityDetailsPage" value="/community/details">
                                                                            <c:param name="postId" value="${an.postId}"></c:param>
                                                                        </c:url>
                                                                        <a href="${communityDetailsPage}">${an.title}</a>
                                                                        <!-- 제목을 클릭하면 /community/details로 URL이 넘어감 -->
                                                                    </td>
                                                                    <td>${an.nickname}</td>
                                                                    <td>${an.createdTime}</td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 테이블 끝 -->
                                    </div>
                                    <!-- 페이징 시작 -->
                                            <!-- 페이지네이션 링크를 표시하는 부분입니다. -->
        <nav aria-label="Page navigation">
            <ul class="pagination justify-content-center">
                <!-- 현재 페이지가 1보다 크면 이전 페이지 링크를 표시합니다. -->
                <c:if test="${currentPage > 1}">
                    <li class="page-item">
                        <a class="page-link" href="/audiro/community/page/${currentPage - 1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>

                <!-- 1부터 totalPages까지의 숫자를 반복하면서 페이지 링크를 생성합니다. -->
                <c:forEach var="i" begin="1" end="${totalPages}">
                    <c:if test="${i == currentPage}">
                        <li class="page-item active"><a class="page-link" href="#">${i}</a></li>
                    </c:if>
                    <c:if test="${i != currentPage}">
                        <li class="page-item"><a class="page-link" href="/audiro/community/page/${i}">${i}</a></li>
                    </c:if>
                </c:forEach>

                <!-- 현재 페이지가 totalPages보다 작으면 다음 페이지 링크를 표시합니다. -->
                <c:if test="${currentPage < totalPages}">
                    <li class="page-item">
                        <a class="page-link" href="/audiro/community/page/${currentPage + 1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>
                                    <!-- 페이징 끝 -->
                                    
                                    <!-- Profile 탭 콘텐츠 -->
                                    <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                                        <h3>Profile</h3>
                                        <p>Profile content goes here...</p>
                                    </div>
                                    
                                    <!-- Contact 탭 콘텐츠 -->
                                    <div class="tab-pane fade" id="v-pills-contact" role="tabpanel" aria-labelledby="v-pills-contact-tab">
                                        <h3>Contact</h3>
                                        <p>Contact content goes here...</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- 사이드 콘텐츠 영역 -->
                <div class="col-md-3" style="flex: 0 0 20.5%;">
                    <div class="p-2" style="background: #E8DEEE; text-align: center;">
                        <h5 class="mt-4 mb-3">💗 LIKE_USER TOP3</h5>
                        <ul style="list-style-type: none; padding: 0;">
                            <li style="font-size: 17px;">1. 예진맘</li>
                            <li style="font-size: 17px;">2. 깔깔</li>
                            <li style="font-size: 17px;">3. 안눙</li>
                        </ul>
                        <h5 class="mt-4 mb-3">👍🏻 POST TOP3</h5>
                        <ul style="list-style-type: none; padding: 0;">
                            <li style="font-size: 17px;">1. 배고파</li>
                            <li style="font-size: 17px;">2. 깔깔</li>
                            <li style="font-size: 17px;">3. 안눙</li>
                        </ul>
                        <h5 class="mt-4 mb-3">💬 COMMENT TOP3</h5>
                        <ul style="list-style-type: none; padding: 0;">
                            <li style="font-size: 17px;">1. 선아깔깔</li>
                            <li style="font-size: 17px;">2. 깔깔</li>
                            <li style="font-size: 17px;">3. 안눙</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous">
    </script>
</body>
</html>
