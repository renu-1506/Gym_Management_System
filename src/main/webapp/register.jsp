<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%!
      
      private Connection conn;
      
      public void jspInit(){
    	  
    	  String user = "root";
          String pass = "YOUR_MYSQL_PASSWORD";
          String url = "jdbc:mysql://localhost:3306/gym_management_system";
          
            try{
    	        Class.forName("com.mysql.cj.jdbc.Driver");
    	        conn = DriverManager.getConnection(url,user,pass);
           
            } catch(Exception e){
            	   e.getMessage();
            	
            }
      }
      
      public void jspDestroy(){
    	        try{
    	        conn.close();
    	        } catch(Exception e){
    	        	   e.getMessage();
    	        }
      }
      
    %>
    
    <%
       //1st Implicit Object -> Stores the total registrations through out applications.
       if(application.getAttribute("totalRegistrations") == null){
    	       application.setAttribute("totalRegistrations", 0);
    	   
       }
       
       //2nd Implicit Object -> Stores the logged in user info
       if(session.getAttribute("user") == null){
    	      session.setAttribute("user", "ADMIN");
       }
       
       PreparedStatement pstmt = conn.prepareStatement("insert into gym_member"+
    	       "(member_name,mobile_number,plan_type,fees_paid)values(?,?,?,?)");
       
       try{
       //3rd Implicit Object -> Reads data from the form
       String memberName = request.getParameter("mname");
       String planType = request.getParameter("planType");
       Integer number = 000000;
       Integer fees = 0;
       if(memberName!=null && planType!=null){
    	      number = Integer.parseInt(request.getParameter("mnumber"));
    	      fees = Integer.parseInt(request.getParameter("fees"));
             
       pstmt.setString(1, memberName);
       pstmt.setInt(2, number);
       pstmt.setString(3, planType);
       pstmt.setInt(4, fees);
       int row = pstmt.executeUpdate();
       
       if(row>0){
    	      int registrations = (int)application.getAttribute("totalRegistrations");
    	      application.setAttribute("totalRegistrations", registrations+1);
    	      
    	      out.println("Record Saved");
    	      response.sendRedirect("gym_portal.jsp?msg=Member+Registered+Successfully");
    	   }
      
       }
     }
    	 finally{
    	      pstmt.close();
     }
    %>
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Universal Fitness Club</title>

 <style>

        body {

            background-color: black;

            color: white;

            font-family: Arial, sans-serif;

            margin: 0;

            padding: 0;

        }


        .form-box {

            width: 450px;

            margin: 70px auto;

            padding: 30px 40px;

            background-color: #1a1a1a;

            border: 2px solid orange;

            border-radius: 10px;

        }


        .form-box h1 {

            text-align: center;

            color: orange;

            margin-bottom: 30px;

        }


        .user-info {

            text-align: center;

            margin-bottom: 25px;

            color: white;

        }


        .user-info strong {

            color: orange;

        }


        .form-group {

            margin-bottom: 18px;

        }


        .form-group label {

            display: block;

            margin-bottom: 7px;

            color: white;

            font-weight: bold;

        }


        .form-group input,

        .form-group select {

            width: 100%;

            padding: 10px;

            box-sizing: border-box;

            border: 1px solid gray;

            border-radius: 5px;

            background-color: white;

            color: black;

            font-size: 15px;

        }


        .form-group input:focus,

        .form-group select:focus {

            border: 2px solid orange;

            outline: none;

        }


        .submit-btn {

            width: 100%;

            padding: 12px;

            background-color: orange;

            color: black;

            border: none;

            border-radius: 5px;

            font-size: 16px;

            font-weight: bold;

            cursor: pointer;

        }


        .submit-btn:hover {

            background-color: white;

        }


        .back-btn {

            display: block;

            width: fit-content;

            margin: 20px auto 0;

            color: orange;

            text-decoration: none;

        }


        .back-btn:hover {

            color: white;

        }


        .error {

            text-align: center;

            color: red;

            font-weight: bold;

        }

    </style>

</head>
<body>

      <div class="form-box">


        <h1>
            🏋️ Member Registration
        </h1>


        <div class="user-info">

            Logged In User:
            <strong>
                <%= session.getAttribute("user") %>
            </strong>

            <br><br>

            Total Registrations:
            <strong>
                <%= application.getAttribute("totalRegistrations") %>
            </strong>

        </div>


        <form
            action="register.jsp"
            method="post">


            <div class="form-group">

                <label for="mname">
                    Member Name:
                </label>

                <input
                    type="text"
                    id="mname"
                    name="mname"
                    placeholder="Enter member name"
                    required>

            </div>


            <div class="form-group">

                <label for="mnumber">
                    Mobile Number:
                </label>

                <input
                    type="tel"
                    id="mnumber"
                    name="mnumber"
                    placeholder="Enter mobile number"
                    maxlength="10"
                    pattern="[0-9]{10}"
                    required>

            </div>


            <div class="form-group">

                <label for="planType">
                    Membership Plan:
                </label>

                <select
                    id="planType"
                    name="planType"
                    required>

                    <option value="">
                        Select Plan
                    </option>

                    <option value="Monthly Plan">
                        Monthly Plan
                    </option>

                    <option value="Annual Plan">
                        Annual Plan
                    </option>

                    <option value="VIP Personal Training">
                        VIP Personal Training
                    </option>

                </select>

            </div>


            <div class="form-group">

                <label for="fees">
                    Fees Paid 💸:
                </label>

                <input
                    type="number"
                    id="fees"
                    name="fees"
                    placeholder="Enter fees"
                    required>

            </div>


            <button
                type="submit"
                class="submit-btn">

                Register Member

            </button>


        </form>


        <a
            href="gym_portal.jsp"
            class="back-btn">

            ← Back to Portal

        </a>


    </div>

</body>
</html>