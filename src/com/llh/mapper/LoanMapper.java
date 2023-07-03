package com.llh.mapper;

import com.llh.domain.Loan;
import com.llh.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * User: lilinhan
 * DateTime: 2023/6/9 13:38
 */
public interface LoanMapper {
      List<Loan> getLoans(Map<String, Object> map);
      List<User> getUsers();
      User login(@Param("name") String name, @Param("pwd") String pwd);
      Loan getLoanById(@Param("lid") String lid);
      void addLog(@Param("lid") String lid,@Param("uid") int uid, @Param("fid") String fid);
      int updateLoan_1(Map<String,Object> map);
      int updateLoan_3(Map<String,Object> map);
      int addLoan(Map<String,Object> map);
      int addBatch(Map<String,Object> map);
}
