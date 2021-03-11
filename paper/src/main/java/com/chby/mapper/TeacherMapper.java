package com.chby.mapper;

import com.chby.pojo.Teacher;
import com.chby.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;


@Mapper
public interface TeacherMapper {
    List<Teacher> selectAll();

    List<Teacher> findAll(String teacherId);

    Teacher isLogin(@Param("teacherUserName") String teacherUserName, @Param("teacherPassword") String teacherPassword);

    Boolean addTeacher(Teacher teacher);

    Boolean delTeacher(@Param("teacherId") String teacherId);

    Teacher selectTeacherByName(String teacherUserName);

    Teacher selectTeacherById(@Param("teacherId") String teacherId);

    int updateTeacher(Teacher teacher);
}
