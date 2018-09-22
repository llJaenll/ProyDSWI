angular.module('SubastasApp', [])
  .controller('IndexController', function($scope) {
    $scope.mosSub=false;
    $scope.ocultar = function() {
        if($scope.mosSub) $scope.mosSub=false;
        else  $scope.mosSub=true;
        
    };
 
  });