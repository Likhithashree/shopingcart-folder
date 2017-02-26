<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
  <%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Products</title>
</head>

<style>
body {
    background-image: url(resources/images/15.jpg);
/*     background-color:lightcyan; */
     background-size: 1400px 1900px;
     background-repeat:   no-repeat;
}
</style>

<body>
<div class="container">
  <h2><center>ADD PRODUCTS</center></h2>
<c:url var="addAction"  value="/products/add"></c:url>

<form:form action="${addAction}" commandName="products" enctype="multipart/form-data">
<table class="table table-condensed">
	<tr bgcolor=#F0F8FF>
		<td><form:label style="color:#000000" path="pid"><spring:message text="ID"/></form:label></td>
		
		
		<c:choose>
			<c:when test="${!empty products.pid }">
				<td><form:input style="background-color:#F5F5DC;border:0.25px solid black" path="pid" disabled="true" readonly="true"/></td>
			</c:when>
			<c:otherwise>
				<td><form:input style="background-color:#F5F5DC;border:0.25px solid black" path="pid"  pattern=".{4,7}" required="true" title="id should be between 4 to 7 characters"/></td>
				</c:otherwise>
				</c:choose>
				</tr>
				
				<tr bgcolor="#F0F8FF"> 
				<form:input path="pid" hidden="true"/>
				
				<td><form:label style="color:#000000" path="pname"> <spring:message text="NAME"/></form:label></td>
        		<td><form:input style="background-color:#F5F5DC;border:0.25px solid black" path="pname" required="true" /></td> 
				</tr>
				
				<tr bgcolor="#F0F8FF">
				<td><form:label style="color:#000000" path="pdescription" ><spring:message text="DESCRIPTION"/></form:label></td>
				<td><form:input style="background-color:#F5F5DC;border:0.25px solid black" path="pdescription" required="true"/></td>
				</tr>
				
				<tr bgcolor="#F0F8FF">
				<td><form:label style="color:#000000" path="pprice" ><spring:message text="PRICE"/></form:label></td>
				<td><form:input style="background-color:#F5F5DC;border:0.25px solid black" path="pprice" required="true"/></td>
				</tr>
				<tr bgcolor=#F0F8FF>
				<td><form:label style="color:#000000" path="supplier" ><spring:message text="SUPPLIER"/></form:label></td>
				<td><form:select style="background-color:#F5F5DC" path="supplier.scname" items="${supplierList}" itemValue="scname" itemLabel="scname"/></td>
				</tr>
				<tr bgcolor=#F0F8FF>
				<td><form:label style="color:#000000" path="category" ><spring:message text="CATEGORY"/></form:label></td>
				<td><form:select style="background-color:#F5F5DC" path="category.cname" items="${categoryList}" itemValue="cname" itemLabel="cname"/></td>
				</tr>
				
			  	<tr bgcolor=#F0F8FF>
				<td><form:label style="color:#000000"  path="image" ><spring:message text="image"/></form:label></td>
				<td><form:input style="background-color:#F5F5DC;border:0.25px solid black" type="file" path="image" /></td>
				</tr>
				
				
				<tr bgcolor="#F0F8FF">
				<td align="right" colspan="2"><c:if test="${!empty products.pname }">
									<input style= "align:middle" class="btn btn-primary btn-md" type="submit" value="<spring:message text="Edit Products"/>"/>
								</c:if>
								<c:if test="${empty products.pname}">
									<input style= "align:middle"  class="btn btn-primary btn-md" type="submit" value="<spring:message text="Add Products"/>"/>
								</c:if>
				</td>
				</tr>
</table>
</form:form>
</div>
	</div>
	</div>
	</div>
<br>
<div class="container">

<h3><center>PRODUCTS LIST</center></h3>
<br>
<c:if test="${!empty productsList}">
	<table  class="table" align="center" bordercolor="#0000FF" BORDER=3>
			<tr bgcolor="#F0F8FF">
				<th style="color:black" width="125" bgcolor="#F0F8FF" align="center">PRODUCTS ID</th>
				<th style="color:black" width="125" align="center">PRODUCTS NAME</th>
				<th style="color:black" width="190" align="center">PRODUCTS DESCRIPTION</th>
				<th style="color:black" width="190" align="center">PRODUCTS PRICE</th>
				<th style="color:black" width="190" align="center">IMAGE</th>
				<th style="color:black" width="100" align="center">EDIT</th>
				<th style="color:black" width="100" align="center">DELETE</th>
			</tr>
			<style>
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
    background-color: #20B2AA;
    color: blue;
}
</style>
					<c:forEach items="${productsList}" var="products">
				<tr bgcolor="#FFFFFF">
					<td  style="color:#000000;font-size:120%" align="center">${products.pid}</td>
					<td  style="color:#000000;font-size:120%" align="center">${products.pname}</td>
					<td style="color:#000000;font-size:120%" align="center">${products.pdescription}</td>
					<td style="color:#000000;font-size:120%" align="center">${products.pprice}</td>
				<td style="color:#000000;font-size:120%" align="center"><img src="<c:url value="/resources/images/${products.pid}.jpg"/>" width="240" height="240"/></td>
					
					<td style="color:#000000;font-size:120%" align="center"><a href="<c:url value='products/edit/${products.pid}' />"><button type="button" class="btn btn-warning">Edit</button></a></td>
					<td style="color:#000000;font-size:120%" align="center"><a href="<c:url value='products/remove/${products.pid}' />"><button type="button" class="btn btn-danger">Delete</button></a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	</div>
</div>
</body>
</html>