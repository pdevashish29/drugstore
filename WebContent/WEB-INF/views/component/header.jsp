 <%@page import="com.drugstore.pdp.entity.User"%>
<%@page import="com.drugstore.pdp.util.ApplicationConstant"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
   String path= request.getContextPath();
   String tab= request.getParameter("tab");
   User user = null;
   user =(User)session.getAttribute(ApplicationConstant.LOGIN_SESSION);
   String bussinessName="";
   if(user!=null){
	   bussinessName=user.getBussinessName();
   }
  
   
   %>

   <div class="container-fluid" >
  <div class="panel panel-primary" style="min-height: 600px; margin-top:${tab=='signUp' ? '-20px':''};" >
    <div class="panel-heading" style="height: 65px;" >
    <a href="<%=path %>/"  style="color: white;font-weight: 700; font-size: 20px" > Quick Biller </a>
    <!--  <span style="float:right; color: white;font-weight: 600; font-size: 14px; margin-right: 10px;"  >  <span class="glyphicon glyphicon-user"></span> Pandey Medical Hall</span>
    -->
    <% if(user!=null){ %>
     <div class="dropdown pull-right" style="margin-top: 23px" >
    <span class="dropdown-toggle"  data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> 
       <span style="color: white;font-weight: 600; font-size: 14px; margin-right: 10px;">&nbsp;<%=bussinessName %></span>
   	 <span class="caret"></span></span>
    			<ul class="dropdown-menu">
    			<li><a href="#">Profile</a></li>
    			<li><a href="#">Setting</a></li>
    			<li><a href="#">Switch</a></li>
      				<li><a href="<%=path %>/logout">Log Out</a></li>
    			</ul>
  	</div>
  	<%} %>
     </div> <!-- end of pannelheading -->
    <div class="panel-body">

   
