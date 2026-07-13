<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${product.name} - 桃子商城</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<div class="header">
    <div class="wrap">
        <div class="logo">桃子商城</div>
        <div class="nav">
            <a href="/">首页</a>
            <c:choose>
                <c:when test="${empty sessionScope.user}">
                    <a href="/login">登录</a>
                </c:when>
                <c:otherwise>
                    <a href="/cart">购物车</a>
                    <a href="/logout">退出</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<div class="container">
    <div class="card" style="display:flex;gap:30px;">
        <div style="width:300px;height:300px;background:#f0f0f0;display:flex;align-items:center;justify-content:center;color:#bbb;font-size:60px;border-radius:4px;">📦</div>
        <div style="flex:1;">
            <h2>${product.name}</h2>
            <p style="color:#999;margin:15px 0;">${product.description}</p>
            <p>
                <span style="font-size:28px;color:#e4393c;font-weight:bold;">¥${product.price}</span>
            </p>
            <p style="margin:10px 0;">库存：${product.stock}</p>
            <c:if test="${not empty sessionScope.user}">
                <form action="/cart/add" method="post" style="margin-top:20px;">
                    <input type="hidden" name="productId" value="${product.id}">
                    <button type="submit" class="btn btn-primary" style="padding:12px 40px;font-size:16px;">加入购物车</button>
                </form>
            </c:if>
            <c:if test="${empty sessionScope.user}">
                <a href="/login" class="btn btn-primary" style="padding:12px 40px;font-size:16px;margin-top:20px;">登录后购买</a>
            </c:if>
        </div>
    </div>
</div>

<div class="footer">桃子商城 © 2026 JavaEE项目</div>
</body>
</html>
