package com.llh.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import com.llh.domain.Loan;
import com.llh.domain.User;
import com.llh.mapper.LoanMapper;
import com.llh.service.LoanService;
import com.llh.utils.BaseDao;

import java.util.List;
import java.util.Map;

/**
 * User: lilinhan
 * DateTime: 2023/6/9 13:39
 */
public class LoanServiceImpl implements LoanService {
      LoanMapper mapper = BaseDao.getSql().getMapper(LoanMapper.class);

      @Override
      public PageInfo<Loan> getLoans(Map<String, Object> map, String pageNum) {
           if(StringUtil.isEmpty(pageNum)){
                 pageNum = "1";
           }
            PageHelper.startPage(Integer.parseInt(pageNum),7);
            List<Loan> loans = mapper.getLoans(map);
            return new PageInfo<>(loans);
      }

      @Override
      public List<User> getUsers() {
            return mapper.getUsers();
      }

      @Override
      public User login(String name, String pwd) {
            return mapper.login(name,pwd);
      }

      @Override
      public Loan getLoanById(String lid) {
            return mapper.getLoanById(lid);
      }

      @Override
      public int updateLoan_1(Map<String, Object> map) {
            return mapper.updateLoan_1(map);
      }

      @Override
      public void addLog(String lid, int uid, String fid) {
            mapper.addLog(lid,uid,fid);
      }

      @Override
      public int updateLoan_3(Map<String, Object> map) {
            return mapper.updateLoan_3(map);
      }

      @Override
      public int addLoan(Map<String, Object> map) {
            return mapper.addLoan(map);
      }

      @Override
      public int addBatch(Map<String, Object> map) {
            return mapper.addBatch(map);
      }
}
