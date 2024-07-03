/**
 * /community/main.jsp에 포함됨
 */
console.log('연결');
// 게시물 데이터를 로드하는 함수
        function loadPosts(page) {
            // 서버에서 데이터 가져오기
            axios.get('../community/api/postsAllRecent?page=' + page)
                .then(response => {
                    // 서버로부터 받은 데이터를 변수에 저장
                    const posts = response.data.posts;
                    const totalPages = response.data.totalPages;
                    const postTableBody = document.getElementById('postTableBody');
                    const pagination = document.getElementById('pagination');

                    // 게시물 목록을 테이블에 추가
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

                    // 페이지네이션 링크를 업데이트
                    pagination.innerHTML = '';
                    if (page > 1) {
                        // 현재 페이지가 1보다 크면 이전 페이지 링크 추가
                        pagination.innerHTML += `
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous" onclick="loadPosts(${page - 1})">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        `;
                    }
                    // 전체 페이지 수만큼 반복하여 페이지 링크 추가
                    for (let i = 1; i <= totalPages; i++) {
                        if (i === page) {
                            pagination.innerHTML += `<li class="page-item active"><a class="page-link" href="#">${i}</a></li>`;
                        } else {
                            pagination.innerHTML += `<li class="page-item"><a class="page-link" href="#" onclick="loadPosts(${i})">${i}</a></li>`;
                        }
                    }
                    if (page < totalPages) {
                        // 현재 페이지가 전체 페이지 수보다 작으면 다음 페이지 링크 추가
                        pagination.innerHTML += `
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next" onclick="loadPosts(${page + 1})">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        `;
                    }
                })
                .catch(error => {
                    // 에러가 발생하면 콘솔에 에러 메시지 출력
                    console.error('Error fetching posts:', error);
                });
        }

        // 페이지 로드 시 초기 데이터를 가져옴
        document.addEventListener('DOMContentLoaded', function() {
            loadPosts(1); // 첫 번째 페이지의 데이터를 로드
        });