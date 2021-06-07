/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.utez.prueba.administration.user;

import com.utez.prueba.administration.person.BeanPerson;
import com.utez.prueba.administration.rol.BeanRol;
import com.utez.prueba.utility.ConnectionMySql;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Erick
 */
public class DaoUser {

    Connection con;
    ResultSet rs;
    PreparedStatement pstm;

    public List<BeanUser> findAll() {
        List<BeanUser> listUser = new ArrayList<>();
        try {
            con = ConnectionMySql.getConnection();
            String query = "SELECT user.id as idUser, user.person_id as idPerson, user.username, user.createDate, rol.description as rol,\n"
                    + "person.name, person.surname, ifnull(person.secondSurname,'') as secondSurname, person.phone FROM rol\n"
                    + "INNER JOIN user ON user.rol_id = rol.id AND rol.description = 'Administrador'\n"
                    + "INNER JOIN person ON person.id = user.person_id;";
            pstm = con.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()) {
                BeanUser user = new BeanUser();
                user.setId(rs.getInt("idUser"));
                user.setUsername(rs.getString("username"));
                user.setCreateAt(rs.getString("createDate"));
                BeanRol rol = new BeanRol();
                rol.setDescription(rs.getString("rol"));
                user.setRol(rol);
                BeanPerson person = new BeanPerson();
                person.setId(rs.getInt("idPerson"));
                person.setName(rs.getString("name"));
                person.setSurname(rs.getString("surname"));
                person.setSecondSurname(rs.getString("secondSurname"));
                person.setPhone(rs.getString("phone"));
                user.setPerson(person);
                listUser.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            closeConnection();
        }
        return listUser;
    }
    
    public void closeConnection(){
        try{
            if (con != null) {
                con.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (rs != null) {
                rs.close();
            }
            
        }catch(SQLException e){
            e.printStackTrace();
        }
    }

}
