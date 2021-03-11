package com.chby.mapper;

import com.chby.pojo.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * Created by Administrator on 2017/10/10.
 */


@Mapper
public interface AdminMapper {

    Admin isLogin(@Param("adminName") String adminName, @Param("adminPassword") String adminPassword);

    Boolean addAdmin(@Param("admin") Admin admin);

    @Select("select a_username as adminName, a_password as adminPassword from admin where a_username = #{adminName}")

    Admin selectAdminByName(@Param("adminName") String adminName);
}
