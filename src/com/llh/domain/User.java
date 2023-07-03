package com.llh.domain;

import java.io.Serializable;
import lombok.Data;

/**
 * 
 * @TableName c_user
 */
@Data
public class User implements Serializable {
    /**
     * 管理员唯一标识
     */
    private Integer uid;

    /**
     * 登录名
     */
    private String loginName;

    /**
     * 登录密码
     */
    private String loginPwd;

    /**
     * 管理员等级：1，普通管理员(只负责审核贷款，申请贷款，无权放款) 2，超级管理员(拥有所有操作权限)
     */
    private Integer grade;

    private static final long serialVersionUID = 1L;
}