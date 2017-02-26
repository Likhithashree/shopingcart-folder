<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.button {
    background-color: white; /* Green */
    border: none;
    color: white;
    padding: 16px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}

.button1 {
    background-color: green; 
    color: black; 
    border: 2px solid #008CBA;
}

.button1:hover {
    background-color: #D3D3D3;
    color: black;
}

.button1 {
  padding: 15px 25px;
  font-size: 24px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.button1:hover {background-color: #3e8e41}

.button1:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}


.button2 {
    background-color: green; 
    color: black; 
    border: 2px solid #008CBA;
}

.button2:hover {
    background-color: 	#D3D3D3;
    color: black;
}
.button2 {
  padding: 15px 25px;
  font-size: 24px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.button2:hover {background-color: #3e8e41}

.button2:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
.button3 {
    background-color: green; 
    color: black; 
    border: 2px solid #008CBA;
}

.button3:hover {
    background-color: #D3D3D3;
    color: black;
}
.button3 {
  padding: 15px 25px;
  font-size: 24px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.button3:hover {background-color: #3e8e41}

.button3:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
</head>
<head>
<style>
body {
  
    background-image: url(resources/images/suit7.jpg);     
   background-position:right top,left bottom;   
   background-size: 500px 700px;   
    background-color:peachpuff;                    
   background-repeat:   no-repeat;
  

}
</style>
</head>
<body>
<div class="container">
<button class="button button1"><a href="category">Category</a><br></button>
<button class="button button2"><a href="products">Products</a><br></button>
<button class="button button3"><a href="supplier">Supplier</a><br></button>

</div>	
</body>
</html>
<%--  <%@ include file="footer.jsp" %> --%>
