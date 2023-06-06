<%-- 
    Document   : profile
    Created on : 2023. 6. 6, 오전 1:16:59
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tai Yang Clinic</title>
        <link rel="stylesheet" type="text/css" href="css/global.css">
        <link rel="stylesheet" type="text/css" href="css/profile.css">
          <link rel="stylesheet" type="text/css" href="css/history.css">
        <script src="https://kit.fontawesome.com/b0274adb94.js" crossorigin="anonymous"></script>
        
        <c:import url="./components/header.jsp" />
    </head>
    <body>
        <!--Profile Start-->
    <div class="gloabal_container">
        <div class="gloabal_top_section">
            <h1>MY ACCOUNT</h1>       
        </div>
         <div class="account_container">           
            <div class="account_side">
             <%@include file="./components/accountSidebar.jsp"%>
            </div>
            <div class="account_main">
                <div class="profile_wrapper">
                    <div class="profile">
                        <h2>My Profile</h2>                        
                    </div>
                    
                    
                </div>
            </div>
        </div>  
   
    </div>
    </body>
    
     <footer>
        <jsp:include page="./components/footer.jsp" />
    </footer>
</html>
