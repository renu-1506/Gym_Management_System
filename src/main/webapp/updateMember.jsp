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

String id = request.getParameter("id");

String memberName = "";
String mobileNumber = "";
String planType = "";
int fees = 0;

try {

    Class.forName("com.mysql.cj.jdbc.Driver");

    conn = DriverManager.getConnection(url, user, pass);

    /*
     * UPDATE OPERATION
     */

    if ("POST".equalsIgnoreCase(request.getMethod())) {

        memberName = request.getParameter("mname");
        mobileNumber = request.getParameter("mnumber");
        planType = request.getParameter("planType");
        fees = Integer.parseInt(request.getParameter("fees"));

        String updateQuery =
            "UPDATE gym_member SET member_name=?, mobile_number=?, plan_type=?, fees_paid=? WHERE id=?";

        pstmt = conn.prepareStatement(updateQuery);

        pstmt.setString(1, memberName);
        pstmt.setString(2, mobileNumber);
        pstmt.setString(3, planType);
        pstmt.setInt(4, fees);
        pstmt.setInt(5, Integer.parseInt(id));

        int row = pstmt.executeUpdate();

        if (row > 0) {

            response.sendRedirect(
                "showDetails.jsp?msg=Member+Updated+Successfully"
            );

            return;
        }
    }

    /*
     * GET EXISTING MEMBER DATA
     */

    String selectQuery =
        "SELECT * FROM gym_member WHERE id=?";

    pstmt = conn.prepareStatement(selectQuery);

    pstmt.setInt(1, Integer.parseInt(id));

    rs = pstmt.executeQuery();

    if (rs.next()) {

        memberName = rs.getString("member_name");
        mobileNumber = rs.getString("mobile_number");
        planType = rs.getString("plan_type");
        fees = rs.getInt("fees_paid");

    }

%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Update Member</title>

<style>

body {
    background-color: black;
    color: white;
    font-family: Arial, sans-serif;
    margin: 0;
}

.form-box {
    width: 450px;
    margin: 70px auto;
    padding: 35px 40px;
    background-color: #1a1a1a;
    border: 2px solid orange;
    border-radius: 12px;
    box-shadow: 0 0 20px rgba(255,165,0,0.3);
}

h1 {
    text-align: center;
    color: orange;
    margin-bottom: 30px;
}

.form-group {
    margin-bottom: 20px;
}

label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
}

input,
select {
    width: 100%;
    padding: 11px;
    box-sizing: border-box;
    border-radius: 6px;
    border: 1px solid gray;
    background-color: white;
    color: black;
    font-size: 15px;
}

input:focus,
select:focus {
    outline: none;
    border: 2px solid orange;
}

.update-btn {
    width: 100%;
    padding: 13px;
    background-color: orange;
    color: black;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
}

.update-btn:hover {
    background-color: white;
}

.back-btn {
    display: block;
    text-align: center;
    margin-top: 20px;
    color: orange;
    text-decoration: none;
    font-weight: bold;
}

.back-btn:hover {
    color: white;
}

</style>

</head>

<body>

<div class="form-box">

    <h1>✏ Update Member</h1>

    <form action="updateMember.jsp?id=<%=id%>" method="post">

        <div class="form-group">

            <label>Member Name</label>

            <input
                type="text"
                name="mname"
                value="<%=memberName%>"
                required>

        </div>

        <div class="form-group">

            <label>Mobile Number</label>

            <input
                type="tel"
                name="mnumber"
                value="<%=mobileNumber%>"
                maxlength="10"
                pattern="[0-9]{10}"
                required>

        </div>

        <div class="form-group">

            <label>Membership Plan</label>

            <select name="planType" required>

                <option value="">Select Plan</option>

                <option value="Monthly Plan"
                    <%= "Monthly Plan".equals(planType) ? "selected" : "" %>>
                    Monthly Plan
                </option>

                <option value="Annual Plan"
                    <%= "Annual Plan".equals(planType) ? "selected" : "" %>>
                    Annual Plan
                </option>

                <option value="VIP Personal Training"
                    <%= "VIP Personal Training".equals(planType) ? "selected" : "" %>>
                    VIP Personal Training
                </option>

            </select>

        </div>

        <div class="form-group">

            <label>Fees Paid 💸</label>

            <input
                type="number"
                name="fees"
                value="<%=fees%>"
                min="0"
                required>

        </div>

        <button type="submit" class="update-btn">
            💾 Update Member
        </button>

    </form>

    <a href="showDetails.jsp" class="back-btn">
        ← Back to Members
    </a>

</div>

</body>

</html>

<%

} catch(Exception e) {

    out.println(
        "<h2 style='color:red;text-align:center;'>Error: "
        + e.getMessage()
        + "</h2>"
    );

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