<!doctype html>
<html class="no-js" >
   <head>
    <meta charset="utf-8">
    <title>V chat</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-2.2.4.js"integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>

  
   <!-- Firebase -->
	<script src="https://www.gstatic.com/firebasejs/3.6.9/firebase.js"></script>
	<script src="https://cdn.firebase.com/libs/angularfire/2.0.1/angularfire.min.js"></script>



     
<script type="text/javascript">
  var config = {
	    apiKey: "AIzaSyBK90oRzqZmdZ8gfr4RASgrHlo2lYoRgZ4",
	    authDomain: "testdbforme.firebaseapp.com",
	    databaseURL: "https://testdbforme.firebaseio.com",
	    storageBucket: "testdbforme.appspot.com",
	    messagingSenderId: "396279320762"
	  };
	  firebase.initializeApp(config);
	  
	   
	  /*  var config = {
			    apiKey: "AIzaSyC9hOR9S6FQEXtuZo4Ii3ClNipIaV8Xb5g",
			    authDomain: "vflip-83ae2.firebaseapp.com",
			    databaseURL: "https://vflip-83ae2.firebaseio.com",
			    storageBucket: "vflip-83ae2.appspot.com",
			    messagingSenderId: "596143825357"
			  };
			  firebase.initializeApp(config); */
			  
			  
var app = angular.module('vchatApp', ['firebase']);

app.controller("vchatController", function($scope,$firebaseAuth,$firebaseObject,$firebaseArray,$filter) {
	$scope.login=true;
	$scope.signUp1=false;
	$scope.dashboard=false;
	/* $scope.authObj = $firebaseAuth();
	console.log($scope.authObj); */
	
$scope.login=function(){
	var username=$scope.userName;
	var password=$scope.password;
	
	firebase.auth().signInWithEmailAndPassword(username, password).then(function(data){
		 $scope.$apply( function () {
		console.log(data.uid);
		//console.log(data);
		console.log("success");
		$scope.gotoDashboard();
		//callme();
		 });
	}).catch(function(error) {
		  // Handle Errors here.
		  console.log("kya hua ");
		  var errorCode = error.code;
		  var errorMessage = error.message;
		  console.log(errorMessage);
		});
	$scope.userName='';
	$scope.password='';
};

$scope.signUp=function(){
	var username=$scope.userName;
	var password=$scope.password;
	firebase.auth().createUserWithEmailAndPassword(username, password).then(function(data){
		console.log(data.$uid);
		console.log("user created succesfully");
		
	}).catch(function(error) {
		  // Handle Errors here.
		  var errorCode = error.code;
		  var errorMessage = error.message;
		  
		  console.log(errorCode +" : "+errorMessage);
		  // ...
		});
	
};


$scope.logOutMe= function(){
	firebase.auth().signOut().then(function(data) {
		console.log(data);
		console.log("Sign-out successful.");
		}, function(error) {
			console.log("error");
		});
	$scope.userName='';
	$scope.password='';
	$scope.login=true;
	$scope.signUp1=false;
	$scope.dashboard=false;
	
}


$scope.showSignUP=function(){
	$scope.userName='';
	$scope.password='';
	$scope.login=false;
	$scope.signUp1=true;
	$scope.dashboard=false;
}
$scope.showLogin=function(){
	$scope.userName='';
	$scope.password='';
	$scope.login=true;
	$scope.signUp1=false;
	$scope.dashboard=false;
	
}
$scope.gotoDashboard=function(){
	$scope.login=false;
	$scope.signUp1=false;
	$scope.dashboard=true;
	
}

$scope.saveData=function(user){
	
	var firstName=$scope.user.firstName;
	var lastName=$scope.user.lastName;
	var mobileNo=$scope.user.mobileNo;	
	console.log(firstName +" : " +lastName+"  "+mobileNo)
	
		   firebase.database().ref('users/'+mobileNo).set({
		    firstName: firstName,
		    lastName: lastName,
		    mobileNo : mobileNo
		  }).then(function(data){
			console.log(data);
		  }); 
	
	 
}

$scope.findUserByPhone= function(phoneNumer){
	$scope.user={};
	 var ref =firebase.database().ref().child("users");
		
	 firebase.database().ref('/users/' + phoneNumer).once('value').then(function(snapshot) {
		 $scope.$apply( function () {
		 	$scope.user = snapshot.val();
	  	 	console.log($scope.user);
	  	 	console.log($scope.user.firstName);
		 
		 });
	}); 
}


});
</script>
</head>
<body  data-ng-app="vchatApp" data-ng-controller="vchatController"  ng-init="findUserByPhone('745')" >
<div ng-show="login">
<section id="login" class="sections sections-narrow"  >
  <div class="container">
 
    <h2 class="sub-header">Login</h2>
    <div class="row">
      <div class="col-md-10" >
      
       <form name="sign_form" class="form-horizontal" role="form">
  <div class="form-group">
    <label for="userName" class="col-sm-2 control-label">User Name:</label>
    <div class="col-sm-4">
      <input class="form-control" id="userName" ng-model="userName" placeholder="User Name" />
    </div>
  </div>

  <div class="form-group">
    <label for="password" class="col-sm-2 control-label">Password:</label>
    <div class="col-sm-4">
      <input class="form-control" id="password" ng-model="password" placeholder="Password" />
    </div>
  </div>

 

  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
    <button  class="btn btn-small btn-primary" ng-click="login()" >Login </button>
       <a href="#/" class="btn btn-small btn-danger">Cancel</a>
    </div>
  </div>
