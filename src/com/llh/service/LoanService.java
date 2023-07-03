package com.llh.service;

import com.github.pagehelper.PageInfo;
import com.llh.domain.Loan;
import com.llh.domain.User;

import java.util.List;
import java.util.Map;

/**
 * User: lilinhan
 * DateTime: 2023/6/9 13:39
 */
public interface LoanService {
      PageInfo<Loan> getLoans(Map<String, Object> map,String pageNum);
      List<User> getUsers();
      User login(String name,String pwd);
      Loan getLoanById(String lid);
      int updateLoan_1(Map<String,Object> map);
      void addLog(String lid, int uid, String fid);
      int updateLoan_3(Map<String,Object> map);
      int addLoan(Map<String,Object> map);
      int addBatch(Map<String,Object> map);
}
