<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<head>
<style>
body {
  
    background-image: url(resources/images/suit6.jpg);     
   background-position:right bottom,left top; 
    background-color:light blue;
   background-size: 500px 600px;                     
   background-repeat:   no-repeat;
  

}
</style>
</head>
<body>

<body>
<div class="container">
  <h2>Login Form</h2>
   <div style="color:#000000;margin:40px 0px 0px 100px">
    <a style="color:#000000;font-size:2.0em" href="home"><span class="glyphicon glyphicon-home"></span></a>
   </div>
   <div class="container" style="align:center; margin: 150px 0px 0px 150px">
   <div class="row">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-4 col-md-offset-3">
    
    <form  action="<c:url value='j_spring_security_check'/>"  method="POST" role="form">
  
     <c:if test="${not empty loginerror}">
       <p class="loginerror" >${loginerror}</p>
       </c:if>
       
       <c:if test="${not empty loginmsg}">
       <p class="loginmsg" >${loginmsg}</p>
       </c:if>
          <h2 style="color:#000000">Please Login</h2>
	     <hr class="colorgraph"> 
        <div class="row">
				<div class="col-sm-12 ">
					<div class="form-group">
						<input style="background-color:#FFFFE0" type="text"  name="username" id="name" class="form-control input-lg" placeholder="Name" tabindex="1" />
					</div>
				</div>
			
				
			</div>
			 <div class="row">
				<div class="col-xs-12">
					<div class="form-group">
						<input style="background-color:#FFFFE0" type="password"  name="password" id="password" class="form-control input-lg" placeholder="Password" tabindex="2" />
					</div>
				</div>
			
				
			</div>
			<hr class="colorgraph"> 
 			<div class="row">
				<div class="col-xs-12 col-md-6"><input type="submit" value="Submit" class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
				
			</div>

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
</div>
</body>
</html>