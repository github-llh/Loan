package com.llh.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 
 * @TableName c_oper
 */
@Data
public class Oper implements Serializable {
    /**
     * 操作记录唯一标识
     */
    private Integer rid;

    /**
     * 贷款记录唯一标识
     */
    private Integer lid;

    /**
     * 管理员唯一标识
     */
    private Integer uid;

    /**
     * 操作记录：1，通过贷款申请 2，驳回贷款申请 3，放款成功
     */
    private Integer operCode;

    /**
     * 操作具体时间
     */
    private Date operTime;

    private static final long serialVersionUID = 1L;
}