</form>
       <a href="#" ng-click="showSignUP()" >Sign UP</a><br><br>
       <a href="#" ng-click="gotoDashboard()" >DashBoard</a>
      </div>
    </div>
  </div>
</section>
</div>

 <div ng-show="signUp1">
<section id="signUp" class="sections sections-narrow"   >
  <div class="container">
    <h2 class="sub-header">Sign Up</h2>
    <div class="row">
      <div class="col-md-10" >
      
       <form name="sign_form" class="form-horizontal" role="form">
  <div class="form-group">
    <label for="userName" class="col-sm-2 control-label">User Name:</label>
    <div class="col-sm-4">
      <input class="form-control" id="userName" ng-model="userName" placeholder="User Name"/>
    </div>
  </div>

  <div class="form-group">
    <label for="password" class="col-sm-2 control-label">Password:</label>
    <div class="col-sm-4">
      <input class="form-control" id="password" ng-model="password" placeholder="Password"/>
    </div>
  </div>

 

  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
    <button  class="btn btn-small btn-primary" ng-click="signUp()" >Sign Up </button>
       <a href="#/" class="btn btn-small btn-danger">Cancel</a>
    </div>
  </div>
</form>
       <a href="#" ng-click="showLogin()" >Login</a>
      </div>
    </div>
  </div>
</section>
</div>
    
    <div ng-show="dashboard">
    <section id="dashboard" class="sections sections-narrow"   >
  <div class="container">
 
    <h2 class="sub-header">Dashboard</h2>
    
  
  			<div class="col-lg-12 jumbotron">
			<div class="row">
				<form name="signUpForm">
					<div class="col-sm-12">
				
					<div class="row">
						<div class="col-sm-6 form-group">
								<label>First Name</label>
								<input type="text"  class="form-control" ng-model="user.firstName">
							</div>	
					</div>	
					
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Last Name</label>
								<input type="text"  class="form-control" ng-model="user.lastName">
							</div>	
						</div>
				
					
						
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Mobile Number</label>
								<input type="text"  class="form-control" ng-model="user.mobileNo">
							</div>	
						</div>	
						
						
					
					<button type="button" class="btn btn-lg btn-danger">Cancel</button>	
					<button type="button" class="btn btn-lg btn-info" ng-click="saveData(user);">Submit</button>
										
					</div>
					</div>
				</form> 
				 <a href="#" ng-click="logOutMe()" >Log Out</a>
				</div>
	</div>
	</div>
  
</section>
    
{{user.firstName}}    </div>
  </body>
</html>
