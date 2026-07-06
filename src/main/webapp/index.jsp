<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>ArChat</title>
</head>
<body>
<h1>ArChat</h1>
<p>로그인 후 챗봇을 사용할 수 있습니다.</p>

<button type="button" id="openLoginModal">로그인</button>
<button type="button" id="openSignupModal">회원가입</button>

<dialog id="loginModal">
    <form id="loginForm">
        <h2>로그인</h2>

        <div>
            <label for="loginEmail">이메일</label>
            <input type="email" id="loginEmail" required>
        </div>

        <div>
            <label for="loginPassword">비밀번호</label>
            <input type="password" id="loginPassword" required>
        </div>

        <div>
            <button type="button" id="closeLoginModal">닫기</button>
            <button type="submit">로그인</button>
        </div>
    </form>
</dialog>

<dialog id="signupModal">
    <form id="signupForm">
        <h2>회원가입</h2>

        <div>
            <label for="signupEmail">이메일</label>
            <input type="email" id="signupEmail" required>
        </div>

        <div>
            <label for="signupPassword">비밀번호</label>
            <input type="password" id="signupPassword" required>
        </div>

        <div>
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