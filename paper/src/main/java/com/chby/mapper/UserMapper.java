package com.chby.mapper;

import com.chby.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapper {
    //是否登录
    User isLogin(@Param("username") String username, @Param("password") String password);

    Boolean addUser(User user);

    Boolean update(User user);

    User selectUserByName(@Param("username") String username);

    User selectIserByEmail(@Param("email") String email);

    @Select("select email from user where email = #{email}")
    String verifyByEmail(@Param("email") String email);
}
