<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: lilinhan
  Date: 2023/6/9
  Time: 14:51
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
      <script>
            $(function (){
                $.get(
                    "loan?m=getUsers",
                    function (data){
                        for (let x in data) {
                            $("[name=uid]").append("<option value='"+data[x].uid+"'>"+data[x].loginName+"</option>");
                        }
                        $("[name=uid]").val(${map.uid})
                    },
                    "json"
                )
            })
      </script>
</head>
<body>
      <center>
            <h4>欢迎 ${USER.loginName} 登录成功！</h4>
            <div style="width: 1500px;">
                  <form action="loan?m=getLoans" method="post">
                        <table class="table table-bordered table-striped table-hover align-middle caption-top text-center">
                              <caption>用户列表</caption>
                              <thead class="table-light">
                              <tr>
                                    <td colspan="13">
                                          姓名模糊：<input type="text" name="uname" value="${map.uname}">
                                          身份证模糊：<input type="text" name="idCard" value="${map.idCard}">
                                          手机号模糊：<input type="text" name="tel" value="${map.tel}">
                                          放款人:
                                          <select name="uid">
                                                <option value="">--请选择--</option>
                                          </select><br>
                                          申请日期：<input type="text" onclick="WdatePicker()" name="minDate" value="${map.minDate}">-
                                          <input type="text" onclick="WdatePicker()" name="maxDate" value="${map.maxDate}">
                                          审核状态：
                                          <select name="flag">
                                                <option value="">--请选择--</option>
                                                <option value="1" ${map.flag==1?"selected":""}>待审核</option>
                                                <option value="2" ${map.flag==2?"selected":""}>待放款</option>
                                                <option value="3" ${map.flag==3?"selected":""}>已驳回</option>
                                                <option value="4" ${map.flag==4?"selected":""}>已放款</option>
                                          </select>
                                          <button type="submit" class="btn btn-outline-primary btn-sm">查询</button>
                                          <button type="button" class="btn btn-outline-primary btn-sm" onclick="cl()">重置</button>
                                          <button type="button" class="btn btn-outline-primary btn-sm" onclick="exitLogin()">退出</button>
                                          <button type="button" class="btn btn-outline-primary btn-sm" onclick="add()">普通添加</button>
                                          <button type="button" class="btn btn-outline-primary btn-sm" onclick="addBatch()">批量添加</button>
                                    </td>
                              </tr>
                              <tr>
                                    <td>编号</td>
                                    <td>姓名</td>
                                    <td>身份证</td>
                                    <td>电话</td>
                                    <td>申请日期</td>
                                    <td>贷款金额(元)</td>
                                    <td>年利息(百分比)</td>
                                    <td>贷款时长(天)</td>
                                    <td>最终还款金额(元)</td>
                                    <td>还款日期</td>
                                    <td>审核状态</td>
                                    <td>创建人</td>
                                    <td>操作</td>
                              </tr>
                              </thead>
                              <tbody class="table-group-divider">
                              <c:forEach items="${pageInfo.list}" var="loan">
                                    <tr>
                                          <td>
                                                <input type="checkbox" class="ck" value="${loan.lid}">
                                                ${loan.lid}
                                          </td>
                                          <td>${loan.uname}</td>
                                          <td>${loan.idCard.substring(0,6)}********${loan.idCard.substring(14)}</td>
                                          <td>${loan.tel.substring(0,7)}****</td>
                                          <td>
                                                <fmt:formatDate value="${loan.applyDate}" pattern="yyyy-MM-dd"></fmt:formatDate>
                                          </td>
                                          <td>${loan.principal}</td>
                                          <td>
                                                <c:if test="${loan.interest==null}">
                                                      null
                                                </c:if>
                                                <c:if test="${loan.interest!=null}">
                                                      ${loan.interest}
                                                </c:if>
                                          </td>
                                          <td>
                                                <c:if test="${loan.timeLimit==null}">
                                                      null
                                                </c:if>
                                                <c:if test="${loan.timeLimit!=null}">
                                                      ${loan.timeLimit}
                                                </c:if>
                                          </td>
                                          <td>
                                                <c:if test="${loan.endPrincipal==null}">
                                                      null
                                                </c:if>
                                                <c:if test="${loan.endPrincipal!=null}">
                                                      ${loan.endPrincipal}
                                                </c:if>
                                          </td>
                                          <td>
                                                <c:if test="${loan.endDate==null}">
                                                      null
                                                </c:if>
                                                <c:if test="${loan.endDate!=null}">
                                                      <fmt:formatDate value="${loan.endDate}" pattern="yyyy-MM-dd"></fmt:formatDate>
                                                </c:if>
                                          </td>
                                          <td>
                                                <c:if test="${loan.flag==1}">
                                                      待审核
                                                </c:if>
                                                <c:if test="${loan.flag==2}">
                                                      【待放款】
                                                </c:if>
                                                <c:if test="${loan.flag==3}">
                                                      驳回申请
                                                </c:if>
                                                <c:if test="${loan.flag==4}">
                                                      已放款
                                                </c:if>
                                          </td>
                                          <td>${loan.loginName}</td>
                                          <td>
                                                <c:if test="${USER.grade==1}">
                                                      <c:if test="${loan.flag==1}">
                                                            <button type="button" class="btn btn-outline-primary btn-sm" onclick="gotoExamine(${loan.lid})">前往审核</button>
                                                      </c:if>
                                                      <c:if test="${loan.flag==2}">
                                                            没有权限
                                                      </c:if>
                                                      <c:if test="${loan.flag==3}">
                                                            没有权限
                                                      </c:if>
                                                      <c:if test="${loan.flag==4}">
                                                            没有权限
                                                      </c:if>
                                                </c:if>
                                                <c:if test="${USER.grade==2}">
                                                      <c:if test="${loan.flag==1}">
                                                            <button type="button" class="btn btn-outline-primary btn-sm" onclick="gotoExamine(${loan.lid})">前往审核</button>
                                                      </c:if>
                                                      <c:if test="${loan.flag==2}">
                                                            <button type="button" class="btn btn-outline-primary btn-sm" onclick="gotoExamine(${loan.lid})">前往放款</button>
                                                      </c:if>
                                                      <c:if test="${loan.flag==3}">
                                                            已驳回
                                                      </c:if>
                                                      <c:if test="${loan.flag==4}">
                                                            无需操作
                                                      </c:if>
                                                </c:if>
                                          </td>
                                    </tr>
                              </c:forEach>
                              <tr>
                                    <td colspan="13">
                                          <button type="button" class="btn btn-outline-primary btn-sm" name="pageNum" onclick="xz(true)">全选</button>
                                          <button type="button" class="btn btn-outline-primary btn-sm" name="pageNum" onclick="xz(false)">全不选</button>
                                          <button type="button" class="btn btn-outline-primary btn-sm" name="pageNum" onclick="xx()">反选</button>

                                          <button class="btn btn-outline-primary btn-sm" name="pageNum" value="1">首页</button>
                                          <button class="btn btn-outline-primary btn-sm" name="pageNum" value="${pageInfo.prePage==1?1:pageInfo.prePage}">上一页</button>
                                          <button class="btn btn-outline-primary btn-sm" name="pageNum" value="${pageInfo.pageNum}">${pageInfo.pageNum}</button>
                                          <button class="btn btn-outline-primary btn-sm" name="pageNum" value="${pageInfo.nextPage==0?pageInfo.pages:pageInfo.nextPage}">下一页</button>
                                          <button class="btn btn-outline-primary btn-sm" name="pageNum" value="${pageInfo.pages}">尾页</button>
                                          总条数：${pageInfo.total}条
                                    </td>
                              </tr>
                              </tbody>
                        </table>
                  </form>
            </div>
      </center>

      <script type="text/javascript">
            function cl(){
                $("[name=uname]").val("");
                $("[name=idCard]").val("");
                $("[name=tel]").val("");
                $("[name=uid]").val("");
                $("[name=minDate]").val("");
                $("[name=maxDate]").val("");
                $("[name=flag]").val("");
            }

            function add(){
                location.href="loan_add.jsp";
            }

            function xz(flag){
                $(".ck").each(function (){
                    this.checked=flag;
                })
            }

            function xx(){
                $(".ck").each(function (){
                    this.checked=!this.checked;
                })
            }

            function exitLogin(){
                location.href="loan?m=exit";
            }

            function gotoExamine(lid){
                location.href="loan?m=toUpdate&lid="+lid;
            }

            function addBatch(){
                location.href="loan_addBth.jsp";
            }
      </script>
</body>
</html>
