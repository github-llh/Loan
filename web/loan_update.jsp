<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: lilinhan
  Date: 2023/6/9
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<html>
<head>
      <title>Title</title>
      <link href="css/bootstrap.min.css" rel="stylesheet">
      <script type="text/javascript" src="js/jquery-3.5.1.js"></script>
      <%--echart线图、柱状图、饼图等各种图型库 cdn--%>
      <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
      <%--jquery cdn--%>
      <script type="text/javascript" src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.1/jquery.js"></script>
</head>
<body>
<center>
      <div style="width: 500px;height: 500px;border: 1px solid red;text-align: left">
            <form>
                  <c:if test="${USER.grade==2}">
                        <c:if test="${loan.flag==1}">
                              贷款人编号：<input type="text" name="lid" value="${loan.lid}" readonly><span id="sp1"></span> <br>
                              姓名：<input type="text" name="uname" value="${loan.uname}" onblur="check_2()"><span id="sp2"></span> <br>
                              身份证号：<input type="text" name="idCard" value="${loan.idCard}" onblur="check_3()"><span id="sp3"></span> <br>
                              手机号：<input type="text" name="tel" value="${loan.tel}" onblur="check_4()"><span id="sp4"></span> <br>
                              申请日期：<input type="text" name="applyDate" onclick="WdatePicker()" onblur="check_5()"
                              value="<fmt:formatDate value="${loan.applyDate}" pattern="yyyy-MM-dd"></fmt:formatDate>">
                              <span id="sp5"></span> <br>
                              贷款金额：<input type="text" name="principal" value="${loan.principal}" onblur="check_6()"><span id="sp6"></span> <br>
                              审核状态：
                              <input type="radio" name="flag" value="2" ${loan.flag==1?"checked":""} onchange="check_9()">通过审核
                              <input type="radio" name="flag" value="3" onchange="check_9()">驳回
                              <span id="sp9"></span> <br>
                              <button type="button" onclick="updateLoan_1()">提交</button>
                        </c:if>
                        <c:if test="${loan.flag==2}">
                              贷款人编号：<input type="text" name="lid" value="${loan.lid}" readonly><span id="sp1"></span> <br>
                              姓名：<input type="text" name="uname" value="${loan.uname}" onblur="check_2()"><span id="sp2"></span> <br>
                              身份证号：<input type="text" name="idCard" value="${loan.idCard}" onblur="check_3()"><span id="sp3"></span> <br>
                              手机号：<input type="text" name="tel" value="${loan.tel}" onblur="check_4()"><span id="sp4"></span> <br>
                              申请日期：<input type="text" name="applyDate" onclick="WdatePicker()" onblur="check_5()"
                              value="<fmt:formatDate value="${loan.applyDate}" pattern="yyyy-MM-dd"></fmt:formatDate>">
                              <span id="sp5"></span> <br>
                              贷款金额：<input type="text" name="principal" value="${loan.principal}" onblur="check_6()"><span id="sp6"></span> <br>
                              年利息(%)：<input type="text" name="interest" value="${loan.interest}" onblur="check_7()"><span id="sp7"></span> <br>
                              贷款时长(天)：<input type="text" name="timeLimit" value="${loan.timeLimit}" onblur="check_8()"><span id="sp8"></span> <br>
                              审核状态：
                              <input type="radio" name="flag" value="4" ${loan.flag==2?"checked":""} onchange="check_9()">放款
                              <span id="sp9"></span> <br>
                              <button type="button" onclick="updateLoan_3()">提交</button>
                        </c:if>
                  </c:if>
                  <c:if test="${USER.grade==1}">
                        贷款人编号：<input type="text" name="lid" value="${loan.lid}" readonly><span id="sp1"></span> <br>
                        姓名：<input type="text" name="uname" value="${loan.uname}" onblur="check_2()"><span id="sp2"></span> <br>
                        身份证号：<input type="text" name="idCard" value="${loan.idCard}" onblur="check_3()"><span id="sp3"></span> <br>
                        手机号：<input type="text" name="tel" value="${loan.tel}" onblur="check_4()"><span id="sp4"></span> <br>
                        申请日期：<input type="text" name="applyDate" onclick="WdatePicker()" onblur="check_5()"
                        value="<fmt:formatDate value="${loan.applyDate}" pattern="yyyy-MM-dd"></fmt:formatDate>">
                        <span id="sp5"></span> <br>
                        贷款金额：<input type="text" name="principal" value="${loan.principal}" onblur="check_6()"><span id="sp6"></span> <br>
                        审核状态：
                        <input type="radio" name="flag" value="2" ${loan.flag==1?"checked":""} onchange="check_9()">通过审核
                        <span id="sp9"></span> <br>
                        <button type="button" onclick="updateLoan_1()">提交</button>
                  </c:if>
            </form>
      </div>
</center>

<script>
    function updateLoan_1() {
        check_2();
        check_3();
        check_4();
        check_5();
        check_6();
        check_9();

        let text = $("span").text();
        let val = $("[name=flag]:checked").val();

        if (text == "") {
            if(val==2){
                $.post(
                    "loan?m=updateLoan_1",
                    $("form").serialize(),
                    function (msg){
                        if(msg>0){
                            alert("审核成功");
                            location.href="loan?m=getLoans";
                        }else{
                            alert("审核失败");
                        }
                    },
                    "json"
                )
            }
            if(val==3){
                $.post(
                    "loan?m=updateLoan_1",
                    $("form").serialize(),
                    function (msg){
                        if(msg>0){
                            alert("驳回成功");
                            location.href="loan?m=getLoans";
                        }else{
                            alert("驳回失败");
                        }
                    },
                    "json"
                )
            }

        } else {
            alert("好好检查一下")
        }
    }

    function updateLoan_3() {
        check_2();
        check_3();
        check_4();
        check_5();
        check_6();
        check_7();
        check_8();
        check_9();

        let text = $("span").text();
        if (text == "") {
            $.post(
                "loan?m=updateLoan_3",
                $("form").serialize(),
                function (msg){
                    if(msg>0){
                        alert("放款成功");
                        location.href="loan?m=getLoans";
                    }else{
                        alert("放款失败");
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
        if (val != "") {
            $("#sp3").html("");
        } else {
            $("#sp3").html("<font style='color: red'>身份证号不能为空</font>");
        }
    }

    function check_4() {
        let val = $("[name=tel]").val();
        if (val != "") {
            $("#sp4").html("");
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

    function check_7() {
        let val = $("[name=interest]").val();
        if (val != "") {
                $("#sp7").html("");
        } else {
            $("#sp7").html("<font style='color: red'>年利息不能为空</font>");
        }
    }

    function check_8() {
        let val = $("[name=timeLimit]").val();
        if (val != "") {
            $("#sp8").html("");
        } else {
            $("#sp8").html("<font style='color: red'>贷款时长不能为空</font>");
        }
    }

    function check_9() {
        let val = $("[name=flag]:checked").val();
        if (val != "") {
            $("#sp9").html("");
        } else {
            $("#sp9").html("<font style='color: red'>审核状态不能为空</font>");
        }
    }
</script>
</body>
</html>
