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
  	<link rel="stylesheet" href="<%=path%>/resources/css/bootstrap-datetimepicker.css" type="text/css" />
	<script src="<%=path%>/resources/js/moment-with-locales.js"></script>
	<script src="<%=path%>/resources/js/bootstrap-datetimepicker.js"></script>
	 <script src="https://code.angularjs.org/1.3.0-rc.2/angular-messages.js"></script>
	
 	<script type="text/javascript">
	var app = angular.module('myApp',["ngMessages"]);
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
<body data-ng-controller="productController" >
<jsp:include page="/WEB-INF/views/component/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/component/headerMenu.jsp"></jsp:include>
   	<div class="col-sm-10">
   		<div class="col-lg-12 well" style="margin-top: -14px">
				<div class="row">
				<form name="signUpForm">
					<div class="col-sm-12">
					<div class="row">
					<div class="col-sm-5 form-group">
								<label for="sel1">Select Distributor </label>
									  <select class="form-control" id="sel1" ng-init="disributor.id=1" ng-model="disributor.id=1" >
									    <option  value="1" >Kushwaha Medical hall &nbsp; Lahar Patti Mairwa</option>
									    <option  value="3">Shivam Pharma &nbsp; babuniya mod Siwan</option>
									    <option value="3">Sainy Enterprses &nbsp; address Unknow</option>
									  </select>
					</div>
					<div class="col-sm-3 form-group">
							<label>Purchase Date</label>
                			<div class='input-group date' id="datetimepicker1">
                  			  <input type='text'  class="form-control" id ="datetimepicker1"  /><span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
              			  </div>
					</div>
					<div class="col-sm-3 form-group">
							<label>Invoice No </label>
                			<div class='input-group date' id="datetimepicker1">
                  				<input type="text"  class="form-control" ng-model="user.fName" ng-required>
                  	  </div>
					</div>
					</div>
					<div class="row">
					<table class="table table-bordered" width=80%>
						 	<tr style="background-color: grey; color: white;">
						 	<th>Product Name</th> <th>Batch No</th> <th>MFG-Date</th><th>EXP-Date</th>  <th>Stock</th> <th>MRP</th> <th>Total</th>
						 	</tr>
						 <tr>
						 	<td>
						     <input  class="form-control" type="text" data-ng-model="productName" placeholder="Search part #"  data-typeahead="productName.searchKeyOfProduct  for productName in getProductDetailsList($viewValue)| filter:$viewValue"  data-ng-min-length="1" data-typeahead-min-length="2" data-typeahead-on-select='onSelectPartNumber($item)'  > 
							<td><input  class="form-control" type ="text"></td>
						 	<td><input  class="form-control" type ="text"></td>
						 	<td><input  class="form-control" type ="text" ></td>
						 	<td><input  class="form-control" type ="text" ></td>
						 	<td><input  class="form-control"  type ="text" ></td>
						 	<td><input  class="form-control" type ="text" ></td>
						 	</tr>
						 	<tr><td colspan="8"> <input value ="Add" type ="button" class="btn btn-primary" ng-click="saveData();"> </td></tr>
						 	</table>  
					</div>
				
						
								
						
					
							
						
					
						
			
					<button type="button" class="btn btn-lg btn-danger">Cancel</button>	
					<button type="button" class="btn btn-lg btn-info" ng-click="addUser(user);">Submit</button>
										
					</div>
				</form> 
				</div>
	</div>
		 	
		 	
		 	
   
   </div> <!-- end of col-sm-10 -->
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

