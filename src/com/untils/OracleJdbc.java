package com.untils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OracleJdbc {
    public static Connection conn = null;// 创建一个数据库连接
    public static PreparedStatement ps = null;// 创建预编译语句对象
    public static ResultSet infoResult = null;// 创建一个用户信息结果集对象
    public static ResultSet quesResult = null;// 创建一个题目结果集对象
    public static ResultSet recResult = null;// 创建一个用户答题记录结果集对象

    public static Connection getConn() throws SQLException,ClassNotFoundException {
        Class.forName("oracle.jdbc.driver.OracleDriver");// 加载Oracle驱动程序,不用DriverManager
        String url = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";// Oracle地址
        String user = "users";// 数据库用户名
        String password = "users";// 数据库密码
        conn = DriverManager.getConnection(url, user, password);// 获取连接
        return conn;
    }

    //查询用户信息
    public static int insert(String sql,Object...obs) {
        int row = 0;
        try {
            conn=getConn();
            ps=conn.prepareStatement(sql);
            for (int i = 0; i < obs.length; i++) {
                System.out.println("插入成功"+row);
                ps.setObject(i+1, obs[i]);

            }
            row=ps.executeUpdate(); //获得插入行数


        } catch (Exception e) {
            e.printStackTrace();
        }
        return row;
    }
    //更新信息
    public static int update(String sql,Object...obs) {
        int row = 0;
        try {
            conn=getConn();
            ps=conn.prepareStatement(sql);
            for (int i = 0; i < obs.length; i++) {
                System.out.println("更新成功"+row);
                ps.setObject(i+1, obs[i]);
                System.out.println(ps);
            }
            row=ps.executeUpdate(); //获得插入行数


        } catch (Exception e) {
            e.printStackTrace();
        }
        return row;
    }
    //删除信息
    public static int delete(String sql,Object...obs) {
        int row = 0;
        try {
            conn=getConn();
            ps=conn.prepareStatement(sql);
            for (int i = 0; i < obs.length; i++) {
                System.out.println("删除成功"+row);
                ps.setObject(i+1, obs[i]);

            }
            row=ps.executeUpdate(); //获得插入行数


        } catch (Exception e) {
            e.printStackTrace();
        }
        return row;
    }

    //查询
    public static ResultSet query(String sql,Object...obs) {
        try {
            conn=getConn();
            ps=conn.prepareStatement(sql);
            for (int i = 0; i < obs.length; i++) {
                ps.setObject(i+1, obs[i]);
            }
            quesResult=ps.executeQuery(); //获得结果集

        } catch (Exception e) {
            e.printStackTrace();
        }
        return quesResult;
    }

    public static void closeObject(){
        // 从小到大释放. resultSet < Statement < Connection
        // 释放时调用close方法即可. 如果其中一个对象的关闭 出现了异常. 也要保证其他的对象关闭方法被调用.
        try {
            if (infoResult != null) {
                infoResult.close();
            }
            if (quesResult != null) {
                quesResult.close();
            }
            if (recResult != null) {
                recResult.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}