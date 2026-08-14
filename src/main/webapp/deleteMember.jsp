<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

String user = "root";
String pass = "YOUR_MYSQL_PASSWORD";
String url = "jdbc:mysql://localhost:3306/gym_management_system";

Connection conn = null;
PreparedStatement pstmt = null;

String id = request.getParameter("id");

try {

    Class.forName("com.mysql.cj.jdbc.Driver");

    conn = DriverManager.getConnection(url, user, pass);

    String deleteQuery =
        "DELETE FROM gym_member WHERE id=?";

    pstmt = conn.prepareStatement(deleteQuery);

    pstmt.setInt(1, Integer.parseInt(id));

    int row = pstmt.executeUpdate();

    if(row > 0) {

        response.sendRedirect(
            "showDetails.jsp?msg=Member+Deleted+Successfully"
        );

    } else {

        response.sendRedirect(
            "showDetails.jsp?msg=Member+Not+Found"
        );

    }

} catch(Exception e) {

    out.println(
        "<h2 style='color:red;text-align:center;'>Error: "
        + e.getMessage()
        + "</h2>"
    );

    e.printStackTrace();

} finally {

    try {

        if(pstmt != null)
            pstmt.close();

        if(conn != null)
            conn.close();

    } catch(Exception e) {

        e.printStackTrace();

    }

}

%>