<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Universal Fitness Club</title>

 <style>

        body {
            background-color: black;
            font-family: Arial, sans-serif;
            color: white;
            margin: 0;
            padding: 0;
        }

        .portal-box {
            width: 500px;
            margin: 150px auto;
            padding: 40px;
            text-align: center;

            border: 2px solid orange;
            border-radius: 10px;

            background-color: #1a1a1a;
        }

        .portal-box h1 {
            color: orange;
            margin-bottom: 30px;
        }

        .portal-box p {
            color: white;
            margin-bottom: 25px;
        }

        .btn {
            display: inline-block;
            padding: 12px 30px;

            background-color: orange;
            color: black;

            text-decoration: none;
            font-weight: bold;

            border-radius: 5px;
            margin: 5px;
        }

        .btn:hover {
            background-color: white;
            color: black;
        }

        .message {
            width:40%;
            background:rgba(100, 180, 6, 0.2);
            color:#fca5a5;
            text-align: center;
            border:1px solid black;
            border-radius:8px;
            margin-bottom:20;
            margin-left:auto;
            margin-right:auto;
            padding:2px;
            font-size:1rem;
            font-weight:500;
            box-shadow:0 4px 12px rgba(0, 0, 0, 0.2);
            animation:fadeIn 0.3s ease-in-out;
        }

    </style>

</head>
<body>

     <%
        if(request.getParameter("msg") != null) {
    %>

        <div class="message">

            <h2>
                <%= request.getParameter("msg") %>
            </h2>

        </div>

    <%
        }
    %>


    <div class="portal-box">

        <h1>
            🏋️ Universal Fitness
            <br>
            Management Portal
        </h1>


        <p>
            Welcome to Universal Fitness Club
        </p>


        <a href="register.jsp" class="btn">
            Register
        </a>


        <a href="showDetails.jsp" class="btn">
            Show Details
        </a>
        
        <a href="FeeStructure.jsp" class="btn">
            Show Fee Structure
        </a>
        

    </div>

</body>
</html>