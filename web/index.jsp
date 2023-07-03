<%--
  Created by IntelliJ IDEA.
  User: lilinhan
  Date: 2023/6/9
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<html>
<head>
      <title>$Title$</title>
      <link href="css/bootstrap.min.css" rel="stylesheet">
      <script type="text/javascript" src="js/jquery-3.5.1.js"></script>
      <%--echart线图、柱状图、饼图等各种图型库 cdn--%>
      <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
      <%--jquery cdn--%>
      <script type="text/javascript" src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.1/jquery.js"></script>
</head>
<body>
      <center>
            <form>
                  用户名：<input type="text" name="name" onblur="checkName()"><span id="sp1"></span><br>
                  密码：<input type="text" name="pwd" onblur="checkPwd()"><span id="sp2"></span><br>
                  <button type="button" onclick="login()">登录</button>
            </form>
      </center>

      <script>
            function checkName(){
                let val = $("[name=name]").val();
                if(val!=""){
                    $("#sp1").html("");
                }else{
                    $("#sp1").html("<font style='color: red'>用户名不能为空</font>");
                }
            }
            function checkPwd(){
                let val = $("[name=pwd]").val();
                if(val!=""){
                    $("#sp2").html("");
                }else{
                    $("#sp2").html("<font style='color: red'>密码不能为空</font>");
                }
            }
            function login(){
                checkName();
                checkPwd();
                let text = $("span").text();
                if(text==""){
                    $.post(
                        "loan?m=login",
                        $("form").serialize(),
                        function (data){
                            if(data!=null){
                                alert("登录成功");
                                location.href="loan?m=getLoans";
                            }else{
                                alert("登录失败");
                            }
                        },
                        "json"
                    )
                }else{
                    alert("好好检查一下");
                }
            }
      </script>
</body>
</html>
