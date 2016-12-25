<%@page import="com.drugstore.pdp.util.ApplicationConstant"%>
<% 
	String path = request.getContextPath();
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
	
 	<script type="text/javascript">

 		var app = angular.module('myApp',[]);
 		 var urlBase="<%=path%>";
 		app.factory('productFactory', ['$http', function ($http) {
 			
 			 return {
 				
 				 /* getProductDetailsList: function (str) {
 					 var promise = $http({method:'GET', url:urlBase +'/productInfo?str='+str })
 					    .success(function (data, status, headers, config) {
 					      return data;
 					    })
 					    .error(function (data, status, headers, config) {
 					      return {"status": false};
 					    });
 					  return promise;
 				}
 		 */
 		 
 			 } /* end of return main */
 		}]);
 		
 		
 	 app.controller('productController', function ($scope,$http,productFactory) {
 
 		 // ready to code 
 		 
 		});
 	</script>
<style>

.form-signin
{
    max-width: 330px;
    padding: 15px;
    margin: 0 auto;
}
.form-signin .form-signin-heading, .form-signin .checkbox
{
    margin-bottom: 10px;
}
.form-signin .checkbox
{
    font-weight: normal;
}
.form-signin .form-control
{
    position: relative;
    font-size: 16px;
    height: auto;
    padding: 10px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.form-signin .form-control:focus
{
    z-index: 2;
}
.form-signin input[type="text"]
{
    margin-bottom: -1px;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
}
.form-signin input[type="password"]
{
    margin-bottom: 10px;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
}
.account-wall
{
    margin-top: 20px;
    padding: 40px 0px 20px 0px;
    background-color: #f7f7f7;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}
.login-title
{
    color: #555;
    font-size: 18px;
    font-weight: 400;
    display: block;
}
.profile-img
{
    width: 96px;
    height: 96px;
    margin: 0 auto 10px;
    display: block;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}
.need-help
{
    margin-top: 10px;
}
.new-account
{
    display: block;
    margin-top: 10px;
}
</style>
</head>
<body data-ng-controller="productController" ng-init="getLocation('c');">
<jsp:include page="/WEB-INF/views/component/header.jsp"></jsp:include>

<div class="container">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <div class="account-wall">
                <img class="profile-img" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
                    alt="">
                <form class="form-signin" action ="handleLogin" method ="post">
                <input type="text" class="form-control" placeholder="Email" name ="userName" required autofocus>
                <input type="password" class="form-control" placeholder="Password" name ="password" required>
                <label style="color: red;"><%=message %></label>
                <button class="btn btn-lg btn-primary btn-block" type="submit">
                    Sign in</button>
                <label class="checkbox pull-left">
                    <input type="checkbox" value="remember-me">
                    Remember me
                </label>
                <a href="#" class="pull-right need-help">Need help? </a><span class="clearfix"></span>
                </form>
            </div>
            <a href="<%=path %>/signUp" class="text-center new-account">Create an account </a>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/component/footer.jsp"></jsp:include>
</body>
</html>

