package com.chby.controller;

import com.chby.pojo.Admin;
import com.chby.pojo.Paper;
import com.chby.pojo.Teacher;
import com.chby.pojo.User;
import com.chby.service.PaperService;
import com.chby.service.TeacherService;
import com.chby.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/teacher")
public class TeacherController {
    @Autowired(required = false)
    private TeacherService teacherService;

    @Autowired(required = false)
    private PaperService paperService;

    @RequestMapping("/all")
    public String showAllPapers(Model model,String level,String t_id,HttpServletRequest request){
        List<Teacher> list = teacherService.findAll(t_id);
        model.addAttribute("teacher_list", list);
        model.addAttribute("level", level);
        return "teacherPapers";
    }

    @RequestMapping("toUpdateTeacher")
    public String toUpdatePaper(Model model, String id,HttpServletRequest request) {
        Teacher teacher = teacherService.selectTeacherById(id);
        model.addAttribute("teacher",teacher);
        model.addAttribute("id",id);
        return "updateTeacher";
    }

    @RequestMapping("/update")
    public String updateTeacherInfor(Model model,Teacher teacher,HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        ((HttpServletResponse)response).setHeader("Content-Type", "text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int flag = teacherService.updateTeacher(teacher);
        if(flag == 0){
            return "updateTeacher";
        }
        List<Teacher> list = teacherService.findAll(teacher.getTeacherId());
        model.addAttribute("teacher", teacher);
        model.addAttribute("teacherList", list);
        return "allPaperTeacher";
    }

    @RequestMapping("/addPaper")
    public void addPaper(Paper paper, HttpServletResponse response, Model model) throws IOException {
        paperService.addPaper(paper);
        response.getWriter().write("<script>window.history.go(-2);</script>");
    }

    @RequestMapping("/delTeacher")
    public String deleteTeacherById(String teacherId, Model model){
        Boolean flag = teacherService.delTeacher(teacherId);
        List<Teacher> list = teacherService.selectAll();
        model.addAttribute("teacherList", list);
        model.addAttribute("level","admin");
        return "allPaperAdmin";
    }

}


