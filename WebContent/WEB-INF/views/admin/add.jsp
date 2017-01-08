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
	request.setAttribute("tab", "add");
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

 		var app = angular.module('myApp',["ngMessages"]);
 		 var urlBase="<%=path%>";
 		 		app.factory('productFactory', ['$http', function ($http) {
 					
 			 return {
 				
 			 addProduct: function (product) {
 				var promise = $http({
 								method:'POST',
 								data:product,
 								url:urlBase +'/addProductInfo'
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
 		
 		 $scope.addProduct= function(product){
 			$scope.status=false;	
 			 console.log(product);
 			 $scope.product.expDate=$("#mfgDate").val();
 			 $scope.product.mfgDate=$("#expDate").val();
 			 console.log(product);
 			productFactory.addProduct(product).then(function(data){
 					$scope.product={};
 					 $("#mfgDate").val('');
 		 			$("#expDate").val('');
 				//alert("Record update successfully");
 			});
 		 }
 		 
 		 
 		});
 	 
 	
 	</script>
</head>
<body data-ng-controller="productController" >
<jsp:include page="/WEB-INF/views/component/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/component/headerMenu.jsp"></jsp:include>		

   	<div class="col-sm-10" style="width: 80%">
   		<div class="col-lg-12 well" style="margin-top: -14px">
	<div class="row">
				<form name="addProductForm">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-4 form-group">
								<label>Product Name</label>
								<input type="text"  class="form-control" ng-model="product.productName" ng-required>
							</div>
							
							<div class="col-sm-4 form-group">
								<label>Product Category Name</label>
								<input type="text"  class="form-control" ng-model="product.productCategoryName" >
							</div>
							
							<div class="col-sm-4 form-group">
							<label>Company Name</label>
							 <input type="text"  class="form-control" ng-model="product.companyName">
						</div>
							
						</div>	
						
						<div class="row">
							<div class="col-sm-4 form-group">
								<label>Cost Price</label>
								<input type="text"  class="form-control" ng-model="product.costPrice" ng-required>
							</div>
							
							<div class="col-sm-4 form-group">
								<label>Selling Price</label>
								<input type="text"  class="form-control" ng-model="product.sellingPrice" >
							</div>
							
							<div class="col-sm-4 form-group">
								<label>Quantity</label>
								<input type="text"  class="form-control" ng-model="product.quantity" required>
							</div>
							
						</div>		
						
						
					<div class="row">
					<div class="col-sm-4 form-group">
							<label>Mfg-Date</label>
                			<div class='input-group date' id='datetimepicker1'>
                  			  <input type='text'  class="form-control" id ="mfgDate"  /><span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
              			  </div>
           			</div>		
					
					<div class="col-sm-4 form-group">
							<label>Exp-Date</label>
                			<div class='input-group date' id='datetimepicker2'>
                  			  <input type='text'  class="form-control" id ="expDate"  /><span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
              			  </div>
           			</div>	
           			<div class="col-sm-4 form-group">
							<label>Batch No</label>
							<input type="text"  class="form-control" ng-model="product.batchNo" required>
					
           			</div>	
					</div>						
						
				
					<div class="row">
					<div class="col-sm-4 form-group">
							<label>Packaging</label>
                			<input type="text"  class="form-control" ng-model="product.packaging" required>
			
           			</div>		
					
					<div class="col-sm-4 form-group">
						<label>Deal Or Bonus</label>
                		<input type="text"  class="form-control" ng-model="product.deals" required>
			
           			</div>	
           			<div class="col-sm-4 form-group">
					
           			</div>	
					</div>						
						
						
						
					
									
			
					<button type="button" class="btn btn-lg btn-danger">Cancel</button>	
					<button type="button" class="btn btn-lg btn-info" ng-click="addProduct(product);">Submit</button>
										
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
    	format: 'DD/MM/YYYY'
    });
    
    $('#datetimepicker2').datetimepicker({
    	format: 'DD/MM/YYYY'
    });
});
	        
		
		
        
    
</script>
</html>

