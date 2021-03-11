package com.chby.filter;

import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;



@WebFilter(filterName="myFilter",urlPatterns={"/paper/*","/teacher/*"})
public class UserFilter implements Filter {

    public void destroy(){
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest)req;

        HttpServletResponse response = (HttpServletResponse)resp;
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session=((HttpServletRequest)req).getSession();
        Object user = session.getAttribute("user");
        Object admin = session.getAttribute("admin");
        Object teacher = session.getAttribute("teacher");
        if(user==null&&teacher==null&&admin==null){
            response.getWriter().write("<script>alert('您需要登录！');window.history.back();</script>");
        }else{
            chain.doFilter(req, resp);
        }
    }
    public void init(FilterConfig config){

    }

}
