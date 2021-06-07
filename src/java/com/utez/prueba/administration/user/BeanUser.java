/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.utez.prueba.administration.user;

import com.utez.prueba.administration.person.BeanPerson;
import com.utez.prueba.administration.rol.BeanRol;

/**
 *
 * @author Erick
 */
public class BeanUser{
    private int id;
    private String username;
    private String password;
    private String createAt;
    private String state;
    private BeanPerson person;
    private BeanRol rol;
    private String message;

    public BeanUser() {
    }

    public BeanUser(int id, String username, String password, String createAt, String state, BeanRol rol, String message) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.createAt = createAt;
        this.state = state;
        this.rol = rol;
        this.message = message;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public BeanRol getRol() {
        return rol;
    }

    public void setRol(BeanRol rol) {
        this.rol = rol;
    }

    public BeanPerson getPerson() {
        return person;
    }

    public void setPerson(BeanPerson person) {
        this.person = person;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
    
    
}
