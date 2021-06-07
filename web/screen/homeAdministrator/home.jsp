<%-- 
    Document   : home
    Created on : 31/05/2021, 08:53:46 AM
    Author     : Erick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<% String context = request.getContextPath();%>
<!DOCTYPE html>
<html ng-app="prueba">
    <head>
        <jsp:include page="../layaout/head.jsp"/>
    </head>
    <body ng-controller="homeAdministrator">
        <jsp:include page="../layaout/mainUp.jsp"/>
        <div class="container-fluid">
            <div class="row" ng-init="getUser();">
                <div class="col-12">
                    <div class="card" style="margin: 10px">
                        <div class="card-header">
                            <span class="fa fa-user text-primary"></span>&nbsp; Gestión de usuarios
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-8">
                                     <h2>Gestión de usuarios</h2>
                                </div>
                                <div class="col-4 text-right">
                                    <button ng-click="modalCreateUser()" title="Nuevo usuario" class="btn btn-outline-success rounded-circle border-0">
                                        <span data-feather="plus"></span>
                                    </button>
                                </div>
                               
                            </div>

                            <hr class="border border-danger" />
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th rowspan="2" class="text-center align-self-center" scope="col">#</th>
                                            <th scope="col">Correo electrónico</th>
                                            <th scope="col">Nombre completo</th>
                                            <th scope="col">Teléfono</th>
                                            <th scope="col">Cargo</th>
                                            <th rowspan="2" class="text-center align-self-center" scope="col">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-repeat="user in users">
                                            <td ng-bind="$index + 1"></td>
                                            <td ng-bind="user.username"></td>
                                            <td ng-bind="user.person.name + ' ' + user.person.surname + ' ' + user.person.secondSurname"></td>
                                            <td ng-bind="user.person.phone"></td>
                                            <td ng-bind="user.rol.description"></td>
                                            <td class="text-center ">
                                                <button class="btn btn-outline-info">
                                                    <span data-feather="search"></span>
                                                </button>
                                                <button class="btn btn-outline-warning">
                                                    <span data-feather="edit"></span>
                                                </button>
                                                <button class="btn btn-outline-danger">
                                                    <span data-feather="trash"></span>
                                                </button>
                                            </td>
                                        </tr>
                                    </tbody>
                                    <tfoot>
                                        <tr ng-if="cursos.length > 0">
                                            <td class="text-center" st-pagination="" st-items-by-page="10"
                                                colspan="5"></td>
                                        </tr>
                                        <tr ng-if="cursos.length === 0">
                                            <td colspan="5" class="alert alert-warning text-center"><strong>No se
                                                    encuentran usuarios registrados</strong></td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>

        <jsp:include page="../layaout/footer.jsp"/>
    </body>
</html>
