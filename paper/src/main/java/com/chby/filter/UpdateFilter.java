package com.chby.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class UpdateFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session=((HttpServletRequest)servletRequest).getSession();
        Object user = session.getAttribute("auth");
        if(user==null){
            response.getWriter().write("<script>alert('您需要登录！');window.history.back();</script>");
        }else{
            filterChain.doFilter(servletRequest,servletResponse);
        }
    }


    @Override
    public void destroy() {

    }
}
