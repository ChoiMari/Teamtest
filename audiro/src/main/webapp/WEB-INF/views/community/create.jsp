<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>글 작성</title>
<link href="../css/community.css" rel="stylesheet" />
<style>
.flex-container {
    display: flex;
}
.right-align {
    margin-left: auto;
    display: flex;
    align-items: center;
    color: grey;
    font-size: 90%;
}
</style>
</head>
<body onload="startTime()">
    <div class="container">
        <!-- **** row 클래스를 사용하여 두 섹션을 가로로 배치합니다. **** -->
        <div class="row">
            <!-- 사이드 메뉴 -->
            <!-- **** col-md-4와 col-lg-3 클래스를 사용하여 반응형 너비를 설정합니다. **** -->
            <div class="col-md-4 col-lg-3 mb-3">
                <div class="card mb-3">
                    <h3 class="card-header"
                        style="background-color: #3faf6c; text-align: center;">AUDIRO 🥦COMMUNITY</h3>
                    <div class="card-body">
                        <h4 class="card-title m-1"
                            style="text-align: center;">writing</h4>
                        <h6 class="card-subtitle text-muted p-2"
                            style="text-align: center;">You guys write a lot.</h6>
                        <img
                            style="display: block; margin: 0 auto; width: 100%;"
                            src="../images/create.png" alt="글 작성">
                    </div>
                    <div class="card-body">
                        <p class="ps-3 pe-3" style="text-align: center;">
                            “ 글을 많이 많이 작성해요 !! ”<br />#글쓰기
                        </p>
                    </div>


                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">커뮤니티 메인</li>
                        <li class="list-group-item">여행 메이트</li>
                        <li class="list-group-item">자유 게시판</li>
                        <li class="list-group-item">글쓰기</li>
                    </ul>
                    <div class="card-body">
                        <a href="#" class="card-link p-2">#어디로 메인</a> <a
                            href="#" class="card-link p-2">#여행지 찾기</a> <br />
                        <a href="#" class="card-link p-2">#여행
                            계획&nbsp;&nbsp;&nbsp;</a> <a href="#"
                            class="card-link p-2">#여행 후기</a>
                    </div>
                    <div class="card-footer text-muted">검색기능</div>
                </div>
                <!-- 랭킹 시작 -->
                <div class="card">
                    <div class="card-header m-1">
                        <h4 class="card-title"
                            style="text-align: center;">Community
                            Ranking</h4>
                    </div>
                    <div class="card-body">
                        <p style="text-align: center;">💗 LIKE USER
                            TOP3</p>
                        <table class="table table-hover"
                            style="margin: 0 auto;">
                            <thead class="table table-light">
                                <tr>
                                    <th class="text-center">순위</th>
                                    <th class="text-center">닉네임</th>
                                    <th class="text-center">💘</th>
                                </tr>
                            </thead>
                            <!-- rank == 1 이면 형광펜으로 칠함. -->
                            <c:forEach var="like"
                                items="${userLikeTop3List}">
                                <tbody>
                                    <c:choose>
                                        <c:when test="${like.rank == 1}">
                                            <tr class="table-success">
                                                <td class="text-center">🐸</td>
                                                <td class="text-center">${like.nickname}</td>
                                                <td class="text-center">${like.count}</td>
                                            </tr>
                                        </c:when>
                                        <c:when test="${like.rank == 2}">
                                            <tr>
                                                <td class="text-center">${like.rank}</td>
                                                <td class="text-center">${like.nickname}</td>
                                                <td class="text-center">${like.count}</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td class="text-center">${like.rank}</td>
                                                <td class="text-center">${like.nickname}</td>
                                                <td class="text-center">${like.count}</td>
                                            <tr>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </c:forEach>
                        </table>
                        <!-- post 순위 -->
                        <p class="mt-3 pt-2" style="text-align: center;">👍🏻
                            POST TOP3</p>
                        <table class="table table-hover"
                            style="margin: 0 auto;">
                            <thead class="table table-light">
                                <tr>
                                    <th class="text-center">순위</th>
                                    <th class="text-center">제목</th>
                                    <th class="text-center">👍🏻</th>
                                </tr>
                            </thead>
                            <!-- rank == 1 이면 형광펜으로 칠함. -->
                            <c:forEach var="pg"
                                items="${postGoodTop3List}">
                                <tbody>
                                    <c:choose>
                                        <c:when test="${pg.rank == 1}">
                                            <tr class="table-success">
                                                <td class="text-center">🐸</td>
                                                <td class="text-center">${pg.title}</td>
                                                <td class="text-center">${pg.good}</td>
                                            </tr>
                                        </c:when>
                                        <c:when test="${pg.rank == 2}">
                                            <tr>
                                                <td class="text-center">${pg.rank}</td>
                                                <td class="text-center">${pg.title}</td>
                                                <td class="text-center">${pg.good}</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td class="text-center">${pg.rank}</td>
                                                <td class="text-center">${pg.title}</td>
                                                <td class="text-center">${pg.good}</td>
                                            <tr>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </c:forEach>
                        </table>
                        <!-- post 순위 끝 -->
                        <!-- comment 순위 -->
                        <p class="mt-3 pt-2" style="text-align: center;">💬
                            COMMENT TOP3</p>
                        <table class="table table-hover"
                            style="margin: 0 auto;">
                            <thead class="table table-light">
                                <tr>
                                    <th class="text-center">순위</th>
                                    <th class="text-center">닉네임</th>
                                    <th class="text-center">👍🏻</th>
                                </tr>
                            </thead>
                            <!-- rank == 1 이면 형광펜으로 칠함. -->
                            <c:forEach var="cu"
                                items="${commentsUserTop3}">
                                <tbody>
                                    <c:choose>
                                        <c:when test="${cu.rank == 1}">
                                            <tr class="table-success">
                                                <td class="text-center">🐸</td>
                                                <td class="text-center">${cu.nickname}</td>
                                                <td class="text-center">${cu.count}</td>
                                            </tr>
                                        </c:when>
                                        <c:when test="${cu.rank == 2}">
                                            <tr>
                                                <td class="text-center">${cu.rank}</td>
                                                <td class="text-center">${cu.nickname}</td>
                                                <td class="text-center">${cu.count}</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td class="text-center">${cu.rank}</td>
                                                <td class="text-center">${cu.nickname}</td>
                                                <td class="text-center">${cu.count}</td>
                                            <tr>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </c:forEach>
                        </table>
                        <!-- comment 순위 끝-->
                    </div>
                </div>
                <!-- 랭킹 끝 -->
            </div>

            <!-- 상세보기 -->
            <!-- **** col-md-8와 col-lg-9 클래스를 사용하여 반응형 너비를 설정합니다. **** -->
            <div class="col-md-8 col-lg-9">
                <main>
                    <div class="card border-light mb-3">
                        <div class="card-header">
                                    <p class="mt-3 ms-2">
                                       🥝<span
                                            class="text-body-secondary"> 글 작성</span>
                                    </p>
                        </div>
                            <div class="card-body">
                            <form>
                                <div class="mt-4 py-2" style="border-bottom: 1px solid grey;">
                                    <input  class="form-control form-control-lg" type="text" style="font-size: 220%; text-align: center;" placeholder="제목을 입력하세요.">
                                    <div class="flex-container">
                                        <div class="right-align me-2">
                                            <p class="m-2 p-2 mt-3 me-1"
                                                style="color: grey; font-size: 115%;">작성 시간 :</p>
                                            <div class="pt-2 me-1" id="date" style="color: grey; font-size: 120%;"></div>
                                            <div class="pt-2" id="clock" style="color: grey; font-size: 120%;"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="container mt-3 m-4 p-5">
                                    <div>
                                        <p>${p.content}</p>
                                    </div>
                                </div>
                                <div class="mt-2 mb-1">
                                    <!-- 수정시간 수정버튼 누를때 넣기 <p class="me-4"
                                        style="color: grey; font-size: 90%; text-align: right;">수정
                                        시간 : ${p.createdTime}</p> -->
                                </div>
                            </form>
                        </div>

                        <div class="card-footer">
                            <a class="btn btn-outline-danger"
                                href="../community/main">취소</a>
                            <button type="button" class="btn btn-outline-secondary">임시저장</button>
                            <c:url var="postModifyPage"
                                value="/post/modify">
                                <c:param name="id" value="${p.postId}" />
                            </c:url>
                            <a class="btn btn-outline-success"
                                href="${postModifyPage}">작성 완료</a>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </div>
    <!-- 부트스트랩 js라이브러리 -->
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <!-- 우리가 만드는 js파일 앞에 두어야 함 순서중요! -->
    <!-- Axio JS 라이브러리 -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <!-- 우리가 만드는 js파일 -->
    <!-- <c:url var="commentsJS" value="/js/comments.js" /> -->
    <!-- <script src="${commentsJS}"></script> -->
    <script>
    function startTime() {
        const today = new Date();
        let h = today.getHours();
        let m = today.getMinutes();
        let s = today.getSeconds();
        m = checkTime(m);
        s = checkTime(s);
        document.getElementById('clock').innerHTML = h + ":" + m + ":" + s;
        document.getElementById('date').innerHTML = today.toLocaleDateString(); // 오늘 날짜 표시
        setTimeout(startTime, 1000);
    }

    function checkTime(i) {
        if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
        return i;
    }

	</script>
</body>
</html>
