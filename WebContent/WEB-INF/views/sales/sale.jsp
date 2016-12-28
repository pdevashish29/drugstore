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
	request.setAttribute("tab", "sale");
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
	<script type="text/javascript" src="<%=path%>/resources/js/angular.min.js"></script>
	<script type="text/javascript" src="<%=path%>/resources/js/bootstrap.min.js"></script>
    	<link rel="stylesheet" href="<%=path%>/resources/css/bootstrap-datetimepicker.css" type="text/css" />
	<script src="<%=path%>/resources/js/moment-with-locales.js"></script>
	<script src="<%=path%>/resources/js/bootstrap-datetimepicker.js"></script>
	 <script src="https://code.angularjs.org/1.3.0-rc.2/angular-messages.js"></script>
	
 	<script type="text/javascript">

 		var app = angular.module('myApp',['ngMessages']);
 		app.factory('productFactory', ['$http', function ($http) {
 			 var urlBase="<%=path%>";
 			 return {
 				
 				 getProductDetailsList: function (str) {
 					 var promise = $http({method:'GET', url:urlBase +'/productInfo?str='+str })
 					    .success(function (data, status, headers, config) {
 					      return data;
 					    })
 					    .error(function (data, status, headers, config) {
 					      return {"status": false};
 					    });
 					  return promise;
 				}
 			 }
 		}]);
 		
 		
 	 app.controller('productController', function ($scope,$http,productFactory) {
 		var urlBase="<%=path%>";
 		 $scope.productList=[];
 		 $scope.getProductDetailsList= function(str){
 			productFactory.getProductDetailsList(str).then(function(promise) {
 				$scope.productList=promise.data;
 				console.log($scope.productList);
 			})
 			return $scope.productList;
 		 };
 		 
 			$scope.onSelectPartNumber=function(item){
 				console.log(item)
 						
 				//$scope.choice=item;
 					$scope.productName=item.productName+' '+item.productCategoryName;
 					$scope.batchNo=item.batchNo;
 					$scope.mfgDate=item.mfgDate;
 					$scope.expDate=item.expDate;
 					$scope.qty=item.quantity;
 					$scope.rate=item.sellingPrice;
 					$scope.total=item.rate;
 			};
 		});
 	</script>
</head>
<body data-ng-controller="productController" >
<jsp:include page="/WEB-INF/views/component/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/component/headerMenu.jsp"></jsp:include>		

   	<div class="col-sm-10" style="width: 80%">
   	<div class="col-lg-12 well" style="margin-top: -14px">
		 		<div class="row">
				<form name="signUpForm">
					<div class="col-sm-12">
					<div class="row">
					<div class="col-sm-5 form-group">
								<label for="sel1">Customer Name </label>
								<input type="text"  class="form-control" ng-model="user.fName" ng-required>
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
				</td>
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

