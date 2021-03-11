package com.chby.service;


import com.chby.pojo.Admin;

import java.util.List;

/**
 * Created by Administrator on 2017/10/10.
 */
public interface AdminService {

    /**
     * 根据账号获取账号密码
     * @param adminname
     * @return AdminPojo
     */
     Admin getUserByUserName(String adminname);

//    是否管理员登录了
    Admin isLogin(String username, String password);

    //        注册管理员
    Boolean addAdmin(Admin admin);

    //    通过adminname查找管理员
    Admin selectAdminByName(String username);

}
