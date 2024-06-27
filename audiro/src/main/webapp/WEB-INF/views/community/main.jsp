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
    <div class="container-fluid">
       <%-- <%@ include file="../fragments/header.jspf"%>
         ..  상위폴더로 올라가서 찾음 --%>
        <main>
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
                                <td><c:url var="communityDetailsPage"
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
    </main>

    </div>



    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous">
    </script>
</body>
</html>