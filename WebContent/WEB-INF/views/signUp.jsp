<%@page import="com.drugstore.pdp.util.ApplicationConstant"%>
<% 
	String path = request.getContextPath();
request.setAttribute("tab", "signUp");
String message=(String)request.getAttribute(ApplicationConstant.LOGIN_MESSAGE);
if(message==null)message="";
%>
<!DOCTYPE html>
<html lang="en" data-ng-app="myApp">
<head>
  <title>Dashboard</title>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
   	<meta name="description" content="By parashar Devashish">
   	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="<%=path%>/resources/css/bootstrap.min.css" style="text/css">
	<script type="text/javascript" src="<%=path%>/resources/js/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="<%=path%>/resources/js/angular.min.js"></script>
  	<link rel="stylesheet" href="<%=path%>/resources/css/bootstrap-datetimepicker.css" type="text/css" />
	<script src="<%=path%>/resources/js/moment-with-locales.js"></script>
	<script src="<%=path%>/resources/js/bootstrap-datetimepicker.js"></script>
	 <script src="https://code.angularjs.org/1.3.0-rc.2/angular-messages.js"></script>
 	
	
 	<script type="text/javascript">

 		var app = angular.module('myApp',["ngMessages"]);
 		 var urlBase="<%=path%>";
 		 		app.factory('productFactory', ['$http', function ($http) {
 					
 			 return {
 				
 			 addUser: function (user) {
 				 alert(user);
 				var promise = $http({
 								method:'POST',
 								data:user,
 								url:urlBase +'/signUp'
 					 }) .success(function (data, status, headers, config) {
 					      return data;
 					    })
 					    .error(function (data, status, headers, config) {
 					      return {"status": false};
 					    });
 					  return promise;
 				}
 		
 		 
 			 } /* end of return main */
 		}]);
 		
 		
 	 app.controller('productController', function ($scope,$http,productFactory) {
 		$scope.status=false;	
 		 // ready to code 
 		 $scope.user='';
 		
 		 $scope.addUser= function(user){
 			$scope.status=false;	
 			 console.log(user);
 			 $scope.user.dateOfBirth=$("#dateOfBirth").val();
 			 console.log(user);
 			productFactory.addUser(user).then(function(data){
 					
 				//alert("Record update successfully");
 			});
 		 }
 		 
 		 
 		});
 	 
 	
 	</script>
<style>
@import "font-awesome.min.css";
@import "font-awesome-ie7.min.css";
/* Space out content a bit */
body {
  padding-top: 20px;
  padding-bottom: 20px;
}

/* Everything but the jumbotron gets side spacing for mobile first views */
.header,
.marketing,
.footer {
  padding-right: 15px;
  padding-left: 15px;
}

/* Custom page header */
.header {
  border-bottom: 1px solid #e5e5e5;
}
/* Make the masthead heading the same height as the navigation */
.header h3 {
  padding-bottom: 19px;
  margin-top: 0;
  margin-bottom: 0;
  line-height: 40px;
}

/* Custom page footer */
.footer {
  padding-top: 19px;
  color: #777;
  border-top: 1px solid #e5e5e5;
}

/* Customize container */
@media (min-width: 768px) {
  .container {
    max-width: 730px;
  }
}
.container-narrow > hr {
  margin: 30px 0;
}

/* Main marketing message and sign up button */
.jumbotron {
  text-align: center;
  border-bottom: 1px solid #e5e5e5;
}
.jumbotron .btn {
  padding: 14px 24px;
  font-size: 21px;
}

/* Supporting marketing content */
.marketing {
  margin: 40px 0;
}
.marketing p + h4 {
  margin-top: 28px;
}

/* Responsive: Portrait tablets and up */
@media screen and (min-width: 768px) {
  /* Remove the padding we set earlier */
  .header,
  .marketing,
  .footer {
    padding-right: 0;
    padding-left: 0;
  }
  /* Space out the masthead */
  .header {
    margin-bottom: 30px;
  }
  /* Remove the bottom border on the jumbotron for visual effect */
  .jumbotron {
    border-bottom: 0;
  }
}
</style>
</head>
<body data-ng-controller="productController" ng-init="getLocation('c');">
<jsp:include page="/WEB-INF/views/component/header.jsp"></jsp:include>
<div class="container">

