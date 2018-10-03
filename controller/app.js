angular.module('SubastasApp', ['ngRoute'])
.controller('IndexController', function($scope) {
    $scope.mosSub=false;
    $scope.ocultar = function() {
        if($scope.mosSub) $scope.mosSub=false;
        else  $scope.mosSub=true;
        };
})

.controller('PrincipalController', function($scope) {
    $scope.productos =[
        {
            producto:'casaca',
            lugar: 'Villa Maria del Triunfo',
            precio: 50,
            tiempo:'2:03:40',
            imagen:'../img/producto1.jpg'
        },{
            producto:'Carro',
            lugar: 'Villa el Salvador',
            precio: 5000,
            tiempo:'2:03:40',
            imagen:'../img/producto1.jpg'
        },{
            producto:'sombrilla',
            lugar: 'La Molina',
            precio: 20,
            tiempo:'2:03:40',
            imagen:'../img/producto1.jpg'
        },{
            producto:'Carpa',
            lugar: 'San Juan de MIraflores',
            precio: 300,
            tiempo:'2:03:40',
            imagen:'../img/producto1.jpg'
        },{
            producto:'Pantalón',
            lugar: 'Chorillos',
            precio: 50,
            tiempo:'2:03:40',
            imagen:'../img/producto1.jpg'
        }                
        
    ];
 
  })
.config(['$routeProvider', function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: '/../view/Principal.html',
        controller: 'PrincipalController'
      });
  }]);