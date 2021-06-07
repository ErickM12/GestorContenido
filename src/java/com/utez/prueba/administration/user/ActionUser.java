/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.utez.prueba.administration.user;

import static com.opensymphony.xwork2.Action.SUCCESS;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Erick
 */
public class ActionUser {
    private String message;
    private List<BeanUser> listUser;
    
    public String findAll(){
        listUser = new DaoUser().findAll();
        return SUCCESS; 
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public List<BeanUser> getListUser() {
        return listUser;
    }

    public void setListUser(List<BeanUser> listUser) {
        this.listUser = listUser;
    }
    
    
    
}
