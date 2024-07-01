<!-- /WEB-INF/views/community/test.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>


<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Community</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <h1 class="my-4">Posts</h1>

        <!-- 게시물 목록을 표시할 테이블입니다. -->
        <table class="table table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>#</th>
                    <th>Title</th>
                    <th>Nickname</th>
                    <th>Good</th>
                    <th>Created Time</th>
                </tr>
            </thead>
            <tbody>
                <!-- JSP에서 전달된 posts 리스트를 반복하면서 각 게시물을 테이블 행으로 표시합니다. -->
                <c:forEach var="post" items="${posts}">
                    <tr>
                        <td>${post.postId}</td>
                        <td>${post.title}</td>
                        <td>${post.nickname}</td>
                        <td>${post.good}</td>
                        <td>${post.createdTime}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

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

    <!-- Bootstrap JS -->
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous">
    </script>
    <!-- 우리가 만드는 js파일 앞에 두어야 함 순서중요! 
        Axio JS 라이브러리 -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <c:url var="testJs" value="/js/test.js"></c:url>
    <script src="${testJs}"></script>
</body>
</html>
