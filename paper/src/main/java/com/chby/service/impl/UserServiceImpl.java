package com.chby.service.impl;

import com.chby.mapper.UserMapper;
import com.chby.pojo.User;
import com.chby.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/10/10.
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired(required = false)
    private UserMapper userDao;

    @Override
    public User isLogin(String username, String password) {
        return userDao.isLogin(username,password);
    }

    @Override
    public Boolean addUser(User user) {
        return userDao.addUser(user);
    }

    @Override
    public Boolean updateUser(User user) {
        return userDao.update(user);
    }


    @Override
    public User selectUserByName(String username) {
        return userDao.selectUserByName(username);
    }

    @Override
    public String verifyByEmail(String email) {
        return userDao.verifyByEmail(email);
    }

    @Override
    public User selectIserByEmail(String email) {
        return userDao.selectIserByEmail(email);
    }

}
