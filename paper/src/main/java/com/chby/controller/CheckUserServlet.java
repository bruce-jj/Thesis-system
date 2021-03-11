package com.chby.controller;


import com.chby.pojo.User;
import com.chby.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * Servlet implementation class CheckUserServlet
 */
@Controller
public class CheckUserServlet {

	@Autowired(required = false)
	private UserService userService;

	@RequestMapping("/CheckUserServlet")
	public void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setHeader("Content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		User user = userService.selectUserByName(name);
		if(user!=null){
			response.getWriter().print("该用户已经被注册了!");
		}else{
			response.getWriter().print("未被注册，可以继续!");
		}
	}

}
