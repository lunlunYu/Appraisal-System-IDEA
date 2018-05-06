package com.gsj.servlet;

import com.gsj.base.BaseServlet;
import com.gsj.dao.UserDao;
import com.gsj.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UpdateServlet extends BaseServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        User user1 = (User) request.getSession().getAttribute("user");
        //
        String name = request.getParameter("name");
        //获取性别
        String sex = request.getParameter("sex");
        //获取工号
        String numberStr = request.getParameter("number");
        int number = Integer.parseInt(numberStr);
        //获取职称
        String position = request.getParameter("position");
        //获取电话号码
        String tel = request.getParameter("tel");
        //获取Email
        String email = request.getParameter("email");
        //获取教学类型
        String type = request.getParameter("type");
        UserDao userDao = new UserDao();
        user1.set("name",name);
        user1.set("sex",sex);
        user1.set("number",number);
        user1.set("position",position);
        user1.set("tel",tel);
        user1.set("email",email);
        user1.set("type",type);
        userDao.update(user1);
        request.setAttribute("info","Congratulations! registered successfully </br>");
        request.getRequestDispatcher("/Page/Teacher/TeacherHomepage.jsp").forward(request,response);
    }
}
