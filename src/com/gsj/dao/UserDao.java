package com.gsj.dao;

import com.gsj.model.User;

import java.lang.String;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {

    /**
     * 用户登录
     * @param username 用户名
     * @param password 密码
     * @return 用户对象
     */
    public User login(String username, String password){

        return User.me.findFirst("select * from user where username = ? and password = ?", username, password);
    }
    /**
     * 修改用户个人信息
     */

    public void update(User user)
    {
        user.update();
    }

    /**
     * 判断用户名在数据库中是否存在
     * @param username 用户名
     * @return 布尔值
     */
    public boolean userIsExist(String username){

        // 获取数据库连接Connection对象
        Connection conn = ConnectDB.getConnection();
        // 根据指定用户名查询用户信息
        String sql = "select * from user where username = ?";
        try {
            // 获取PreparedStatement对象
            PreparedStatement ps = conn.prepareStatement(sql);
            // 对用户对象属性赋值
            ps.setString(1, username);
            // 执行查询获取结果集
            ResultSet rs = ps.executeQuery();
            // 判断结果集是否有效
            if(!rs.next()){
                // 如果无效则证明此用户名可用
                return true;
            }
            // 释放此 ResultSet 对象的数据库和 JDBC 资源
            rs.close();
            // 释放此 PreparedStatement 对象的数据库和 JDBC 资源
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            // 关闭数据库连接
            ConnectDB.closeConnection(conn);
        }
        return false;
    }
}

