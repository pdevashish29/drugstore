 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
   String path= request.getContextPath();
   String message=(String)request.getAttribute("message");
   if(message==null)message="";
   String tab= request.getParameter("tab");
   %>
   
<div class="col-sm-2 " style="margin-left: -30px;">
<ul class="nav nav-pills nav-stacked">
    <li class="${tab=='sale' ?'active':''}"><a href="<%=path%>/sale">Sale</a></li>
    <li class="${tab=='purchase' ?'active':''}"><a href="<%=path %>/purchase">Purchase</a></li>
   <li class="${tab=='add' ?'active':''}"><a href="<%=path %>/addProduct">Add Product</a></li>
   <li><a href="#">Report</a></li>
    <li><a href="#">Social</a></li>
  </ul>
</div> 
   
   
