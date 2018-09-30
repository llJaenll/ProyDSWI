angular.module('SubastasApp', ['ngRoute'])
  .controller('IndexController', function($scope) {
    $scope.mosSub=false;
    $scope.ocultar = function() {
        if($scope.mosSub) $scope.mosSub=false;
        else  $scope.mosSub=true;
        
    };
 
  }) 
  .controller('PrincipalController', function($scope) {

 
  })
.config(['$routeProvider', function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: '/../view/Principal.html',
        controller: 'PrincipalController'
      });
  }]);