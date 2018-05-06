package com.gsj.servlet;

import com.gsj.base.BaseServlet;
import com.gsj.dao.UserDao;
import com.gsj.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LogServlet extends BaseServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //获取用户名
        String username = request.getParameter("username");
        //获取密码
        String password = request.getParameter("password");
        //实例化UserDao对象
        UserDao userDao = new UserDao();
        //根据用户名和密码查询用户
        User user = userDao.login(username,password);
        //判断user是否为空


        //判断用户类型





        if(user != null)
        {
            //将用户对象放入session中
            request.getSession().setAttribute("user", user);
            request.getSession().setAttribute("test", user._getAttrsEntrySet());
        // 转发到result.jsp页面
        request.getRequestDispatcher("/Page/Teacher/TeacherHomepage.jsp").forward(request, response);
    }else{
        // 登录失败
        request.setAttribute("info", "错误：用户名或密码错误！");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    }
}
