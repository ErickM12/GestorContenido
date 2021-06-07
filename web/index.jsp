<%-- 
    Document   : index
    Created on : 25/05/2021, 08:44:42 AM
    Author     : Erick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% String context = request.getContextPath();%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="./screen/layaout/head.jsp"/>
    </head>
    <body>
        <div class="container-fluid">
            <div class="m-0 vh-100 row justify-content-center align-items-center">
                <div class="card text-center">
                    <div class="card-header bg-danger text-light ">
                        Inicio de sesión
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">
                            <img width="200" height="200" class="img-fluid" src="<%=context%>/assets/img/logo.png" />
                        </h5>
                        <div class="container-fluid">
                            <form action="<%=context%>/login" method="POST">
                                <div class="row justify-content-start text-left">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label class="text-primary">Correo electrónico:</label>
                                            <input type="email" placeholder="utez@utez.edu.mx" name="user.username" id="username" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label class="text-primary">Contraseña:</label>
                                            <input type="password" placeholder="utez@utez.edu.mx" name="user.password" id="password" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 text-center">
                                        <button type="submit" class="btn btn-primary" style="width: 75%; margin-top: 10px">Iniciar sesión</button>
                                    </div>
                                </div>
                                <div class="row" style="margin-top: 15px">
                                    <div class="col-12">
                                        <s:if test="message!=null && message != ''">
                                            <div class="alert alert-warning" role="alert" align="center" style="color:black !important"><s:property value="message"/></div>
                                        </s:if>
                                    </div>
                                </div>

                            </form>

                        </div>
                    </div>
                    <div class="card-footer text-light bg-danger " >
                        ¡Bienvenido!
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
