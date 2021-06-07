<%-- 
    Document   : mainUp
    Created on : 31/05/2021, 09:17:21 AM
    Author     : Erick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% String context = request.getContextPath();%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="<%=context%>/redirectAdministrator"><img class="rounded float-left" width="50" height="50" src="<%=context%>/assets/img/logo.png" /></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="<%=context%>/redirectAdministrator">Inicio <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Gestión de servicios</a></li>
            <li class="nav-item">
                <a class="nav-link" href="#">Gestión de contenido</a></li>
        </ul>
        <ul class="navbar-nav" >
            <li class="nav-item">
                <img style="margin-right:10px" src="<%=context%>/assets/img/user.png" height="50" width="50" />
            </li>
            <li class="align-self-center">
                <span class="align-middle"><s:property value="#session.user.username"/></span>
            </li>
            <li style="margin-left: 10px" class="align-self-center">
                <form action="<%=context%>/closeLogin" method="POST">
                    <button class="btn btn-outline-primary border-0" type="submit"> <i 
                            data-feather="log-out"></i></button>
                </form>

            </li>
        </ul>
    </div>
</nav>