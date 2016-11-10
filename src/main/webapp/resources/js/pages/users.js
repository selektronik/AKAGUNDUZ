
var akagunduzApp = angular.module('akagunduzApp', []);

akagunduzApp.controller('usersController', function($scope,$http, $location) {

	$scope.currencyVal;

	$scope.displayValidationError = false;

    $scope.url = "/akagunduz/protected/users/";
    
    
    $scope.user = {}


    $scope.getUserList = function () {
        var url = $scope.url;
        $scope.lastAction = 'list';


        $http.get(url)
            .success(function (data) {
                $scope.users = data;
            })
            .error(function () {
            	alert("error in getUserList");
            });
    }

    $scope.getUserList();
    

    $scope.deleteUser = function () {
    	
    	var url = $scope.url+"deleteUser/"+ $scope.selectedUserId;
    	  $http.post(url)
          .success(function (data) {
        	  $scope.resetUser();
              $scope.getUserList();
          })
          .error(function () {
              alert("error in deleteUser");
          });
    	
    	$("#deleteUsersModal").modal('hide');
    	
    };
    
    $scope.selectUser = function (selectedUserId) {
    	
    	var url = $scope.url +"findUserById/"+ selectedUserId ;

        $http.get(url)
            .success(function (data) {
            	
            	$scope.user = data;
            	$scope.selectedUserName = $scope.user.name;
            	$scope.selectedUserId = $scope.user.id;
            })
            .error(function(data) {
                alert("error in selectUser");
            });
    	
    };
    
    $scope.resetUser = function(){
        $scope.user = {};
        $scope.displayValidationError = false;
        $scope.captchaValid = false;        
    };
    
    $scope.createUser = function (newUserForm) {
    	
    	    	
        if (!newUserForm.$valid) {
            $scope.displayValidationError = true;
            return;
        }
        
        if ($scope.captchaValid != true) {
			alert("invalid captcha");
    		return;
		}

        var url = $scope.url +"addUser" ;

        var config = {headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}};

        $http.post(url, $.param($scope.user), config)
            .success(function (data) {
                $scope.getUserList();
                $("#createUsersModal").modal('hide');
                
            })
            .error(function(data) {
                alert("error in createUser");
            });
    };
    
    
    $scope.updateUser = function (updateUserForm) {
        if (!updateUserForm.$valid) {
            $scope.displayValidationError = true;
            return;
        }
        
        if ($scope.captchaValid != true) {
			alert("invalid captcha");
    		return;
		}
        var url = $scope.url+"updateUser";
        var config = {headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}};
        
        $http.post(url,$.param($scope.user), config)
            .success(function (data) {
            	 $scope.getUserList();
                 $("#updateUsersModal").modal('hide');
            })
            .error(function(data, status, headers, config) {
                alert("error in updateUser");
            });
    };



	});

akagunduzApp.directive('phoneInput', function($filter, $browser) {
    return {
        require: 'ngModel',
        link: function($scope, $element, $attrs, ngModelCtrl) {
            var listener = function() {
                var value = $element.val().replace(/[^0-9]/g, '');
                $element.val($filter('tel')(value, false));
            };

            // This runs when we update the text field
            ngModelCtrl.$parsers.push(function(viewValue) {
                return viewValue.replace(/[^0-9]/g, '').slice(0,10);
            });

            // This runs when the model gets updated on the scope directly and keeps our view in sync
            ngModelCtrl.$render = function() {
                $element.val($filter('tel')(ngModelCtrl.$viewValue, false));
            };

            $element.bind('change', listener);
            $element.bind('keydown', function(event) {
                var key = event.keyCode;
                // If the keys include the CTRL, SHIFT, ALT, or META keys, or the arrow keys, do nothing.
                // This lets us support copy and paste too
                if (key == 91 || (15 < key && key < 19) || (37 <= key && key <= 40)){
                    return;
                }
                $browser.defer(listener); // Have to do this or changes don't get picked up properly
            });

            $element.bind('paste cut', function() {
                $browser.defer(listener);
            });
        }

    };
});
akagunduzApp.filter('tel', function () {
    return function (tel) {
        console.log(tel);
        if (!tel) { return ''; }

        var value = tel.toString().trim().replace(/^\+/, '');

        if (value.match(/[^0-9]/)) {
            return tel;
        }

        var country, city, number;

        switch (value.length) {
            case 1:
            case 2:
            case 3:
                city = value;
                break;

            default:
                city = value.slice(0, 3);
                number = value.slice(3);
        }

        if(number){
            if(number.length>3){
                number = number.slice(0, 3) + '-' + number.slice(3,7);
            }
            else{
                number = number;
            }

            return ("(" + city + ") " + number).trim();
        }
        else{
            return "(" + city;
        }

    };
});


akagunduzApp.directive('simpleCaptcha', function() {
    return {
        restrict: 'E',
        scope: { valid: '=' },
        template: '<input ng-model="a.value" ng-show="a.input" style="width:2em; text-align: center;"><span ng-hide="a.input">{{a.value}}</span>&nbsp;{{operation}}&nbsp;<input ng-model="b.value" ng-show="b.input" style="width:2em; text-align: center;"><span ng-hide="b.input">{{b.value}}</span>&nbsp;=&nbsp;{{result}}',
        
        
        controller: function($scope) {
        	
            
            var show = Math.random() > 0.5;
            
            var value = function(max){
                return Math.floor(max * Math.random());
            };
            
            var int = function(str){
                return parseInt(str, 10);
            };
            
            $scope.a = {
                value: show? undefined : 1 + value(4),
                input: show
            };
            $scope.b = {
                value: !show? undefined : 1 + value(4),
                input: !show
            };
            $scope.operation = '+';
            
            $scope.result = 5 + value(5);
            
            var a = $scope.a;
            var b = $scope.b;
            var result = $scope.result;
            
            var checkValidity = function(){
                if (a.value && b.value) {
                    var calc = int(a.value) + int(b.value);
                    $scope.valid = calc == result;
                } else {
                    $scope.valid = false;
                }
                $scope.$apply(); // needed to solve 2 cycle delay problem;
            };
            
            
            $scope.$watch('a.value', function(){    
                checkValidity();
            });
            
            $scope.$watch('b.value', function(){    
                checkValidity();
            });
            
            
            
        }
    };
});


	