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
                                                <button class="btn btn-outline-info" ng-click="openModalInfoUser(user)">
                                                    <span data-feather="search"></span>
                                                </button>
                                                <button class="btn btn-outline-warning" ng-click="openModalUpdateUser(user)">
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

        <!-- Modal -->
        <div class="modal fade" id="infoUserModal" tabindex="-1" aria-labelledby="infoUserModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Información del usuario</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="col-12">
                                <div class="form-group">
                                    <label>Correo electrónico</label>
                                    <input type="email" class="form-control" ng-model="infoUser.username" disabled />
                                </div>
                            </div>
                            <div class="col-12">
                                <label>Nombre</label>
                                <input type="text" class="form-control" ng-model="infoUser.person.name" disabled />
                            </div>
                            <div class="col-12">
                                <label>Primer apellido</label>
                                <input type="text" class="form-control" ng-model="infoUser.person.surname" disabled />
                            </div>
                            <div class="col-12">
                                <label>Segundo apellido</label>
                                <input type="text" class="form-control" ng-model="infoUser.person.secondSurname" disabled />
                            </div>
                            <div class="col-12">
                                <label>Número de telefono</label>
                                <input type="tel" class="form-control" ng-model="infoUser.person.phone" disabled />
                            </div>
                            <div class="col-12">
                                <label>Rol</label>
                                <input type="text" class="form-control" ng-model="infoUser.rol.description" disabled />
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-outline-warning" data-dismiss="modal">Cerrar</button>

                    </div>
                </div>
            </div>
        </div>
        
          <div class="modal fade" id="updateUserModal" tabindex="-1" aria-labelledby="infoUserModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Información del usuario</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="col-12">
                                <div class="form-group">
                                    <label>Correo electrónico</label>
                                    <input type="email" class="form-control" ng-model="updateObjectUser.username"  />
                                </div>
                            </div>
                            <div class="col-12">
                                <label>Nombre</label>
                                <input type="text" class="form-control" ng-model="updateObjectUser.person.name"  />
                            </div>
                            <div class="col-12">
                                <label>Primer apellido</label>
                                <input type="text" class="form-control" ng-model="updateObjectUser.person.surname"  />
                            </div>
                            <div class="col-12">
                                <label>Segundo apellido</label>
                                <input type="text" class="form-control" ng-model="updateObjectUser.person.secondSurname"  />
                            </div>
                            <div class="col-12">
                                <label>Número de telefono</label>
                                <input type="tel" class="form-control" ng-model="updateObjectUser.person.phone"  />
                            </div>
                            <div class="col-12">
                                <label>Rol</label>
                                <input type="text" class="form-control" ng-model="updateObjectUser.rol.description"  />
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer ">
                        <button type="button" class="btn btn-outline-warning" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-outline-success" data-dismiss="modal">Guardar</button>

                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../layaout/footer.jsp"/>
    </body>
</html>
