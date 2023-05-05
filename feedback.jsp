<%@ page import="java.sql.*"%>

<html>    
<head>    
      
 <style>
body { background-color:lightblue; }

.ff {
    font-size : 20pt;
   height: 50px;
    width: 400px;
}
</style>
    
</head> 
<center>
<div id="div1">
 
<font color="blue" font face="cinzel" size="50">    
            <a href="index.jsp">Home</a>		
             
            <a href ="menu.jsp">Menu</a>    
                        
            <a href ="reservation.jsp">Reservation</a>   	          
                                
                        
            <a href="ver.jsp">Show</a>    
                        
            <a href="feedback.jsp">Feedback</a> 

           

			<a href="login.jsp">login</a>	
	    		
    	        <a href="register.jsp">New user</a>	

       <font>
	   <p align="justify"><font color="red" font size="8px">
	   <form>

<h1> FeedBack  </h1>
<form method="POST">
<input type="text" placeholder="Enter your Name" name="na" required>
<br><br>

<input type="text" placeholder="FeedBack Plzzzz....." name="fb"  class="ff"  required>
<br><br>

<input type="submit" value="Submit" name="btn">
<br>

<div id="div1">
<a href="index.jsp">logout</a>	
</form>
<%
if (request.getParameter("btn") != null)
{
String name = request.getParameter("na");
String feedback = request.getParameter("fb");
try {
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url = "jdbc:mysql://localhost:3306/c";
String un = "root";
String pw = "Prajakta@2212";
Connection con = DriverManager.getConnection(url, un, pw);

String sql = "insert into feedbacks value(?, ?)";
PreparedStatement pst = con.prepareStatement(sql);
pst.setString(1, name);
pst.setString(2, feedback);
pst.executeUpdate();
out.println("thank u");

con.close();
}
catch (SQLException e)
{
out.println("issue " + e);
}
}
%>
</div>
</center>
</form>
</font>
</p>
</body>
</html>    
