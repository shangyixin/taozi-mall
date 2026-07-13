<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>商品管理 - 桃子商城</title>
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
    <div class="admin-layout">
        <div class="admin-sidebar">
            <a href="/admin">管理首页</a>
            <a href="/admin/product/list" class="active">商品管理</a>
            <a href="/admin/customer/list">客户管理</a>
            <a href="/admin/category/list">分类管理</a>
        </div>
        <div class="admin-content">
            <div class="card">
                <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:15px;">
                    <h2 style="margin:0;border:none;padding:0;">商品列表</h2>
                    <a href="/admin/product/add" class="btn btn-primary">添加商品</a>
                </div>
                <c:if test="${not empty msg}">
                    <div class="alert alert-success">${msg}</div>
                </c:if>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>名称</th>
                            <th>价格</th>
                            <th>库存</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${products}" var="p">
                            <tr>
                                <td>${p.id}</td>
                                <td>${p.name}</td>
                                <td>¥${p.price}</td>
                                <td>${p.stock}</td>
                                <td>
                                    <a href="/admin/product/edit?id=${p.id}" class="btn btn-default btn-sm">编辑</a>
                                    <a href="/admin/product/delete?id=${p.id}" class="btn btn-danger btn-sm" onclick="return confirm('确定删除？')">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="footer">桃子商城 © 2026 JavaEE项目</div>
</body>
</html>
