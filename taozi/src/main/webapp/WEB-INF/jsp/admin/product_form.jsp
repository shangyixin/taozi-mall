<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${empty product.id ? '添加' : '编辑'}商品 - 桃子商城</title>
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
        <h2>${empty product.id ? '添加' : '编辑'}商品</h2>
        <form action="/admin/product/save" method="post">
            <input type="hidden" name="id" value="${product.id}">
            <div class="form-group">
                <label>商品名称</label>
                <input type="text" name="name" value="${product.name}" required>
            </div>
            <div class="form-group">
                <label>商品描述</label>
                <textarea name="description">${product.description}</textarea>
            </div>
            <div class="form-group">
                <label>价格</label>
                <input type="number" name="price" value="${product.price}" step="0.01" min="0" required>
            </div>
            <div class="form-group">
                <label>库存</label>
                <input type="number" name="stock" value="${product.stock}" min="0" required>
            </div>
            <div class="form-group">
                <label>分类</label>
                <select name="categoryId">
                    <option value="">请选择分类</option>
                    <c:forEach items="${categories}" var="cat">
                        <option value="${cat.id}" ${product.categoryId == cat.id ? 'selected' : ''}>${cat.name}</option>
                    </c:forEach>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">保存</button>
            <a href="/admin/product/list" class="btn btn-default">返回</a>
        </form>
    </div>
</div>

<div class="footer">桃子商城 © 2026 JavaEE项目</div>
</body>
</html>
