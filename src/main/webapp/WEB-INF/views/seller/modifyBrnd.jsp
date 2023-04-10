<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>

    <link rel="stylesheet" href="/css/myPage/sidebar.css"/>
    <link rel="stylesheet" href="/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="/css/myPage/modifyBrnd.css"/>
    <link rel="stylesheet" href="/css/summernote-lite.css"/>

    <%@ include file="/WEB-INF/views/include/script.jsp" %>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="/summernote/summernote-lite.js"></script>
    <script src="/summernote/lang/summernote-ko-KR.js"></script>
    <%--    반드시 상단에 script 추가, summernote 한정--%>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<div class="mypage-banner"></div>
<div class="mypage-base">
    <%@ include file="/WEB-INF/views/include/sidebarSeller.jsp" %>
    <div class="mypage-content">
        <div class="brnd-modify-page">
            <div class="modify-content">
                <div class="mod-header">브랜드 수정</div>
                <div class="mod-box">
                    <form
                            class="mod-brnd-form"
                            action="/seller/modify/brnd"
                            method="post"
                    >
                        <div class="center-padding">
                            <div class="input-line">
                                <div class="input-label">
                                    <label for="brnd_nm">브랜드명<span>*</span></label>
                                </div>
                                <div class="input-box">
                                    <div class="input">
                                        <input
                                                name="brnd_nm"
                                                id="brnd_nm"
                                                type="text"
                                                placeholder="브랜드명을 입력해주세요"
                                        />
                                    </div>
                                    <div class="error-msg">
                                        최소1자에서 최대 20자까지 입력해주세요
                                    </div>
                                </div>
                                <div class="btn-space">
                                    <button>중복확인</button>
                                </div>
                            </div>

                            <div class="input-line">
                                <div class="input-label">
                                    <label for="editordata">브랜드 내용<span>*</span></label>
                                </div>
                                <div class="input-box">
                                    <textarea class="summernote" name="editordata" id="editordata"></textarea>
                                </div>
                                <div class="btn-space"></div>
                            </div>
                            <div class="input-line">
                                <div class="input-label">
                                    <label for="name">브랜드배너</label>
                                </div>
                                <div class="input-box">
                                    <div class="input">
                                        <input name="name" id="name" type="file"/>
                                    </div>
                                </div>
                                <div class="btn-space"></div>
                            </div>
                            <div class="input-line">
                                <div class="input-label">
                                    <label for="brnd_profile">브랜드 프로필</label>
                                </div>
                                <div class="input-box">
                                    <div class="input">
                                        <input name="brnd_profile" id="brnd_profile" type="file"/>
                                    </div>
                                </div>
                                <div class="btn-space"></div>
                            </div>
                            <div class="section-line bottom"></div>
                            <div class="btn-container">
                                <button class="mod-confirm" id="brnd-cancel">취소하기</button>
                                <button class="mod-confirm" id="brnd_modify">수정하기</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>
    //summernote
    $(".summernote").summernote({
        height: 450,
        lang: "ko-KR",
        // callbacks: {
        //     onImageUpload: function (files) {
        //         $(".summernote").summernote("editor.insertImage", "/jinvicky.png");
        //     },
        // },
    });

    $("#brnd_modify").click(function (e) {
        e.preventDefault();
        let summernoteContent = $(".summernote").summernote("code"); //썸머노트(설명)
        console.log("summernoteContent : " + summernoteContent);
    });
</script>
</body>
</html>