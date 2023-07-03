package com.llh.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.llh.domain.Loan;
import com.llh.domain.User;
import com.llh.service.Impl.LoanServiceImpl;
import com.llh.service.LoanService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * User: lilinhan
 * DateTime: 2023/6/9 13:39
 */
@WebServlet("/loan")
public class LoanController extends HttpServlet {
      LoanService ls = new LoanServiceImpl();

      @Override
      protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            req.setCharacterEncoding("UTF-8");
            resp.setContentType("text/html;charset=UTF-8");
            String method = req.getParameter("m");
            if (method != null && !"".equals(method)) {
                  if ("getLoans".equals(method)) {
                        getLoans(req, resp);
                  }
                  if ("getUsers".equals(method)) {
                        getUsers(req, resp);
                  }
                  if ("login".equals(method)) {
                        login(req, resp);
                  }
                  if ("exit".equals(method)) {
                        exit(req, resp);
                  }
                  if ("toUpdate".equals(method)) {
                        toUpdate(req, resp);
                  }
                  if("updateLoan_1".equals(method)){
                        updateLoan_1(req,resp);
                  }
                  if("updateLoan_3".equals(method)){
                        updateLoan_3(req,resp);
                  }
                  if("addLoan".equals(method)){
                        addLoan(req,resp);
                  }
                  if("addBatch".equals(method)){
                        addBatch(req,resp);
                  }
                  if("test".equals(method)){
                        test(req,resp);
                  }
            }
      }

      private void test(HttpServletRequest req, HttpServletResponse resp) {

      }

      private void addBatch(HttpServletRequest req, HttpServletResponse resp) throws IOException {
            Map<String,Object> map = new HashMap<>();
            String[] uname = req.getParameterValues("uname");
            String[] idCard = req.getParameterValues("idCard");
            String[] tel = req.getParameterValues("tel");
            String[] applyDate = req.getParameterValues("applyDate");
            String[] principal = req.getParameterValues("principal");

            User user = (User) req.getSession().getAttribute("USER");

            int i = tel.length;
            int count = 0;
            for (int j = 0; j < i; j++) {
                  map.put("uname",uname[j]);
                  map.put("idCard",idCard[j]);
                  map.put("tel",idCard[j]);
                  map.put("applyDate",applyDate[j]);
                  map.put("principal",principal[j]);
                  map.put("uid",user.getUid());
                  count += ls.addBatch(map);
            }
            resp.getWriter().println(JSON.toJSONString(count));
      }

      private void addLoan(HttpServletRequest req, HttpServletResponse resp) throws IOException {
            Map<String,Object> map = new HashMap<>();
            map.put("uname",req.getParameter("uname"));
            map.put("idCard",req.getParameter("idCard"));
            map.put("tel",req.getParameter("tel"));
            map.put("applyDate",req.getParameter("applyDate"));
            map.put("principal",req.getParameter("principal"));

            User user = (User) req.getSession().getAttribute("USER");
            map.put("uid",user.getUid());

            int i = ls.addLoan(map);
            resp.getWriter().println(JSON.toJSONString(i));
      }


      private void updateLoan_1(HttpServletRequest req, HttpServletResponse resp) throws IOException {
            Map<String,Object> map = new HashMap<>();
            map.put("lid",req.getParameter("lid"));
            map.put("flag",req.getParameter("flag"));

            int i = ls.updateLoan_1(map);
            resp.getWriter().println(JSON.toJSONString(i));

            User user = (User) req.getSession().getAttribute("USER");
            if(user!=null){
                  ls.addLog(req.getParameter("lid"),user.getUid(),map.get("flag").toString());
            }
      }

      private void updateLoan_3(HttpServletRequest req, HttpServletResponse resp) throws IOException {
            Map<String,Object> map = new HashMap<>();
            map.put("lid",req.getParameter("lid"));
            map.put("uname",req.getParameter("uname"));
            map.put("idCard",req.getParameter("idCard"));
            map.put("tel",req.getParameter("tel"));
            map.put("applyDate",req.getParameter("applyDate"));
            map.put("principal",req.getParameter("principal"));
            map.put("interest",req.getParameter("interest"));
            map.put("timeLimit",req.getParameter("timeLimit"));
            map.put("flag",req.getParameter("flag"));

            int i = ls.updateLoan_3(map);
            resp.getWriter().println(JSON.toJSONString(i));

            User user = (User) req.getSession().getAttribute("USER");
            if(user!=null){
                  ls.addLog(req.getParameter("lid"),user.getUid(),map.get("flag").toString());
            }
      }

      private void toUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String lid = req.getParameter("lid");
            Loan loan = ls.getLoanById(lid);
            req.setAttribute("loan",loan);
            req.getRequestDispatcher("loan_update.jsp").forward(req,resp);
      }

      private void exit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            req.getSession().invalidate();
            req.getRequestDispatcher("index.jsp").forward(req,resp);
      }

      private void login(HttpServletRequest req, HttpServletResponse resp) throws IOException {
            String name = req.getParameter("name");
            String pwd = req.getParameter("pwd");
            User user = ls.login(name, pwd);

            resp.getWriter().println(JSON.toJSONString(user));
            req.getSession().setAttribute("USER", user);

      }

      private void getUsers(HttpServletRequest req, HttpServletResponse resp) throws IOException {
            List<User> users = ls.getUsers();
            resp.getWriter().println(JSON.toJSONString(users));
      }

      private void getLoans(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            Map<String, Object> map = new HashMap<>();
            map.put("uname", req.getParameter("uname"));
            map.put("idCard", req.getParameter("idCard"));
            map.put("tel", req.getParameter("tel"));
            map.put("uid", req.getParameter("uid"));
            map.put("minDate", req.getParameter("minDate"));
            map.put("maxDate", req.getParameter("maxDate"));
            map.put("flag", req.getParameter("flag"));

            String pageNum = req.getParameter("pageNum");

            PageInfo<Loan> loans = ls.getLoans(map, pageNum);
            req.setAttribute("map", map);
            req.setAttribute("pageInfo", loans);
            req.getRequestDispatcher("loan_list.jsp").forward(req, resp);
      }
}
