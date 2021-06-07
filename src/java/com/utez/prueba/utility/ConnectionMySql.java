/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.utez.prueba.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

/**
 *
 * @author Erick
 */
public class ConnectionMySql {

    private static String ip;
    private static String dbName;
    private static String user;
    private static String password;
    private static String service;
    private static ResourceBundle propertiesBD;

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        if (propertiesBD == null) {
            propertiesBD = ResourceBundle.getBundle("propertiesConnection");
            ip = propertiesBD.getString("ip");
            dbName = propertiesBD.getString("db_name");
            user = propertiesBD.getString("user");
            password = propertiesBD.getString("password");
            service = propertiesBD.getString("service");
        }
        return DriverManager.getConnection("jdbc:mysql://"+ip+":"+service+"/"+dbName,user,password);
    }
    
    public static void main(String[] args) {
        try{
            Connection con = getConnection();
            System.out.println("conexion efectuada");
            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
}
