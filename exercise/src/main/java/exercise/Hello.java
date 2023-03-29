package exercise;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Hello
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/Hello" })
public class Hello extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Hello() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter print = response.getWriter();
		
		String name= request.getParameter("username");
		String age= request.getParameter("age");
		
		print.println("<!DOCTYPE html>");
		print.println("<html>");
		print.println("<head>");
		print.println("<meta charset=\"ISO-8859-1\">");
		print.println("<title>Insert title here </title>");
		print.println("</head>");
		print.println("<body>");
		print.println("<h1>Your account is registered as</h1>");
		print.println("<h1> Name: "+ name + "</h1>");
		print.println("<h1>Age: "+ age + "</h1>");
		print.println("</body");
		print.println("");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Insert into table
		response.setContentType("type/html");
		PrintWriter print = response.getWriter();
		String name = request.getParameter("username");
		String age = request.getParameter("age");

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/practise";
			String user = "root";
			String pass = "";
			Connection con = DriverManager.getConnection(url, user, pass);
			
			String query = "Insert into testing(name,age) value(?,?)";
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1,  name);
			st.setString(2, age);
			int result = st.executeUpdate();
			if(result > 0) 
			{
				print.println("Data Inserted");
			}
			else
			{
				print.println("Data is not Inserted");
				
			}
			
		}
		catch(SQLException | ClassNotFoundException ex)
		{
		    print.println(ex.getMessage());
			ex.printStackTrace();
		}
		doGet(request, response);
	}

}
