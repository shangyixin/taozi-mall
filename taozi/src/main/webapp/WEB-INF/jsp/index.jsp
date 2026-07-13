<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>桃子商城 - 首页</title>
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
                    <a href="/register">注册</a>
                </c:when>
                <c:otherwise>
                    <span>欢迎，${sessionScope.user.username}</span>
                    <a href="/cart">购物车</a>
                    <a href="/order/list">我的订单</a>
                    <c:if test="${sessionScope.user.role == 1}">
                        <a href="/admin">后台管理</a>
                    </c:if>
                    <a href="/logout">退出</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<div class="container">
    <c:if test="${not empty msg}">
        <div class="alert alert-success">${msg}</div>
    </c:if>

    <div class="category-nav">
        <a href="/" class="${empty currentCategoryId || currentCategoryId == 0 ? 'active' : ''}">全部</a>
        <c:forEach items="${categories}" var="cat">
            <a href="/?categoryId=${cat.id}" class="${currentCategoryId == cat.id ? 'active' : ''}">${cat.name}</a>
        </c:forEach>
    </div>

    <div class="product-grid">
        <c:forEach items="${products}" var="p">
            <div class="product-item">
                <a href="/product/detail?id=${p.id}">
                    <div style="width:100%;height:160px;background:#f0f0f0;display:flex;align-items:center;justify-content:center;color:#bbb;font-size:30px;border-radius:4px;">📦</div>
                    <div class="p-name">${p.name}</div>
                    <div class="p-price">${p.price}</div>
                </a>
                <c:if test="${not empty sessionScope.user}">
                    <form action="/cart/add" method="post" style="margin-top:8px;">
                        <input type="hidden" name="productId" value="${p.id}">
                        <button type="submit" class="btn btn-primary btn-sm">加入购物车</button>
                    </form>
                </c:if>
            </div>
        </c:forEach>
    </div>

    <c:if test="${empty products}">
        <div style="text-align:center;padding:40px;color:#999;">暂无商品</div>
    </c:if>
</div>

<div class="footer">桃子商城 © 2026 JavaEE项目</div>
</body>
</html>
