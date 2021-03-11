package com.chby.pojo;

import java.util.List;

public class Teacher {
    private String teacherId;
    private String teacherName;
    private String teacherTitle;
    private String teacherUserName;
    private String teacherPassword;
    private List<Paper> papers;

    public Teacher() {
    }

    public Teacher(String teacherUserName, String teacherPassword) {
        this.teacherUserName = teacherUserName;
        this.teacherPassword = teacherPassword;
    }

    public Teacher(String teacherId, String teacherName, String teacherTitle, String teacherUserName, String teacherPassword, List<Paper> papers) {
        this.teacherId = teacherId;
        this.teacherName = teacherName;
        this.teacherTitle = teacherTitle;
        this.teacherUserName = teacherUserName;
        this.teacherPassword = teacherPassword;
        this.papers = papers;
    }

    public Teacher(String teacherId, String teacherName, String teacherTitle, String teacherUserName, String teacherPassword) {
        this.teacherId = teacherId;
        this.teacherName = teacherName;
        this.teacherTitle = teacherTitle;
        this.teacherUserName = teacherUserName;
        this.teacherPassword = teacherPassword;
    }

    public Teacher(String teacherId, String teacherTitle, String teacherUserName, String teacherPassword) {
        this.teacherId = teacherId;
        this.teacherTitle = teacherTitle;
        this.teacherUserName = teacherUserName;
        this.teacherPassword = teacherPassword;
    }

    public List<Paper> getPapers() {
        return papers;
    }

    public void setPapers(List<Paper> papers) {
        this.papers = papers;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getTeacherTitle() {
        return teacherTitle;
    }

    public void setTeacherTitle(String teacherTitle) {
        this.teacherTitle = teacherTitle;
    }


    public String getTeacherPassword() {
        return teacherPassword;
    }

    public void setTeacherPassword(String teacherPassword) {
        this.teacherPassword = teacherPassword;
    }

    public String getTeacherUserName() {
        return teacherUserName;
    }

    public void setTeacherUserName(String teacherUserName) {
        this.teacherUserName = teacherUserName;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "teacherId='" + teacherId + '\'' +
                ", teacherName='" + teacherName + '\'' +
                ", teacherTitle='" + teacherTitle + '\'' +
                ", teacherUserName='" + teacherUserName + '\'' +
                ", teacherPassword='" + teacherPassword + '\'' +
                ", papers=" + papers +
                '}';
    }
}

