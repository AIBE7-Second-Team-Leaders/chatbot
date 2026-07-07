<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>ArChat</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css?v=1">
</head>
<body>
<main class="auth-page">
    <section class="auth-card">
        <h1>ArChat</h1>
        <p>AI 모델을 선택해 대화할 수 있는 간단한 웹 챗봇입니다.</p>

        <div class="auth-actions">
            <button id="openLoginModal" type="button">로그인</button>
            <button id="openSignupModal" type="button" class="button-secondary">회원가입</button>
        </div>
    </section>
</main>

<dialog id="loginModal">
    <form id="loginForm">
        <h2>로그인</h2>

        <p id="loginMessage" role="alert"></p>

        <div>
            <label for="loginEmail">이메일</label>
            <input type="email" id="loginEmail" required>
        </div>

        <div>
            <label for="loginPassword">비밀번호</label>
            <input type="password" id="loginPassword" required>
        </div>

        <div class="dialog-actions">
            <button type="button" id="closeLoginModal">닫기</button>
            <button type="submit">로그인</button>
        </div>
    </form>
</dialog>

<dialog id="signupModal">
    <form id="signupForm">
        <h2>회원가입</h2>

        <p id="signupMessage" role="alert"></p>

        <div>
            <label for="signupEmail">이메일</label>
            <input type="email" id="signupEmail" required>
        </div>

        <div>
            <label for="signupPassword">비밀번호</label>
            <input type="password" id="signupPassword" required>
        </div>

        <div class="dialog-actions">
            <button type="button" id="closeSignupModal">닫기</button>
            <button type="submit">회원가입</button>
        </div>
    </form>
</dialog>
</body>

<script>
    window.APP_CONTEXT_PATH = "${pageContext.request.contextPath}";
</script>
<script type="module" src="${pageContext.request.contextPath}/js/auth.js?v=1"></script>
</html>