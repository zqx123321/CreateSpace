<%--
  Created by IntelliJ IDEA.
  User: zqx
  Date: 2018/3/6
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/css.css">
</head>
<body>
${msg}
<div class="nav">
    <a href="http://it.ouc.edu.cn/itstudio/PC/index.html"><img src="${pageContext.request.contextPath}/static/img/it-ico.png" alt=""></a>
    <span class="title"><a href="index">众创空间自主预约</a></span>
</div>

<form action="">
    <input type="hidden" value="${token}", id="token">
</form>
<div id="form">
    <div class="mt mt-panel mt-panel-shadow">
        <div class="mt-panel-header">
            <div class="mt-panel-header-text">时间预约:当前选择的时间为：<h3></h3></div>
        </div>
        <div class="mt-panel-body ">
            <div class="mt mt-form">
                <div class="mt-form-body">
                    <div class="mt mt-field">
                        <div class="mt-field-label">输入姓名:</div>
                        <div class="mt-field-text"><input placeholder="请输入姓名" class="mt-field-text-input" value="">
                            <div class="mt-field-error"></div>
                        </div>
                    </div>
                    <div class="mt mt-field">
                        <div class="mt-field-label">联系方式:</div>
                        <div class="mt-field-text"><input placeholder="请联系方式(方便认证)" class="mt-field-text-input"
                                                          value="">
                            <div class="mt-field-error"></div>
                        </div>
                    </div>
                    <div class="mt mt-field">
                        <div class="mt-field-label">输入邮箱:</div>
                        <div class="mt-field-text"><input placeholder="请输入电子邮箱" class="mt-field-text-input" value="">
                            <div class="mt-field-error"></div>
                        </div>
                    </div>
                    <div class="mt mt-field">
                        <div class="mt-field-label">活动主办方:</div>
                        <div class="mt-field-text"><input placeholder="请输入活动主办方" class="mt-field-text-input" value="">
                            <div class="mt-field-error"></div>
                        </div>
                    </div>
                    <div class="mt mt-field">
                        <div class="mt-field-label">申请主题:</div>
                        <div class="mt-field-text"><input placeholder="申请主题" class="mt-field-text-input" value="">
                            <div class="mt-field-error"></div>
                        </div>
                    </div>
                    <div class="mt mt-field mt-textarea">
                        <div class="mt-field-label">申请内容:</div>
                        <div class="mt-textarea-text">
                            <textarea autocomplete="off" placeholder="" type="text" class="mt-textarea-text-input"
                                      value=""></textarea>
                        </div>
                    </div>

                </div>
                <div class="mt-button">
                    <input type="hidden" name="id" value="">
                    <button id="mt-submit" type="submit" class="button form-button is-disabled" aria-expanded="false"
                            value="前往预约" onclick="getinfo()">
                        前往预约
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="foot">
    Copyright © 2016 Itstudio All rights reserved.
</div>
<script>
    <%--JS gloable varilible--%>
    var contextPath = "${pageContext.request.contextPath}";
</script>
</body>
</html>
<script language=javascript src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/func_input.js"></script>
