/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.utez.prueba.execution.login;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.utez.prueba.administration.user.BeanUser;
import java.util.Map;
import static java.util.jar.Pack200.Packer.ERROR;

/**
 *
 * @author Erick
 */
public class ActionLogin {

    private BeanUser user;
    private Map session;
    private String message;
    
    public String redirectAdministrator(){
        return SUCCESS;
    }

    public String login() {
        if (user != null) {
            user = new DaoLogin().login(user);
            if (!user.getMessage().equals("error")) {
                if (!user.getMessage().equals("inactivo")) {
                    session = ActionContext.getContext().getSession();
                    session.put("logeado", "true");
                    session.put("user", user);
                    switch(user.getRol().getDescription()){
                        case "Administrador":
                            return "Administrador";
                        default:
                            message = "El usuario no cuenta con un rol";
                            return message;
                    }
                }else{
                    message = "Usuario bloqueado";
                    return ERROR;
                }
            } else {
                message = "Usuario y/o contraseña incorrecta";
                user = new BeanUser();
                return ERROR;
            }
        }
        message = "Introduce tu usuario y contraseña";
        return ERROR;
    }
    
    public String closeLogin() {
        session = ActionContext.getContext().getSession();
        session.clear();
        return SUCCESS;
    }

    public BeanUser getUser() {
        return user;
    }

    public void setUser(BeanUser user) {
        this.user = user;
    }

    public Map getSession() {
        return session;
    }

    public void setSession(Map session) {
        this.session = session;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
