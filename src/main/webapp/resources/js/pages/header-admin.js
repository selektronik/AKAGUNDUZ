
//create the module and name it
var myApp = angular.module('myApp');

//create the controller and inject Angular's $scope
myApp.controller('LocationController', function($scope, $location) {


    if($location.$$absUrl.lastIndexOf('/home') > 0){
        $scope.activeURL = 'home';
    }
	else if($location.$$absUrl.lastIndexOf('/users') > 0){
		$scope.activeURL = 'users';
	}


});




