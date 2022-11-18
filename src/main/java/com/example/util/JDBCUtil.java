package com.example.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCUtil {
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://walab.handong.edu:3306/p3_22100595", "p3_22100595", "eeXaiv3Eku");
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }
}
