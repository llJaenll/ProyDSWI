angular.module('SubastasApp', ['ngRoute'])

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
     $scope.imagenes=[
        {
            url:"../img/banne1.jpg"
        },
        {
            url:"../img/banner2.jpg"
        },
        {
           url:"../img/banner3.jpg"
        }
    ];
    $scope.$watch('$viewContentLoaded', function(){
        console.log("ddd");
    });
    $scope.puntos=[
        {
            estado:true
        },
        {
            estado:false
        },
        {
            estado:false
        },
        {
            estado:false
        },
    ];
 
  })
.config(['$routeProvider', function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: '../view/Index.html',
        controller: 'PrincipalController'
      });
  }]);