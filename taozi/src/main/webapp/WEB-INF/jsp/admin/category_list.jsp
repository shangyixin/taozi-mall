<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>分类管理 - 桃子商城</title>
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
            <a href="/admin/product/list">商品管理</a>
            <a href="/admin/customer/list">客户管理</a>
            <a href="/admin/category/list" class="active">分类管理</a>
        </div>
        <div class="admin-content">
            <div class="card">
                <h2>分类管理</h2>
                <c:if test="${not empty msg}">
                    <div class="alert alert-success">${msg}</div>
                </c:if>

                <div class="card" style="box-shadow:none;border:1px solid #eee;">
                    <h3>添加分类</h3>
                    <form action="/admin/category/save" method="post">
                        <div class="form-group">
                            <label>分类名称</label>
                            <input type="text" name="name" required>
                        </div>
                        <div class="form-group">
                            <label>描述</label>
                            <input type="text" name="description">
                        </div>
                        <button type="submit" class="btn btn-primary">添加</button>
                    </form>
                </div>

                <table style="margin-top:15px;">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>名称</th>
                            <th>描述</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${categories}" var="cat">
                            <tr>
                                <td>${cat.id}</td>
                                <td>${cat.name}</td>
                                <td>${cat.description}</td>
                                <td>
                                    <a href="/admin/category/delete?id=${cat.id}" class="btn btn-danger btn-sm" onclick="return confirm('确定删除？')">删除</a>
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
