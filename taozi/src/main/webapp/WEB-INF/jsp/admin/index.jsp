<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理 - 桃子商城</title>
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
            <a href="/admin" class="active">管理首页</a>
            <a href="/admin/product/list">商品管理</a>
            <a href="/admin/customer/list">客户管理</a>
            <a href="/admin/category/list">分类管理</a>
        </div>
        <div class="admin-content">
            <div class="card">
                <h2>欢迎使用后台管理系统</h2>
                <p style="line-height:2;color:#666;">
                    请通过左侧菜单进行以下操作：<br>
                    1. <b>商品管理</b> - 添加、修改、删除商品<br>
                    2. <b>客户管理</b> - 查看、删除注册用户<br>
                    3. <b>分类管理</b> - 管理商品分类
                </p>
            </div>
        </div>
    </div>
</div>

<div class="footer">桃子商城 © 2026 JavaEE项目</div>
</body>
</html>
