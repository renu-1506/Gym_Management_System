<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gym Fees Structure</title>

<style>
    body {
        background-color: black;
        color: white;
        font-family: Arial, sans-serif;
        text-align: center;
    }

    h1 {
        color: orange;
        margin-bottom: 30px;
    }

    table {
        width: 70%;
        margin: 0 auto;
        border-collapse: collapse;
        background-color: #1a1a1a;
    }

    th {
        background-color: orange;
        color: black;
        padding: 15px;
        font-size: 18px;
        border: 1px solid white;
    }

    td {
        padding: 14px;
        border: 1px solid white;
        font-size: 16px;
    }

    tr:hover {
        background-color: #333;
    }

    td:first-child {
        color: orange;
        font-weight: bold;
    }
    
    button{
        width:10%;
        background-color:green;
        padding:15px;
        
    }
</style>

</head>
<body>
       <h1>🏋️‍♂️ Universal Gym Fees Structure 💸🕊️ </h1>
       <table border=2>
            <thead>
                 <tr>
                    <th></th>
                    <th>Basic</th>
                    <th>Platinum</th>
                    <th>Premium</th>
                 </tr>
            </thead>
            <tbody>
                 <tr>
                    <td>Monthly</td>
                    <td>1500</td>
                    <td>5000</td>
                    <td>7000</td>
                 </tr>
                 
                 <tr>
                    <td>Quaterly</td>
                    <td>4500</td>
                    <td>18000</td>
                    <td>25000</td>
                 </tr>
                 
                 <tr>
                    <td>Half Yearly</td>
                    <td>9000</td>
                    <td>27000</td>
                    <td>32000</td>
                 </tr>
                 
                 <tr>
                    <td>Yearly</td>
                    <td>15000</td>
                    <td>56000</td>
                    <td>80000</td>
                 </tr>
            </tbody>
       </table>
       <br><br>
       <button><a href="gym_portal.jsp">Back to Home</a></button>
       
</body>
</html>