package com.chby.service;

import com.chby.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.apache.shiro.authz.Permission;

import java.util.List;


public interface UserService {

    User isLogin(String username, String password);
    Boolean addUser(User user);
    Boolean updateUser(User user);
    User selectUserByName(String username);
    String verifyByEmail(String email);
    User selectIserByEmail(String email);
}
