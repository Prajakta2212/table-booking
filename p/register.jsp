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
                                
                        
            <a href="ver.jsp">Show</a>    
                        
            <a href="feedback.jsp">Feedback</a> 

              

			<a href="login.jsp">login</a>	
	    		
    	        <a href="register.jsp">New user</a>	
  </font>
       <font>
	   <p align="justify"><font color="red" font size="7px">
<h1> Sign up Page </h1>
<form method="POST">


Enter Username : <input type="text" name="un" placeholder="enter username"
required>
<br><br>
Enter Password : <input type="password" name="pw1" placeholder="enter password"
required>
<br><br>
Enter Confirm Password : <input type="password" name="pw2" placeholder="confirm password"
required>
<br><br>
<input type="submit" value="Signup" name="btn">

<a href="login.jsp">login</a>

<%
if (request.getParameter("btn") != null)
{
String usr=request.getParameter("un");
String pw1=request.getParameter("pw1");
String pw2=request.getParameter("pw2");
if(pw1.equals(pw2));
{
try {
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url = "jdbc:mysql://localhost:3306/c";
String un = "root";
String pw = "Prajakta@2212";
Connection con = DriverManager.getConnection(url, un, pw);

String sql1 = "select * from cc where name=?";
PreparedStatement pst1 = con.prepareStatement(sql1);
pst1.setString(1, usr);
ResultSet rs1 = pst1.executeQuery();
if(rs1.next())
{
out.println(usr + "already registered");
}
else 
{
String sql2 = "insert into cc values(?,?)";
PreparedStatement pst2 = con.prepareStatement(sql2);
pst2.setString(1, usr);
pst2.setString(2, pw1);
pst2.executeUpdate();
response.sendRedirect("login.jsp");
}
con.close();
}

catch (SQLException e)
{
out.println("issue " + e);
}
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
