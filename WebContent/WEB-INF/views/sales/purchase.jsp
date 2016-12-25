<%@page import="java.util.Calendar"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>  
<% 
	String path = request.getContextPath();
	Calendar cal = Calendar.getInstance();
	Date date=new Date();	
	int month=date.getMonth();
	int year=date.getYear();
	int dat=date.getDate();
	year=year+1900;
	SimpleDateFormat format = new SimpleDateFormat("MM/dd/YYYY");
	Calendar c = Calendar.getInstance();    
	c.set(year,month,1); 
	c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
	String toDate=format.format(c.getTime());
	String fromDate=(month+1)+"/"+01+"/"+year;
	request.setAttribute("tab", "purchase");
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
 		var app = angular.module('myApp');
 		var urlBase="<%=path%>";
 		app.factory('productFactory', ['$http', function ($http) {
 			 return {
				 				
 			/* 	 getProductDetailsList: function (str) {
 					 var promise = $http({method:'GET', url:urlBase +'/productInfo?str='+str })
 					    .success(function (data, status, headers, config) {
 					      return data;
 					    })
 					    .error(function (data, status, headers, config) {
 					      return {"status": false};
 					    });
 					  return promise;
 				} */
 			 }
 		}]);
 		
 		
 	 app.controller('productController', function ($scope,$http,productFactory) {
		// ready to code
 	 
 	 });
 	</script>
</head>
<body data-ng-controller="productController" ng-init="getLocation('c');">
<jsp:include page="/WEB-INF/views/component/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/component/headerMenu.jsp"></jsp:include>
   	<div class="col-sm-10">
   		<form action="#">
   		<div class="form-group">
   			<label>Seller Name</label>
   			<input type ="text" class="form-control" ng-model="bussinessName">
   		
   		</div>
   		
   		</form>
		 	
		 	
		 	
   
   </div> <!-- end of col-sm-10 -->
<jsp:include page="/WEB-INF/views/component/footer.jsp"></jsp:include>
</body>
</html>

