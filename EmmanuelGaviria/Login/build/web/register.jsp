<%-- 
    Document   : register
    Created on : Mar 30, 2016, 3:47:02 PM
    Author     : emmanuel.gaviria
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.microsoft.sqlserver.jdbc.SQLServerException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String register = request.getParameter("register");

            if (register != null && request.getMethod().equalsIgnoreCase("POST")) {
                String i = request.getParameter("identification");
                String f = request.getParameter("fullname");
                String e = request.getParameter("email");
                String p = request.getParameter("password");

                try {
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    Connection con = DriverManager.getConnection("jdbc:sqlserver://PRACT-EMMANUELG\\SQLEXPRESS:1433;databaseName=ICommerce;user=emmanuel123;password=1234");

                    PreparedStatement ps = con.prepareStatement("{call RegisterUserLogin(?,?,?,?)}");
                    ps.setString(1, i);
                    ps.setString(2, f);
                    ps.setString(3, e);
                    ps.setString(4, p);
                    boolean c = ps.execute();

                    if (c == false) {
                        response.sendRedirect("loginuser.jsp?msg=Thank_You_for_registering!");   
                    } else {
                        response.sendRedirect("registeruser.jsp?msg=Insertion_Failed!!_Please_try_again!!! ");
                    }
                    con.close();
                } catch (Exception ex) {
                    out.println(ex);
                } finally {
                }
            }
        %>
    </body>
</html>
