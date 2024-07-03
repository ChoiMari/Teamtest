// 전체 탭 게시물 데이터를 로드하는 함수
function loadPosts1(page) {
    axios.get('../community/api/postsAllRecent?page=' + page)
        .then(response => {
            const posts = response.data.posts;
            const totalPages = response.data.totalPages;

            const postTableBody = document.getElementById('postTableBody');
            const pagination = document.getElementById('pagination');

            postTableBody.innerHTML = '';
            posts.forEach(post => {
                const row = `
                    <tr class="table-light">
                        <td class="text-center">${post.postId}</td>
                        <td class="text-center">${post.title}</td>
                        <td class="text-center">${post.nickname}</td>
                        <td class="text-center">${post.good}</td>
                        <td class="text-center">${post.createdTime}</td>
                    </tr>
                `;
                postTableBody.innerHTML += row;
            });

            const maxPagesToShow = 5;
            const currentPageGroup = Math.floor((page - 1) / maxPagesToShow);
            const startPage = currentPageGroup * maxPagesToShow + 1;
            const endPage = Math.min(startPage + maxPagesToShow - 1, totalPages);

            pagination.innerHTML = '';
            if (page > 1) {
                pagination.innerHTML += `
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous" data-page="${page - 1}">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                `;
            }
            for (let i = startPage; i <= endPage; i++) {
                if (i === page) {
                    pagination.innerHTML += `<li class="page-item active"><a class="page-link" href="#" data-page="${i}">${i}</a></li>`;
                } else {
                    pagination.innerHTML += `<li class="page-item"><a class="page-link" href="#" data-page="${i}">${i}</a></li>`;
                }
            }
            if (page < totalPages) {
                pagination.innerHTML += `
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next" data-page="${page + 1}">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                `;
            }

            document.querySelectorAll('#pagination a.page-link').forEach(a => {
                a.addEventListener('click', loadPage1);
            });
        })
        .catch(error => {
            console.error('Error fetching posts:', error);
        });
}

// 여행 게시물 탭 게시물 데이터를 로드하는 함수
function loadPosts2(page) {
    axios.get('../community/api/postsMateRecent?page=' + page)
        .then(response2 => {
            const posts2 = response2.data.posts2;
            const totalPages2 = response2.data.totalPages2;

            const postTableBody2 = document.getElementById('postTableBody2');
            const pagination2 = document.getElementById('pagination2');

            postTableBody2.innerHTML = '';
            posts2.forEach(post2 => {
                const row = `
                    <tr class="table-light">
                        <td class="text-center">${post2.postId}</td>
                        <td class="text-center">${post2.title}</td>
                        <td class="text-center">${post2.nickname}</td>
                        <td class="text-center">${post2.good}</td>
                        <td class="text-center">${post2.createdTime}</td>
                    </tr>
                `;
                postTableBody2.innerHTML += row;
            });

            const maxPagesToShow = 5;
            const currentPageGroup = Math.floor((page - 1) / maxPagesToShow);
            const startPage = currentPageGroup * maxPagesToShow + 1;
            const endPage = Math.min(startPage + maxPagesToShow - 1, totalPages2);

            pagination2.innerHTML = '';
            if (page > 1) {
                pagination2.innerHTML += `
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous" data-page="${page - 1}">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                `;
            }
            for (let i = startPage; i <= endPage; i++) {
                if (i === page) {
                    pagination2.innerHTML += `<li class="page-item active"><a class="page-link" href="#" data-page="${i}">${i}</a></li>`;
                } else {
                    pagination2.innerHTML += `<li class="page-item"><a class="page-link" href="#" data-page="${i}">${i}</a></li>`;
                }
            }
            if (page < totalPages2) {
                pagination2.innerHTML += `
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next" data-page="${page + 1}">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                `;
            }

            document.querySelectorAll('#pagination2 a.page-link').forEach(a => {
                a.addEventListener('click', loadPage2);
            });
        })
        .catch(error => {
            console.error('Error fetching posts:', error);
        });
}

// 페이지네이션 클릭 이벤트 핸들러 - 전체 탭
function loadPage1(e) {
    e.preventDefault();
    const pageNo = e.target.getAttribute('data-page');
    if (pageNo) {
        loadPosts1(parseInt(pageNo, 10));
    }
}

// 페이지네이션 클릭 이벤트 핸들러 - 여행 메이트 탭
function loadPage2(e) {
    e.preventDefault();
    const pageNo = e.target.getAttribute('data-page');
    if (pageNo) {
        loadPosts2(parseInt(pageNo, 10));
    }
}

// 초기 데이터 로드 및 탭 활성화 시 데이터 로드
document.addEventListener('DOMContentLoaded', function() {
    loadPosts1(1);
});

document.querySelector('a[data-bs-toggle="tab"][href="#mate"]').addEventListener('shown.bs.tab', function () {
    loadPosts2(1);
});
