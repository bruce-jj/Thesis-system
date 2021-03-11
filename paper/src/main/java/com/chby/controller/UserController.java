package com.chby.controller;
import com.chby.pojo.Admin;
import com.chby.pojo.Teacher;
import com.chby.pojo.User;
import com.chby.pojo.SendMail;
import com.chby.service.AdminService;
import com.chby.service.TeacherService;
import com.chby.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired(required = false)
    private UserService userService;
    @Autowired(required = false)
    private AdminService adminService;
    @Autowired(required = false)
    private TeacherService teacherService;
    String nullInfor = "输入字段不能为空！";
    String registerSuc = "注册成功，试着登录吧！";
    String registerFai = "对不起，当前账户已被注册！";
    String loginFail = "用户名或密码不正确，或邮箱格式不正确！";

    @RequestMapping(value = "/add", method=RequestMethod.POST)
    //注册功能
    public String addUser(Model model,HttpServletRequest request,@RequestParam("reg_email") String email, @RequestParam(value = "reg_title") String title, @RequestParam(value = "reg_id") String id, @RequestParam(value = "reg_username") String username, @RequestParam(value = "reg_password") String password) throws UnsupportedEncodingException {
        if (username.trim().equals("") || password.trim().equals("")) {
            model.addAttribute("message", nullInfor);
            return "login";
        }
        String level = request.getParameter("reg_level");
        // 如果检测到注册用户
        if (level.equals("user")) {
            // 首先做一次 query 查看注册的用户名是否存在于数据库中userService.selectUserByName(username)
            User user = userService.selectUserByName(username);
            User user1 = userService.selectIserByEmail(email);
            if(user1!=null){
                model.addAttribute("login_infor", "糟糕，当前邮箱已被注册了！");
                return "login";
            }

            if (user != null|| !email.matches("[\\w!#$%&'*+/=?^_`{|}~-]+(?:\\.[\\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\\w](?:[\\w-]*[\\w])?\\.)+[\\w](?:[\\w-]*[\\w])?")) {
                model.addAttribute("login_infor", registerFai);
                return "login";
            }else{
                user = new User(username, password,email);
                userService.addUser(user);
                model.addAttribute("login_infor", registerSuc);
                return "login";
            }
        }

        // 如果检测到注册管理员
        if (level.equals("admin")) {
            Admin admin = adminService.selectAdminByName(username);
            if (admin != null) {
                model.addAttribute("login_infor", registerFai);
                return "login";
            } else {
                admin = new Admin(username, password);
                adminService.addAdmin(admin);
                model.addAttribute("login_infor", registerSuc);
                return "login";
            }
        }
        // 如果检测是注册教师
        if (level.equals("teacher")) {
            Teacher teacher = teacherService.selectTeacherByName(username);

            if (teacher != null) {
                model.addAttribute("login_infor", registerFai);
                return "login";
            } else {
                teacher = new Teacher(id, title, username, password);
                teacherService.addTeacher(teacher);
                model.addAttribute("login_infor", registerSuc);
                return "login";
            }
        }
        return "redirect:/";
    }

    //登录功能
    @RequestMapping(value = "/login")
    public String Login(String username, String password, @RequestParam("level") String level, HttpSession session, HttpServletRequest request, Model model) {
        if (username.trim().equals("") || password.trim().equals("")) {
            model.addAttribute("message", nullInfor);
            return "login";
        }
        try {
            //根据不同的radio 调用不同的service 再跳转不同的页面
            if (level.equals("user")) {
                User user = userService.isLogin(username, password);
                // 如果登录的用户用户名或密码错误
                if (user == null) {
                    model.addAttribute("login_infor", loginFail);
                    return "login";
                } else {
                    session.setAttribute("user", user);
                    model.addAttribute("name", user.getUsername());
                    model.addAttribute("level", "user");
                    return "index";
                }
            }

            if (level.equals("admin")) {
                Admin admin = adminService.isLogin(username, password);
                // 如果登录的管理员用户名或密码错误
                if (admin == null) {
                    model.addAttribute("login_infor", loginFail);
                    return "login";
                } else {
                    List<Teacher> list = teacherService.selectAll();
                    model.addAttribute("teacherList", list);
                    model.addAttribute("level", "admin");
                    session.setAttribute("admin", admin);
                    return "allPaperAdmin";
                }
            }

            if (level.equals("teacher")) {
                Teacher teacher = teacherService.isLogin(username, password);
                // 如果登录的教师用户名或密码错误
                if (teacher == null) {
                    model.addAttribute("login_infor", loginFail);
                    return "login";
                } else {
                    List<Teacher> list = teacherService.findAll(teacher.getTeacherId());
                    model.addAttribute("teacherList", list);
                    model.addAttribute("level", "teacher");
                    session.setAttribute("teacher", teacher);
                    return "allPaperTeacher";
                }
            }
        } catch (NullPointerException e) {
            model.addAttribute("message", loginFail);
            return "login";
        }
        return "login";
    }

    @RequestMapping("/logout")
    public String logOutUser(HttpServletRequest request, @RequestParam("level") String level) {
        if (level.equals("user"))
            request.getSession().removeAttribute("user");
        if (level.equals("teacher"))
            request.getSession().removeAttribute("teacher");
        if (level.equals("admin"))
            request.getSession().removeAttribute("admin");
        return "login";
    }

    @RequestMapping("/tofind")
    public String toFindPage() throws IOException {
        return "findMyPassword";
    }

    @RequestMapping("/find")
    public void findYourPwdBack(Model model, HttpServletRequest request,@RequestParam("find_email") String email, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        ((HttpServletResponse)response).setHeader("Content-Type", "text/html;charset=UTF-8");
        String flagEmail = userService.verifyByEmail(email);
        SendMail sendMail = new SendMail();
        PrintWriter out = response.getWriter();
        if (flagEmail==null||flagEmail.equals(""))
        {
            out.println("<script>alert('对不起，当前用户名与邮箱不匹配！');</script>");
            out.println("<script>window.location.href='login.jsp';</script>");
        }
        request.getSession().setAttribute("auth", "user");
        out.println("<script>alert('我们已将安全链接发送至您的邮箱，请注意查收！');</script>");
        sendMail.sendMail(flagEmail, "恭喜您，账户安全验证成功！请使用同一浏览器点开网址进行密码的更改：http://25y52v3224.zicp.vip/user/toUpdate");
        out.println("<script>window.location.href='login.jsp';</script>");
    }
    @RequestMapping("/toUpdate")
    public String toUpdatePage(){
        return "updatePwd";
    }

    @RequestMapping("/update")
    public void updatePwd(HttpServletRequest request,HttpServletResponse response,@RequestParam("updatePwd1") String pwd1, @RequestParam("updatePwd2") String pwd2,String username,Model model) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        ((HttpServletResponse)response).setHeader("Content-Type", "text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        if(!pwd1.equals(pwd2))
            out.println("<script>alert('密码不一致');location.reload(true);</script>");
        else{
            User user = new User(username,pwd1);
            if(!userService.updateUser(user)) {
                out.println("<script>alert('密码不一致！');location.reload(true);</script>");
            }else {
                out.println("<script>alert('更改成功，正在重定向至登录页面！');window.location.href='/';</script>");
            }
        }
    }
}
