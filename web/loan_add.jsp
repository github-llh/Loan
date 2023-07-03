<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: lilinhan
  Date: 2023/6/9
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<html>
<head>
      <title>Title</title>
      <link href="css/bootstrap.min.css" rel="stylesheet">
      <script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
      <script type="text/javascript" src="js/jquery-3.5.1.js"></script>
      <%--echart线图、柱状图、饼图等各种图型库 cdn--%>
      <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
      <%--jquery cdn--%>
      <script type="text/javascript" src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.1/jquery.js"></script>
</head>
<body>
      <center>
            <div style="width: 500px;height: 500px;text-align: left;border: 1px solid red">
                  <form>
                        姓名：<input type="text" name="uname" onblur="check_2()"><span id="sp2"></span> <br>
                        身份证号：<input type="text" name="idCard" onblur="check_3()"><span id="sp3"></span> <br>
                        手机号：<input type="text" name="tel" onblur="check_4()"><span id="sp4"></span> <br>
                        申请日期：<input type="text" name="applyDate" onclick="WdatePicker()" onblur="check_5()">
                        <span id="sp5"></span> <br>
                        贷款金额：<input type="text" name="principal" onblur="check_6()"><span id="sp6"></span> <br>
                        <button type="button" onclick="addLoan()">提交</button>
                  </form>
            </div>
      </center>

      <script type="text/javascript">
          function addLoan() {
              check_2();
              check_3();
              check_4();
              check_5();
              check_6();

              let text = $("span").text();
              if (text == "") {
                  $.post(
                      "loan?m=addLoan",
                      $("form").serialize(),
                      function (msg){
                          if(msg>0){
                              alert("添加成功");
                              location.href="loan?m=getLoans";
                          }else{
                              alert("添加失败");
                          }
                      },
                      "json"
                  )
              } else {
                  alert("好好检查一下")
              }
          }

          function check_2() {
              let val = $("[name=uname]").val();
              if (val != "") {
                  $("#sp2").html("");
              } else {
                  $("#sp2").html("<font style='color: red'>姓名不能为空</font>");
              }
          }

          function check_3() {
              let val = $("[name=idCard]").val();
              let str = /^[0-9]\d{16}[\dXx]$/
              if (val != "") {
                  if(str.test(val)){
                      $("#sp3").html("");
                  }else{
                      $("#sp3").html("<font style='color: red'>请正确输入身份证号</font>");
                  }
              } else {
                  $("#sp3").html("<font style='color: red'>身份证号不能为空</font>");
              }
          }

          function check_4() {
              let val = $("[name=tel]").val();
              let str = /^[0-9]\d{10}$/
              if (val != "") {
                  if(str.test(val)){
                      $("#sp4").html("");
                  }else{
                      $("#sp4").html("<font style='color: red'>请正确输入手机号</font>");
                  }
              } else {
                  $("#sp4").html("<font style='color: red'>手机号不能为空</font>");
              }
          }

          function check_5() {
              let val = $("[name=applyDate]").val();
              if (val != "") {
                  $("#sp5").html("");
              } else {
                  $("#sp5").html("<font style='color: red'>申请日期不能为空</font>");
              }
          }

          function check_6() {
              let val = $("[name=principal]").val();
              if (val != "") {
                  $("#sp6").html("");
              } else {
                  $("#sp6").html("<font style='color: red'>贷款金额日期不能为空</font>");
              }
          }
      </script>
</body>
</html>
