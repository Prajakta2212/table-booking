<%@ page import="java.sql.*"%>

<%
if (request.getParameter("dr") != null)
{

try {
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url = "jdbc:mysql://localhost:3306/c";
String un = "root";
String pw = "Prajakta@2212";
Connection con = DriverManager.getConnection(url, un, pw);

String sq = "delete from  reservesss where choice = ?";
PreparedStatement ps = con.prepareStatement(sq);
ps.setString(1, request.getParameter("dr"));
ps.executeUpdate();
con.close();
}
catch (SQLException e)
{
out.println("issue " + e);
}
}
%>

<html>
<head>

<style>
body { background-color:lightblue; }
td { text-align: center; }
</style>
</head>
<body>
<center>
<div id="div1">
<font color="blue" font face="cinzel" size="100">    
            <a href ="index.jsp">Home</a>			          
                                                                                    
            <a href ="menu.jsp">Menu</a>    
                        
            <a href ="reservation.jsp">Reservation</a>    
                        
                
                        
            <a href ="feedback.jsp">Feedback</a>
         
    	    <a href="login.jsp">login</a>
            
            <a href="register.jsp">New user</a>	
        <font>
	   <p align="justify"><font color="red" font size="8px">
	   <form>
<h1> Reserved Tables </h1>
<table border="2" style="width:80%" >
<tr>
<th> choice </th>
<th> name </th>
<th> Delete </th>
</tr>

<div id="div1">
<a href="ver.jsp"></a>	
<a href="index.jsp">logout</a>
<%

try {
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url = "jdbc:mysql://localhost:3306/c";
String un = "root";
String pw = "Prajakta@2212";
Connection con = DriverManager.getConnection(url, un, pw);

String sql = "select * from reservesss";
PreparedStatement pst = con.prepareStatement(sql);
ResultSet rs = pst.executeQuery();
while(rs.next())
{
String choice = rs.getString(1);
String name = rs.getString(2);

%>
<tr width="50%">
<td> <%= choice %> </td>
<td> <%= name %> </td>
<td><a href="?dr=<%= choice %>" onclick="return confirm(' are you sure??? ')" >Delete </a></td>
</tr>
<%

}
con.close();
}
catch (SQLException e)
{
out.println("issue " + e);
}

%>
</table>
</div>
</center>
</form>
</font>
</p>
</body>
</html>    
</body>
</html>
