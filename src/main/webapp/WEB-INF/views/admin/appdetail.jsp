<%--
  Created by IntelliJ IDEA.
  User: zqx
  Date: 2018/3/6
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css" media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<fieldset class="layui-elem-field">
    <legend>申请人</legend>
    <div class="layui-field-box">
        ${app.stuname}
    </div>
</fieldset>
<fieldset class="layui-elem-field">
    <legend>联系电话</legend>
    <div class="layui-field-box">
        ${app.mobile}
    </div>
</fieldset>
<fieldset class="layui-elem-field">
    <legend>邮箱</legend>
    <div class="layui-field-box">
        ${app.email}
    </div>
</fieldset>
<fieldset class="layui-elem-field">
    <legend>申请时间</legend>
    <div class="layui-field-box">
        ${app.createtime}
    </div>
</fieldset>

<fieldset class="layui-elem-field">
    <legend>申请主题</legend>
    <div class="layui-field-box">
        ${app.title}
    </div>
</fieldset>

<fieldset class="layui-elem-field">
    <legend>详细内容</legend>
    <div class="layui-field-box">
        ${app.body}
    </div>
</fieldset>

<fieldset class="layui-elem-field">
    <legend>处理状态</legend>
    <div class="layui-field-box">
        <span class="layui-badge layui-bg-orange">${app.deal}</span>
    </div>
</fieldset>

<fieldset class="layui-elem-field">
    <legend>处理时间</legend>
    <div class="layui-field-box">
        ${app.dealtime}
    </div>
</fieldset>

<form class="layui-form" method="post" action="#">
    <input type="hidden" value="${app.id}" id="id">
    <input type="hidden" value="${app.deal}" id="state">
    <button type="button" class="layui-btn" id="agree" onclick="agreeChek()">同意申请</button>
    <button type="button" class="layui-btn layui-btn-danger" onclick="doRefuse()" lay-submit lay-filter="refuse">拒绝申请</button>
</form>
<script>
    <%--JS gloable varilible--%>
    var contextPath = "${pageContext.request.contextPath}";
</script>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/fun_detail.js"></script>

</body>
</html>

