<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Products</title>
</head>
<body>
<div class="container">
  <h2>ADD PRODUCTS</h2>
  <form:form method="POST" commandName="products" action="products/add">
  
   <div class="form-group">
    <label for="id"> ID:</label>
    <form:input type=" text" class="form-control" id="pid" placeholder="Enter product id" path="pid"/>
       </div>
    <div class="form-group">
     <label for="name">Name:</label>
     <form:input type="text" class="form-control" id="pname" placeholder="Enter product name" path="pname"/>
    </div>   
    <div class="form-group">
      <label for="description">Description:</label>
      <form:input type="text" class="form-control" id="pdescription" placeholder="Enter product description" path="pdescription"/>
    </div>
    <div class="form-group">
      <label for="price">Price:</label>
      <form:input type="text" class="form-control" id="pprice" placeholder="Enter product price" path="pprice"/>
    </div>
   
    <button type="submit" class="btn btn-primary">Add product</button>
  </form:form>
</div>


</body>
</html>