<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <title>Login Admin</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">

    </head>
    <body>
        <!-- partial:index.partial.html -->
        <!DOCTYPE html>
    <html>
        <head>
            <title>Admin</title>
            <link rel="stylesheet" type="text/css" href="slide navbar style.css">
            <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
        </head>
        <body>
            <div class="main">  	
                <input type="checkbox" id="chk" aria-hidden="true">
                <p class="text-danger"></p>

                <div class="signup">
                    <form action="./adminlogin" method="post">
                        <label for="chk" aria-hidden="true">ADMIN SYSTEM </label>
                        <input type="text" name="adminname" placeholder="Admin name" required="">
                        <input type="password" name="adminpass" placeholder="Password" required="">
                        <button type="submit" value="Submit">Login</button>
                    </form>
                </div>
            </div>
        </body>
    </html>
    <!-- partial -->

</body>
</html>
