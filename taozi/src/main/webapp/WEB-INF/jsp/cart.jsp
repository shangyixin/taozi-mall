<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>购物车 - 桃子商城</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<div class="header">
    <div class="wrap">
        <div class="logo">桃子商城</div>
        <div class="nav">
            <a href="/">首页</a>
            <span>${sessionScope.user.username}</span>
            <a href="/order/list">我的订单</a>
            <a href="/logout">退出</a>
        </div>
    </div>
</div>

<div class="container">
    <div class="card">
        <h2>我的购物车</h2>
        <c:if test="${not empty msg}">
            <div class="alert alert-success">${msg}</div>
        </c:if>
        <c:choose>
            <c:when test="${empty items}">
                <div style="text-align:center;padding:60px;color:#999;">
                    <p style="font-size:18px;">购物车是空的</p>
                    <a href="/" class="btn btn-primary" style="margin-top:15px;">去逛逛</a>
                </div>
            </c:when>
            <c:otherwise>
                <table>
                    <thead>
                        <tr>
                            <th>商品名称</th>
                            <th>单价</th>
                            <th>数量</th>
                            <th>小计</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="total" value="0"/>
                        <c:forEach items="${items}" var="item">
                            <tr>
                                <td>${item.product.name}</td>
                                <td>¥${item.product.price}</td>
                                <td>
                                    <form action="/cart/update" method="post" style="display:inline;">
                                        <input type="hidden" name="id" value="${item.id}">
                                        <input type="number" name="quantity" value="${item.quantity}" min="1" max="${item.product.stock}" style="width:60px;" onchange="this.form.submit()">
                                    </form>
                                </td>
                                <td>¥${item.product.price * item.quantity}</td>
                                <td><a href="/cart/delete?id=${item.id}" class="btn btn-danger btn-sm" onclick="return confirm('确定删除？')">删除</a></td>
                            </tr>
                            <c:set var="total" value="${total + item.product.price * item.quantity}"/>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="cart-total">
                    合计：<span>¥${total}</span>
                </div>
                <div style="text-align:right;">
                    <form action="/order/checkout" method="post" style="display:inline;">
                        <button type="submit" class="btn btn-primary" style="padding:12px 40px;font-size:16px;">提交订单</button>
                    </form>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<div class="footer">桃子商城 © 2026 JavaEE项目</div>
</body>
</html>
