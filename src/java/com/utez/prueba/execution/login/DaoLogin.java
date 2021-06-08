/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.utez.prueba.execution.login;

import com.utez.prueba.administration.person.BeanPerson;
import com.utez.prueba.administration.rol.BeanRol;
import com.utez.prueba.administration.user.BeanUser;
import com.utez.prueba.utility.ConnectionMySql;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Erick
 */
public class DaoLogin {

    Connection con;
    PreparedStatement pstm;
    CallableStatement call;
    ResultSet rs;

    public BeanUser login(BeanUser user) {
        BeanUser userLogged = new BeanUser();
        try {
            con = ConnectionMySql.getConnection();
            String query = "CALL login(?,?)";
            call = con.prepareCall(query);
            call.setString(1, user.getUsername());
            call.setString(2, user.getPassword());
            rs = call.executeQuery();
            if (rs.next()) {
                if (rs.getString("message").equals("logeado")) {
                    userLogged.setId(rs.getInt("id_user"));
                    userLogged.setUsername(rs.getString("username"));
                    userLogged.setCreateAt(rs.getString("createDate"));
                    BeanRol rol = new BeanRol();
                    rol.setId(rs.getInt("id_rol"));
                    rol.setDescription(rs.getString("rol"));
                    userLogged.setRol(rol);
                    BeanPerson person = new BeanPerson();
                    person.setId(rs.getInt("id_person"));
                    person.setName(rs.getString("name"));
                    person.setSurname(rs.getString("surname"));
                    person.setSecondSurname(rs.getString("second_surname"));
                    person.setPhone(rs.getString("phone"));
                    userLogged.setPerson(person);
                    userLogged.setMessage(rs.getString("message"));

                } else {
                    userLogged.setMessage(rs.getString("message"));
                }
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection();
        }
        return userLogged;
    }

    public void closeConnection() {
        try {
            if (con != null) {
                con.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (call != null) {
                call.close();
            }
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
