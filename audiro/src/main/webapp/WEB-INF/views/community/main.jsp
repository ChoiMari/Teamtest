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
    <div class="container-fluid" style="width: 90%;">
        <%-- <%@ include file="../fragments/header.jspf"%>
         ..  상위폴더로 올라가서 찾음 --%>
        <div class="m-3 p-2">
            <h3 style="text-align: center;">
                <span class="p-2 bg-primary-subtle"> 여행 연결 고리 </span>
            </h3>
        </div>
        <div class="mb-3">
            <h5>💜인기 여행 후기 Top10💜</h5>
        </div>
        <div style="overflow: hidden;">
            <div style="float: left; width: 60%; margin-right: 10%;">
                <div class="card-body">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>title</th>
                                <th>nickname</th>
                                <th>created time</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%--테이블 바디 --%>
                            <c:forEach items="${allListNew}" var="an">
                                <!-- Post컨트롤러에서 애트리뷰트한 이름 "allListNew". ${allListNew} -->
                                <!--쓸때는 var값으로 .해서 사용  -->
                                <tr>
                                    <td>${an.postId}</td>
                                    <!--객체에서 getPostId호출하는것 -->
                                    <!-- TODO : 제목 클릭하면 그 글의 상세페이지로 이동 -->
                                    <td><c:url
                                            var="communityDetailsPage"
                                            value="/community/details">
                                            <c:param name="postId"
                                                value="${an.postId}"></c:param>
                                        </c:url> <a href="${community}">${an.title}</a>
                                        <!-- 제목을 클릭하면 /community/details로 url이 넘어감 -->
                                    </td>
                                    <td>${an.nickname}</td>
                                    <td>${an.createdTime}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- 사이드 콘텐츠 영역 -->
            <div
                style="float: left; width: 20%; height: 445px; background: #E8DEEE; text-align: center;">
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



    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous">
					
	</script>
</body>
</html>