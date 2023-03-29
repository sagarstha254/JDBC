<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>	
<%@page import="java.sql.Connection"%>

<%!Connection con = null; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		try
		{	
		String fName = request.getParameter("first_Name");
		String lName = request.getParameter("last_Name");
		String uName = request.getParameter("username");
		String password = request.getParameter("password");
		
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/practise";
		String user = "root";
		String pass = "";
		con = DriverManager.getConnection(url, user, pass);
		
		String query = "Select * from register";
		PreparedStatement ps = con.prepareStatement(query);
		ResultSet result = ps.executeQuery();
	%>
		<div align="center">
			<table border="1">
				<caption> List of user</caption>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>User Name</th>
				</tr>
				<%
					while(result.next()){
				%>
				<tr>
					<td><%out.println(result.getString("first_name"));%></td>
					<td><%out.println(result.getString("last_name"));%></td>
					<td><%out.println(result.getString("username"));%></td>
				</tr>
				<%
				}
				%>	
				</table>
			</div>
			
			<%
				}
				catch(Exception e)
				{
				out.println(e.getMessage());
				}
				finally
				{
					con.close();
				}
			
				%>
	

</body>
</html>