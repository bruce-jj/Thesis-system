package com.chby.service;

import com.chby.pojo.Paper;
import com.chby.pojo.Teacher;
import com.chby.pojo.User;

import java.util.List;

public interface TeacherService {

    List<Teacher> selectAll();
    List<Teacher> findAll(String teacherId);
    Teacher isLogin(String teacherUserName, String teacherPassword);
    Boolean addTeacher(Teacher teacher);
    Teacher selectTeacherByName(String teacherUserName);
    Teacher selectTeacherById(String teacherId);
    int updateTeacher(Teacher teacher);
    Boolean delTeacher(String teacher);
}
