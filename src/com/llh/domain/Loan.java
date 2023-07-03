package com.llh.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @TableName c_loan
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Loan implements Serializable {
      /**
       * 贷款人唯一标识
       */
      private Integer lid;

      /**
       * 贷款人姓名
       */
      private String uname;

      /**
       * 身份证号
       */
      private String idCard;

      /**
       * 电话
       */
      private String tel;

      /**
       * 申请日期
       */
      private Date applyDate;

      /**
       * 贷款本金
       */
      private BigDecimal principal;

      /**
       * 利息/年(默认0.25 1，贷款时长<一年的利息上涨30% 2，时长>=一年并且<=两年的利息上涨50%，时长大于两年的利息上涨70%)
       */
      private Double interest;

      /**
       * 还款期限/天
       */
      private Integer timeLimit;

      /**
       * 审核状态：1，待审核 2，审核通过【待放款】3，驳回贷款申请 4，已放款 该字段默认为1
       */
      private Integer flag;

      /**
       * 删除状态：1，已删除 0，未删除
       */
      private Integer status;

      /**
       * 创建人唯一标识
       */
      private Integer uid;

      /**
       * 最终还款金额
       */
      private BigDecimal endPrincipal;

      /**
       * 还款日期
       */
      private Date endDate;

      /**
       * 放款人
       */
      private String loginName;

      private static final long serialVersionUID = 1L;
}