<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册 - 桃子商城</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<div class="header">
    <div class="wrap">
        <div class="logo">桃子商城</div>
        <div class="nav">
            <a href="/">首页</a>
            <a href="/login">登录</a>
        </div>
    </div>
</div>

<div class="card login-box">
    <h2>用户注册</h2>
    <c:if test="${not empty error}">
        <div class="alert alert-error">${error}</div>
    </c:if>
    <form action="/register" method="post">
        <div class="form-group">
            <label>用户名</label>
            <input type="text" name="username" required placeholder="请输入用户名">
        </div>
        <div class="form-group">
            <label>密码</label>
            <input type="password" name="password" required placeholder="请输入密码">
        </div>
        <div class="form-group">
            <label>邮箱</label>
            <input type="email" name="email" placeholder="请输入邮箱">
        </div>
        <div class="form-group">
            <label>手机号</label>
            <input type="text" name="phone" placeholder="请输入手机号">
        </div>
        <button type="submit" class="btn btn-primary" style="width:100%;">注册</button>
    </form>
    <p style="text-align:center;margin-top:15px;font-size:14px;">
        已有账号？<a href="/login">立即登录</a>
    </p>
</div>

<div class="footer">桃子商城 © 2026 JavaEE项目</div>
</body>
</html>
