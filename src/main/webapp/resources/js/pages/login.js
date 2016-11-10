var akagunduzApp = angular.module('akagunduzApp', []);

akagunduzApp.controller('loginController', function($scope, $location){
	 var url = "" + $location.$$absUrl;
	    $scope.displayLoginError = (url.indexOf("error") >= 0);
});