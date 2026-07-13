<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${empty user.id ? '添加' : '编辑'}客户 - 桃子商城</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<div class="header">
    <div class="wrap">
        <div class="logo">桃子商城 - 后台管理</div>
        <div class="nav">
            <a href="/">返回前台</a>
            <a href="/logout">退出</a>
        </div>
    </div>
</div>

<div class="container">
    <div class="card" style="width:600px;margin:0 auto;">
        <h2>${empty user.id ? '添加' : '编辑'}客户</h2>
        <form action="/admin/customer/save" method="post">
            <input type="hidden" name="id" value="${user.id}">
            <c:if test="${empty user.id}">
            <div class="form-group">
                <label>密码</label>
                <input type="password" name="password" required>
            </div>
            </c:if>
            <div class="form-group">
                <label>用户名</label>
                <input type="text" name="username" value="${user.username}" required>
            </div>
            <div class="form-group">
                <label>邮箱</label>
                <input type="email" name="email" value="${user.email}">
            </div>
            <div class="form-group">
                <label>手机号</label>
                <input type="text" name="phone" value="${user.phone}">
            </div>
            <button type="submit" class="btn btn-primary">保存</button>
            <a href="/admin/customer/list" class="btn btn-default">返回</a>
        </form>
    </div>
</div>

<div class="footer">桃子商城 © 2026 JavaEE项目</div>
</body>
</html>
