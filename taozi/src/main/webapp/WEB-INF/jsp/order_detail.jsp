<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>订单详情 - 桃子商城</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<div class="header">
    <div class="wrap">
        <div class="logo">桃子商城</div>
        <div class="nav">
            <a href="/">首页</a>
            <a href="/order/list">我的订单</a>
            <a href="/logout">退出</a>
        </div>
    </div>
</div>

<div class="container">
    <div class="card">
        <h2>订单详情</h2>
        <p style="margin:10px 0;">订单号：${order.orderNo}</p>
        <p style="margin:10px 0;">
            状态：
            <c:choose>
                <c:when test="${order.status == 0}"><span class="order-status order-status-0">待发货</span></c:when>
                <c:when test="${order.status == 1}"><span class="order-status order-status-1">已发货</span></c:when>
                <c:when test="${order.status == 2}"><span class="order-status order-status-2">已完成</span></c:when>
            </c:choose>
        </p>
        <p style="margin:10px 0;">下单时间：<fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></p>

        <table style="margin-top:20px;">
            <thead>
                <tr>
                    <th>商品名称</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>小计</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${order.items}" var="item">
                    <tr>
                        <td>${item.productName}</td>
                        <td>¥${item.price}</td>
                        <td>${item.quantity}</td>
                        <td>¥${item.price * item.quantity}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="cart-total">
            订单总金额：<span>¥${order.totalPrice}</span>
        </div>
    </div>
</div>

<div class="footer">桃子商城 © 2026 JavaEE项目</div>
</body>
</html>
