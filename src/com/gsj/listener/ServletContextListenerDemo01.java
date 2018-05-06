package com.gsj.listener;

import com.gsj.model.User;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.druid.DruidPlugin;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ServletContextListenerDemo01 implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        //使用db资源文件
        PropKit.use("db.properties");
        //初始化数据库连接池
        DruidPlugin druidPlugin = new DruidPlugin(PropKit.get("jdbc"), PropKit.get("user"),PropKit.get("password"),PropKit.get("driver"));
        ActiveRecordPlugin activeRecordPlugin = new ActiveRecordPlugin(druidPlugin);
        activeRecordPlugin.setDevMode(true);
        activeRecordPlugin.setShowSql(true);
        activeRecordPlugin.addMapping("user", "userid", User.class);
        druidPlugin.start();
        activeRecordPlugin.start();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}
