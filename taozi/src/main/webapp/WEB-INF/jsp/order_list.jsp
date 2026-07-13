<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>我的订单 - 桃子商城</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<div class="header">
    <div class="wrap">
        <div class="logo">桃子商城</div>
        <div class="nav">
            <a href="/">首页</a>
            <a href="/cart">购物车</a>
            <span>${sessionScope.user.username}</span>
            <a href="/logout">退出</a>
        </div>
    </div>
</div>

<div class="container">
    <div class="card">
        <h2>我的订单</h2>
        <c:if test="${not empty msg}">
            <div class="alert alert-success">${msg}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-error">${error}</div>
        </c:if>
        <c:choose>
            <c:when test="${empty orders}">
                <div style="text-align:center;padding:60px;color:#999;">
                    <p style="font-size:18px;">暂无订单</p>
                    <a href="/" class="btn btn-primary" style="margin-top:15px;">去逛逛</a>
                </div>
            </c:when>
            <c:otherwise>
                <table>
                    <thead>
                        <tr>
                            <th>订单号</th>
                            <th>金额</th>
                            <th>状态</th>
                            <th>时间</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${orders}" var="o">
                            <tr>
                                <td>${o.orderNo}</td>
                                <td>¥${o.totalPrice}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${o.status == 0}"><span class="order-status order-status-0">待发货</span></c:when>
                                        <c:when test="${o.status == 1}"><span class="order-status order-status-1">已发货</span></c:when>
                                        <c:when test="${o.status == 2}"><span class="order-status order-status-2">已完成</span></c:when>
                                    </c:choose>
                                </td>
                                <td><fmt:formatDate value="${o.createTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                                <td><a href="/order/detail?id=${o.id}" class="btn btn-default btn-sm">查看详情</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<div class="footer">桃子商城 © 2026 JavaEE项目</div>
</body>
</html>
