package com.chby.service.impl;

import com.chby.mapper.TeacherMapper;
import com.chby.pojo.Teacher;
import com.chby.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TeacherServiceImpl implements TeacherService {
    @Autowired(required = false)
    private TeacherMapper teacherDao;

    @Override
    public List<Teacher> selectAll() {
        return teacherDao.selectAll();
    }

    @Override
    public List<Teacher> findAll(String teacherId) {
        return teacherDao.findAll(teacherId);
    }

    @Override
    public Teacher isLogin(String teacherUserName, String teacherPassword) {
        return teacherDao.isLogin(teacherUserName,teacherPassword);
    }

    @Override
    public Boolean addTeacher(Teacher teacher) {
        return teacherDao.addTeacher(teacher);
    }

    @Override
    public Teacher selectTeacherByName(String teacherUserName) {
        return teacherDao.selectTeacherByName(teacherUserName);
    }

    @Override
    public Teacher selectTeacherById(String teacherId) {
        return teacherDao.selectTeacherById(teacherId);
    }

    @Override
    public int updateTeacher(Teacher teacher) {
        return teacherDao.updateTeacher(teacher);
    }

    @Override
    public Boolean delTeacher(String teacher) {
        return teacherDao.delTeacher(teacher);
    }
}
