<%@ page import="java.sql.*"%>

<html>    
<head>    
      
 <style>
body { background-color:lightblue; }
</style>
    
</head> 
<center>
<div id="div1">
 
<font color="blue" font face="cinzel" size="50">    
            <a href="index.jsp">Home</a>		
             
            <a href ="menu.jsp">Menu</a>    
                        
            <a href ="reservation.jsp">Reservation</a>   	          
                                
                        
            <a href="show.jsp">Show</a>    
                        
            <a href="feedback.jsp">Feedback</a> 

           

			<a href="login.jsp">login</a>	
	    		
    	        <a href="register.jsp">New user</a>	

       <font>
	   <p align="justify"><font color="red" font size="8px">
	   <form>

<h1> Verification </h1>
<form method="POST">
<label for ="username" > enter your username:</label>
<input type="text" name="un" placeholder="enter username"
required>
<br><br>
<label for="pass">enter your password:</label>
<input type="password" name="pw" placeholder="enter password"
required>
<br><br>
<input type="submit" value="Verify" name="btn">
<br><br>

<div id="div1">
<a href="show.jsp"></a>	
</form>
<%
if (request.getParameter("btn") != null)
{
try {
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url = "jdbc:mysql://localhost:3306/c";
String un = "root";
String pw = "Prajakta@2212";
Connection con = DriverManager.getConnection(url, un, pw);

String sql = "select * from cc where name=? and password=?";
PreparedStatement pst = con.prepareStatement(sql);
String username=request.getParameter("un");
String password=request.getParameter("pw");
pst.setString(1, username);
pst.setString(2, password);
ResultSet rs = pst.executeQuery();
if(rs.next())
{
 request.getSession().setAttribute("user", username);
response.sendRedirect("show.jsp");
}
else
{
out.println("invaild login");
}
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
