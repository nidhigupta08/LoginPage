<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Login JSP</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
        
        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        .container h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        
        .container form {
            display: flex;
            flex-direction: column;
        }
        
        .container label {
            margin-bottom: 10px;
        }
        
        .container input[type="text"],
        .container input[type="password"] {
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        
        .container input[type="submit"] {
            padding: 10px 15px;
            background-color: #4caf50;
            color: #ffffff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        
        .container input[type="submit"]:hover {
            background-color: #45a049;
        }
        
        .error-message {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Login Page</h1>
  
        <%-- Check if the user is already logged in --%>
        <% if (session.getAttribute("username") != null) { %>
            <p>Welcome, <%= session.getAttribute("username") %>!</p>
            <form method="POST" action="Logout.jsp">
                <input type="submit" value="Logout">
            </form>
        <% } else { %>
            <%-- Display the login form --%>
            <form method="POST" action="Login.jsp">
                <label for="username">Username:</label>
                <input type="text" name="username" id="username"><br>
                <label for="password">Password:</label>
                <input type="password" name="password" id="password"><br>
                <input type="submit" value="Login">
            </form>
            
            <%-- Process the login form submission --%>
            <% 
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            // Simulating authentication logic
            if (username != null && password != null && username.equals("admin") && password.equals("password")) {
                // Store the username in a session attribute
                session.setAttribute("username", username);
                response.sendRedirect("Login.jsp");
            } else if (username != null || password != null) {
                out.println("<p class='error-message'>Invalid username or password.</p>");
            }
            %>
        <% } %>
    </div>
</body>
</html>