<div class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title">Modal title</h4>
      </div>
      <div class="modal-body">
        <p>One fine body…</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

	<div class="col-lg-12 well">
	<div class="row">
				<form name="signUpForm">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-4 form-group">
								<label>First Name</label>
								<input type="text"  class="form-control" ng-model="user.fName" ng-required>
							</div>
							
							<div class="col-sm-4 form-group">
								<label>Middle Name</label>
								<input type="text"  class="form-control" ng-model="user.mName" >
							</div>
							
							<div class="col-sm-4 form-group">
								<label>Last Name</label>
								<input type="text"  class="form-control" ng-model="user.lName" required>
							</div>
							
						</div>	
						
					<div class="row">
					<div class="col-sm-6 form-group">
							<label>Date of Birth</label>
                			<div class='input-group date' id='datetimepicker1'>
                  			  <input type='text'  class="form-control" id ="dateOfBirth"  /><span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
              			  </div>
           			</div>		
					
					<div class="col-sm-6 form-group pull-right">
					<label>Gender</label>
					<div class="form-group">
							<label class="radio-inline"><input type="radio" name="optradio" value="M" ng-model="user.gender">Male</label>
							<label class="radio-inline"><input type="radio" name="optradio" value="F" ng-model="user.gender">Female</label>
						</div>	
					</div>
					</div>						
						
					
					<div class="form-group">
						<label>User Name</label>
						<input type="text"  class="form-control" ng-model="user.userName" required>
						<div ng-show="signUpForm.user.password1.$error.required">
						
					</div>		
					<div class="form-group">
						<label>Password</label>
						<input type="password"  class="form-control" ng-model="user.password1" required>
						
					</div>	
					<div class="form-group">
						<label>Confirm Password</label>
						<input type="password"  class="form-control" ng-model="user.password2">
					</div>	
										
						<div class="form-group">
							<label>Address</label>
							<textarea  rows="3" class="form-control" ng-model="user.lineNo1"></textarea>
						</div>	
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>City</label>
								<input type="text"  class="form-control" ng-model="user.city">
							</div>	
							<div class="col-sm-6 form-group">
								<label>State</label>
								<input type="text"  class="form-control" ng-model="user.state">
							</div>	
						</div>
						<div class="row">
						<div class="col-sm-6 form-group">
								<label>Country</label>
								<input type="text"  class="form-control" ng-model="user.country">
							</div>	
							
							
							<div class="col-sm-6 form-group">
								<label>Zip</label>
								<input type="text" class="form-control" ng-model="user.zip">
							</div>		
							
						</div>
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Company Name</label>
								<input type="text"  class="form-control" ng-model="user.businessName">
							</div>	
							
							<div class="col-sm-6 form-group">
								<label for="sel1">Select Company Type:</label>
									  <select class="form-control" id="sel1" ng-init="user.bussinessType=1" ng-model="user.bussinessType" >
									    <option  value="1" >Retailer</option>
									    <option  value="3">Distributor</option>
									    <option value="3">Menufacturer</option>
									    <option  value="7">Other</option>
									  </select>
								</div>
						</div>						
					<div class="form-group">
						<label>Phone Number</label>
						<input type="text"  class="form-control" ng-model="user.phoneNo">
					</div>	
					
					<div class="form-group">
						<label>Mobile Number</label>
						<input type="text"  class="form-control" ng-model="user.mobileNo">
					</div>	
						
					<div class="form-group">
						<label>Email Address</label>
						<input type="text"  class="form-control" ng-model="user.email">
					</div>	
					<button type="button" class="btn btn-lg btn-danger">Cancel</button>	
					<button type="button" class="btn btn-lg btn-info" ng-click="addUser(user);">Submit</button>
										
					</div>
				</form> 
				</div>
	</div>
	</div>
<jsp:include page="/WEB-INF/views/component/footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
$(function () {
    $('#datetimepicker1').datetimepicker({
    	format: 'MM/DD/YYYY'
    });
});
	        
		
		
        
    
</script>
</html>

