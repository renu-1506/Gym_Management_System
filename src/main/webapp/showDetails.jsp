<%@page import="java.sql.ResultSet"%>
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
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, pass);

        pstmt = conn.prepareStatement("SELECT * FROM gym_member");
        rs = pstmt.executeQuery();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gym Members</title>

<style>

body {
    background-color: black;
    color: white;
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 30px;
}

.container {
    width: 90%;
    margin: auto;
}

h1 {
    text-align: center;
    color: orange;
    margin-bottom: 30px;
}

.table-box {
    background-color: #1a1a1a;
    padding: 25px;
    border: 2px solid orange;
    border-radius: 12px;
    box-shadow: 0 0 15px rgba(255, 165, 0, 0.3);
}

table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background-color: orange;
    color: black;
    padding: 14px;
    border: 1px solid black;
}

td {
    padding: 12px;
    text-align: center;
    border: 1px solid #555;
}

tr:hover {
    background-color: #292929;
}

.update-btn {
    display: inline-block;
    background-color: #2196F3;
    color: white;
    padding: 8px 14px;
    text-decoration: none;
    border-radius: 5px;
    font-weight: bold;
}

.update-btn:hover {
    background-color: #0b7dda;
}

.delete-btn {
    display: inline-block;
    background-color: red;
    color: white;
    padding: 8px 14px;
    text-decoration: none;
    border-radius: 5px;
    font-weight: bold;
}

.delete-btn:hover {
    background-color: #b30000;
}

.back-btn {
    display: block;
    width: fit-content;
    margin: 25px auto 0;
    padding: 12px 25px;
    background-color: orange;
    color: black;
    text-decoration: none;
    border-radius: 6px;
    font-weight: bold;
}

.back-btn:hover {
    background-color: white;
}

</style>

</head>

<body>

<div class="container">

    <h1>🏋️ Gym Members Information</h1>

    <div class="table-box">

        <table>

            <thead>
                <tr>
                    <th>ID</th>
                    <th>Member Name</th>
                    <th>Mobile Number</th>
                    <th>Plan</th>
                    <th>Fees Paid</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>

            <tbody>

<%
    while(rs.next()) {
%>

                <tr>

                    <td>
                        <%= rs.getInt("id") %>
                    </td>

                    <td>
                        <%= rs.getString("member_name") %>
                    </td>

                    <td>
                        <%= rs.getString("mobile_number") %>
                    </td>

                    <td>
                        <%= rs.getString("plan_type") %>
                    </td>

                    <td>
                        ₹ <%= rs.getInt("fees_paid") %>
                    </td>

                    <td>
                        <a
                            href="updateMember.jsp?id=<%= rs.getInt("id") %>"
                            class="update-btn">
                            ✏ Update
                        </a>
                    </td>

                    <td>
                        <a
                            href="deleteMember.jsp?id=<%= rs.getInt("id") %>"
                            class="delete-btn"
                            onclick="return confirm('Are you sure you want to delete this member?');">
                            🗑 Delete
                        </a>
                    </td>

                </tr>

<%
    }
%>

            </tbody>

        </table>

    </div>

    <a href="gym_portal.jsp" class="back-btn">
        ← Back to Portal
    </a>

</div>

</body>
</html>

<%
    } catch(Exception e) {
        out.println("<h2 style='color:red;text-align:center;'>Error: "
                    + e.getMessage() + "</h2>");
        e.printStackTrace();

    } finally {

        try {
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
%>