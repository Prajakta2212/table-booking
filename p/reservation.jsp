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

       <font>
	   <p align="justify"><font color="red" font size="6px">
	   <form>

<h1> Table Reservation </h1>
<form method="POST">
<label> Enter your Name : </label>
<input type="text" placeholder="Enter your Name" name="name" required>
<br>

<label for ="choice">Select choice : </label><br>
<input type ="Radio" id ="choice" name="choice" value="Table 1">Table 1<br>
<input type ="Radio" id ="choice" name="choice" value="Table 2">Table 2<br>
<input type ="Radio" id ="choice" name="choice" value="Table 3">Table 3<br>
<input type ="Radio" id ="choice" name="choice" value="Table 4">Table 4<br>
<input type ="Radio" id ="choice" name="choice" value="Table 5">Table 5<br>
<input type ="Radio" id ="choice" name="choice" value="Table 6">Table 6<br>
<br>
<input type="submit" value="Submit" name="btn">
<br>

<div id="div1">
<a href="index.jsp">logout</a>	
</form>
<%
if (request.getParameter("btn") != null)
{
String choice = request.getParameter("choice");
String name = request.getParameter("name");
try {
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url = "jdbc:mysql://localhost:3306/c";
String un = "root";
String pw = "Prajakta@2212";
Connection con = DriverManager.getConnection(url, un, pw);

String s = "select * from reservesss where choice = ?";
PreparedStatement p = con.prepareStatement(s);
p.setString(1, choice);
ResultSet rs = p.executeQuery();
if(rs.next()) {
out.println(choice   + "Already Booked ");
} else{

String sql = "insert into reservesss value(?, ?)";
PreparedStatement pst = con.prepareStatement(sql);
pst.setString(1, choice);
pst.setString(2, name);
pst.executeUpdate();
out.println("thank u");
response.sendRedirect("ver.jsp");
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
