package com.llh.utils;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

/**
 * User: lilinhan
 * DateTime: 2023/5/30 17:20
 */
public class BaseDao {
      static SqlSessionFactory factory = null;

      static {
            try {
                  InputStream stream = Resources.getResourceAsStream("mybatis.xml");
                  factory = new SqlSessionFactoryBuilder().build(stream);
            } catch (IOException e) {
                  throw new RuntimeException(e);
            }
      }

      public static SqlSession getSql() {
            return factory.openSession(true);
      }
}
