<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>

<html>
<head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="./CSS/Login_alert/2.css" type="text/css">
    <script type="text/javascript" src="./JS/login_alert_1.js"></script>
    <script type="text/javascript" src="./JS/login_alert_2.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <!--<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">-->
    <style>
        body#PersonInf fieldset#fieldset {
            padding: 0;
            border: 0;
            margin-left: 50px;
            margin-top: 10px
        }

        body#PersonInf #change_button {
            margin-left: 70px;
            margin-bottom: 15px
        }

        body#PersonInf #ensure {
            margin-left: 72px;
            margin-bottom: 15px;
            height: 40px
        }
    </style>
    <script>
        $().ready(function () {
            $("body#PersonInf #form1").validate({
                rules: {
                    name: {
                        required: true,
                        maxlength: 20,
                        minlength: 1,
                    },
                    workernumber: {
                        required: true,
                        max: 99999999,
                        min: 10000000,
                    },
                    tel: {
                        required: true,
                        maxlength: 11,
                        minlength: 11,
                    },
                    email: {
                        required: true,
                        email: true
                    }
                },
                messages: {
                    name: {
                        required: "请输入姓名",
                        maxlength: "名字过长",
                        minlength: "名字过短",
                    },
                    workernumber: {
                        required: "请输入职工号",
                        max: "职工号错误",
                        min: "职工号错误",
                    },
                    tel: {
                        required: "请输入常用手机号",
                        maxlength: "手机号错误",
                        minlength: "手机号错误",
                    },
                    email: {
                        required: "请填写邮箱",
                        email: "请输入正确的email地址",
                    }
                }
            });
        });
        $(function () {

            $("body#PersonInf #change_button")
                .button()
                .click(function () {
                    document.getElementById("name").readOnly = false;
                    document.getElementById("sex").disabled = false;
                    document.getElementById("number").readOnly = false;
                    document.getElementById("position").disabled = false;
                    document.getElementById("type").disabled = false;
                    document.getElementById("tel").readOnly = false;
                    document.getElementById("email").readOnly = false;
                    $("body#PersonInf #change_div").hide();
                    $("body#PersonInf #ensure").show();
                    return false;
                });
        });
    </script>
</head>
<body id="PersonInf">

<div id="users-form" title="个人信息">
    <form id="form1" method="post" role="form" style="line-height:35px" class="form-inline" action="/UpdateServlet">
        <fieldset id="fieldset">
            <label for="name" class="form-label">姓名:
                <input type="text" style="height:28px" name="name" id="name" class="form-control" readonly="readonly"
                       value="${user.name}">
            </label><br/>
            <label for="sex" class="form-label">性别:
                <select class="pulldown" name="sex" id="sex" class="form-control" disabled="disabled">
                    <option value="男"
                            <c:if test="${ user['sex'] == '男'}">selected</c:if> >男
                    </option>
                    <option value="女" <c:if test="${ user['sex'] == '女'}">selected</c:if>>女</option>
                </select> </label><br/>
            <label for="number" class="form-label">职工号:
                <input type="text" style="height:28px" name="number" id="number" class="form-control"
                       readonly="readonly" value="${user['number']}"></label><br/>
            <label for="position" class="form-label">职称:
                <select class="pulldown" name="position" id="position" class="form-control" disabled="disabled">
                    <option value="教授"
                            <c:if test="${ user['position'] == '教授'}">selected</c:if> >教授
                    </option>
                    <option value="副教授"
                            <c:if test="${ user['position'] == '副教授'}">selected</c:if> >副教授
                    </option>
                    <option value="讲师"
                            <c:if test="${ user['position'] == '讲师'}">selected</c:if> >讲师
                    </option>
                </select> </label><br/>
            <label for="type" class="form-label">类型:
                <select class="pulldown" name="type" id="type" class="form-control" disabled="disabled">
                    <option value="科研教学型"
                            <c:if test="${ user['type'] == '科研教学型'}">selected</c:if> >科研教学型
                            </option>
                    <option value="教学科研型"
                            <c:if test="${user['type'] == '教学科研型'}">selected</c:if> >教学科研型
                    </option>
                </select> </label><br/>
            <label for="tel" class="form-label">TEL:
                <input type="text" style="height:28px" name="tel" id="tel" class="form-control" value="${user['tel']}"
                       readonly="readonly"></label><br/>
            <label for="email" class="form-label">Email:
                <input type="text" style="height:28px" name="email" id="email" class="form-control"
                       readonly="readonly" value="${user['email']}"> </label><br/>
        </fieldset>
        <div id="change_div">
            <button id="change_button" type="button">修改</button>
        </div>

        <input type='submit' value='确定' style="display: none" name='' id='ensure'>
    </form>
</div>

</body>
</html>
