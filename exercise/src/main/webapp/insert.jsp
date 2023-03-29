
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>	
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" 
	pageEncoding="ISO-8859-1"%>
	
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
 		String fName = request.getParameter("fName");
 		String lName = request.getParameter("lName");
 		String uName = request.getParameter("uName");
 		String password = request.getParameter("password");
 		Class.forName("com.mysql.jdbc.Driver");
 		String url = "jdbc:mysql://localhost:3306/practise";
 		String user = "root";
 		String pass = "";
 		Connection con = DriverManager.getConnection(url, user, pass);
 		
 		String query = "Insert into register(first_Name, last_Name, username, password )"
 				+"values(?,?,?,?)";
 		
 		PreparedStatement ps = con.prepareStatement(query);
 		ps.setString(1, fName);
 		ps.setString(2, lName);
 		ps.setString(3, uName);
 		ps.setString(4, password);
 		
 		int result = ps.executeUpdate();
 		if(result > 0)
 		{
 			%> 	
 			<p> data inserted</p>
 			<p>error in your head</p>
 			<jsp:forward page="home.html"/>
 			<%
 		}
 		else
 		{
 			%>
				<p>error in your head</p>
 			<%
 		}
 	}
 	catch(Exception ex)
 	{
 		out.println(ex.getMessage());
 	}
 	finally
 	{
 		try
 		{
 			con.close();
 		}
 		catch(Exception e)
 		{
 			%>
 			<jsp:include page="register.html"/> 
 			<% 	
 		}
 		
 	}
 	%>	
</body>
</html>