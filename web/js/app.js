const app = angular.module('prueba', []);
app.controller('homeAdministrator', function ($scope, $http) {
    $http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";
    $scope.users = {};
    $scope.getUser = () => {
        $http({
            method: 'POST',
            url: 'Prueba/findAll'
        }).then((response) => {
            const {listUser} = response.data
            $scope.users = listUser;
            console.log($scope.users)
        }).catch((err) => {
            console.log(err);
        })
    };

    $scope.openModalInfoUser = (user) => {
        $scope.infoUser = angular.copy(user);
        $('#infoUserModal').modal('show');
    }
    $scope.openModalUpdateUser = (user) => {
        $scope.updateObjectUser = user;
        $('#updateUserModal').modal('show');
    }


});