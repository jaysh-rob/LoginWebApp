<%@ page import="java.sql.*"%>
<%
    String username = request.getParameter("username");    
    String password = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginwebapp",
            "root", "root");
    Statement st = con.createStatement();
    String query = "SELECT username,password from USER1 where username='" + username + "' and password='" +password + "'";
    ResultSet rs;
    rs = st.executeQuery(query);

    if (rs.next()) {
        session.setAttribute("username", username);
        response.sendRedirect("GIT.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>
