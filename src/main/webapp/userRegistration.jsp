<%@ page import="java.sql.*"%>
<%
    String username = request.getParameter("username");    
    String password = request.getParameter("password");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginwebapp","root", "root");

    String query = "INSERT INTO USER1 (first_name, last_name, email, username, password)"
			+ "VALUES ('"+firstName+"','"+lastName+"','"+email+"','"+username+"','"+password+"')";

    Statement st = con.createStatement();
    int i = st.executeUpdate(query);
    if (i > 0) {
        response.sendRedirect("welcome.jsp");
       
    } else {
        response.sendRedirect("index.jsp");
    }
%>
