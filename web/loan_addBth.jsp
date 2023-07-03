<%--
  Created by IntelliJ IDEA.
  User: lilinhan
  Date: 2023/6/12
  Time: 15:21
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
      <form>
            <table>
                  <tbody id="data">
                  <tr id="tr">
                        <td>
                              姓名：<input type="text" name="uname" onblur="check_2(this)"><span id="sp2"></span>
                              身份证号：<input type="text" name="idCard" onblur="check_3(this)"><span id="sp3"></span>
                              手机号：<input type="text" name="tel" onblur="check_4(this)"><span id="sp4"></span>
                              申请日期：<input type="text" name="applyDate" onclick="WdatePicker()"
                                              onblur="check_5(this)">
                              <span id="sp5"></span>
                              贷款金额：<input type="text" name="principal" onblur="check_6(this)"><span id="sp6"></span>
                        </td>
                  </tr>
                  </tbody>
                  <tr>
                        <td>
                              <button type="button" onclick="addLoan()">提交</button>
                              <button type="button" onclick="addTr()">追加</button>
                        </td>
                  </tr>
            </table>
      </form>
</center>

<script type="text/javascript">
    function addTr() {
        $("#data").append($("#tr").clone());
    }

    function addLoan() {
        let text = $("span").text();
        if (text=="") {
            $.post(
                "loan?m=addBatch",
                $("form").serialize(),
                function (msg) {
                    if (msg > 0) {
                        alert("添加成功");
                        location.href = "loan?m=getLoans";
                    } else {
                        alert("添加失败");
                    }
                },
                "json"
            )
        } else {
            alert("好好检查一下")
        }
    }

    function check_2(th) {
        let val = $(th).val();
        if (val != "") {
            $(th).next().html("");
        } else {
            $(th).next().html("<font style='color: red'>姓名不能为空</font>");
        }
    }

    function check_3(th) {
        let val = $(th).val();
        let str = /^[0-9]\d{16}[\dXx]$/
        if (val != "") {
            if (str.test(val)) {
                $(th).next().html("");
            } else {
                $(th).next().html("<font style='color: red'>请正确输入身份证号</font>");
            }
        } else {
            $(th).next().html("<font style='color: red'>身份证号不能为空</font>");
        }
    }

    function check_4(th) {
        let val = $(th).val();
        let str = /^[0-9]\d{10}$/
        if (val != "") {
            if (str.test(val)) {
                $(th).next().html("");
            } else {
                $(th).next().html("<font style='color: red'>请正确输入手机号</font>");
            }
        } else {
            $(th).next().html("<font style='color: red'>手机号不能为空</font>");
        }
    }

    function check_5(th) {
        let val = $(th).val();
        if (val != "") {
            $(th).next().html("");
        } else {
            $(th).next().html("<font style='color: red'>申请日期不能为空</font>");
        }
    }

    function check_6(th) {
        let val = $(th).val();
        if (val != "") {
            $(th).next().html("");
        } else {
            $(th).next().html("<font style='color: red'>贷款金额日期不能为空</font>");
        }
    }
</script>
</body>
</html>
