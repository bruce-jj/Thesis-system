package com.chby.service.impl;

import com.chby.mapper.AdminMapper;
import com.chby.pojo.Admin;
import com.chby.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/10/10.
 */
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired(required = false)
    private AdminMapper adminMapper;


    @Override
    public Admin getUserByUserName(String adminname) {
        return null;
    }

    @Override
    public Admin isLogin(String username, String password) {
        return adminMapper.isLogin(username, password);
    }

    @Override
    public Boolean addAdmin(Admin admin) {
        return adminMapper.addAdmin(admin);
    }

    @Override
    public Admin selectAdminByName(String username) {
        return adminMapper.selectAdminByName(username);
    }
}
