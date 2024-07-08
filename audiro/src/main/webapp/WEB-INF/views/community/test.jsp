<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>test</title>
<link href="../css/community.css" rel="stylesheet" />
<!-- Quill CSS 포함 -->
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">

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
.editor-container {
            height: 500px;
        }
    #editor .ql-editor::before {
        font-size: 20px; /* 원하는 크기로 설정 */
    }
      

        /* 폰트 크기 옵션을 스타일링 */       
        .ql-snow .ql-picker.ql-size .ql-picker-item[data-value="10px"]::before {
            content: '10px';
            font-size: 10px;
        }
        .ql-snow .ql-picker.ql-size .ql-picker-item[data-value="12px"]::before {
            content: '12px';
            font-size: 12px;
        }
        .ql-snow .ql-picker.ql-size .ql-picker-item[data-value="14px"]::before {
            content: '14px';
            font-size: 14px;
        }
        .ql-snow .ql-picker.ql-size .ql-picker-item[data-value="16px"]::before {
            content: '16px';
            font-size: 16px;
        }
        .ql-snow .ql-picker.ql-size .ql-picker-item[data-value="18px"]::before {
            content: '18px';
            font-size: 18px;
        }
        .ql-snow .ql-picker.ql-size .ql-picker-item[data-value="20px"]::before {
            content: '20px';
            font-size: 20px;
        }
        .ql-snow .ql-picker.ql-size .ql-picker-item[data-value="24px"]::before {
            content: '24px';
            font-size: 24px;
        }
        .ql-snow .ql-picker.ql-size .ql-picker-item[data-value="28px"]::before {
            content: '28px';
            font-size: 28px;
        }
        .ql-snow .ql-picker.ql-size .ql-picker-item[data-value="32px"]::before {
            content: '32px';
            font-size: 32px;
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
                        <div class="mt-2 ms-1" style="width: 20%;"> 
                                <select class="form-select" id="typeId" style="float: left;">
                                    <option value="" selected hidden>게시판 선택</option>
                                    <option>여행메이트</option>
                                    <option>자유게시판</option>
                            </select>
                        </div>
                        <!-- 글타입 콤보박스 끝 -->
                            <c:url var="CreatePage" value="/community/test" />
                            <form method="post" action="${CreatePage}">
                                <div class="mt-2 py-1" style="border-bottom: 1px solid grey;">
                                    <input class="form-control form-control-lg" name="title" type="text" required autofocus style="font-size: 220%; text-align: center;" placeholder="제목을 입력하세요.">
                                    <div class="flex-container">
                                        <div class="right-align me-2">
                                            <p class="m-2 p-2 mt-3 me-1"
                                                style="color: grey; font-size: 115%;">작성 시간 :</p>
                                            <div class="pt-2 me-1" id="date" style="color: grey; font-size: 120%;"></div>
                                            <div class="pt-2" id="clock" style="color: grey; font-size: 120%;"></div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 글 작성 content -->
                                <div class="container mt-3">
                                    <div class="editor-container" id="editor" name="content" required></div>
                                </div>
                                <div class="mt-2 mb-1">
                                    <!-- 수정시간 수정버튼 누를때 넣기 <p class="me-4"
                                        style="color: grey; font-size: 90%; text-align: right;">수정
                                        시간 : ${p.createdTime}</p> -->
                                </div>
                                <input class="btn btn-outline-success"
                                type="submit" value="작성 완료">
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
                            <input class="btn btn-outline-success"
                                type="submit" value="작성 완료">
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
<!-- Quill 라이브러리 -->
    <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
     <!-- Quill JavaScript 파일을 포함 -->
<script>

// 글씨 크기 옵션 설정
var Size = Quill.import('attributors/style/size');
Size.whitelist = ['10px', '12px', '14px', '16px', '18px', '20px', '24px', '28px', '32px']; // 여기서 글씨 크기 옵션을 설정할 수 있습니다
Quill.register(Size, true);

// 글씨 색상 옵션 설정
var Color = Quill.import('attributors/style/color');
Quill.register(Color, true);



// 툴바 옵션 설정
var toolbarOptions = [

    [{ 'size': ['10px', '12px', '14px', '16px', '18px', '20px', '24px', '28px', '32px'] }], // 폰트 크기 옵션
    [{ 'color': [] }], // 글씨 색상 옵션 (Quill에서 기본 색상 팔레트 사용)
    [{ 'header': [1, 2, 3, false] }], // 헤더 스타일
    ['bold', 'italic', 'underline', 'strike'], // 굵게, 기울임, 밑줄, 취소선
    [{ 'list': 'ordered'}, { 'list': 'bullet' }], // 목록 (순서 있는, 순서 없는)
    ['link', 'image', 'video'], // 링크, 이미지, 비디오
    ['blockquote', 'code-block'], // 블럭 인용문, 코드 블럭
    [{ 'script': 'sub'}, { 'script': 'super' }], // 아래첨자, 위첨자
    [{ 'indent': '-1'}, { 'indent': '+1' }], // 들여쓰기, 내어쓰기
    [{ 'direction': 'rtl' }], // 텍스트 방향 (오른쪽에서 왼쪽)
    ['clean'] // 서식 제거
];

// Quill 에디터 초기화
var quill = new Quill('#editor', {
    theme: 'snow', // 'snow' 테마 사용
    placeholder: '여기에 내용을 입력하세요.', // 한국어 placeholder
    modules: {
        toolbar: toolbarOptions // 설정한 툴바 옵션을 사용
    }
});

// 'clean' 버튼 클릭 시 모든 콘텐츠 제거
document.querySelector('.ql-clean').addEventListener('click', function() {
    quill.setContents([]); // 모든 콘텐츠를 제거
});

// 사용자 정의 언어 (한국어) 설정
var koreanTranslations = {
    'bold': '굵게',
    'italic': '기울임',
    'underline': '밑줄',
    'strike': '취소선',
    'link': '링크',
    'image': '이미지',
    'video': '비디오',
    'clean': '서식 제거',
    'header': '헤더',
    'list': '목록',
    'ordered': '순서 있는 목록',
    'bullet': '순서 없는 목록',
    'blockquote': '인용문',
    'code-block': '코드 블럭',
    'script': '첨자',
    'sub': '아래 첨자',
    'super': '위 첨자',
    'indent': '들여쓰기',
    'direction': '텍스트 방향',

};

// 툴바 버튼의 텍스트를 한국어로 변경
var toolbarButtons = document.querySelectorAll('.ql-toolbar button');
toolbarButtons.forEach(button => {
    var format = button.classList[0].split('-')[1];
    if (koreanTranslations[format]) {
        button.title = koreanTranslations[format];
    }
});

// 드롭다운 메뉴의 텍스트를 한국어로 변경
var selectItems = document.querySelectorAll('.ql-toolbar select');
selectItems.forEach(select => {
    var format = select.classList[0].split('-')[1];
    if (koreanTranslations[format]) {
        select.title = koreanTranslations[format];
        Array.from(select.options).forEach(option => {
            if (koreanTranslations[option.value]) {
                option.text = koreanTranslations[option.value];
            }
        });
    }
});


// Quill 이벤트 리스너 추가
quill.on('text-change', function(delta, oldDelta, source) {
    console.log('Text change detected!');
    console.log(delta);
});
</script>
</body>
</html>
