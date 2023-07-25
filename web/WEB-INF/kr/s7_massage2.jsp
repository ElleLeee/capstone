<%-- 
    Document   : accupuncture
    Created on : 2023. 6. 20, 오전 12:13:19
    Author     : User
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tai Yang Clinic</title>

        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/b0274adb94.js" crossorigin="anonymous"></script>
        <!--<p style ="background-image:url('src/img/main.png');">-->

        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Cinzel&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Manrope&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@300&family=Open+Sans:wght@300;400&display=swap" rel="stylesheet">



        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link href="https://www.flaticon.com/kr/free-icons/" title="스마일 아이콘"></a>


    <!--        Libraries Stylesheet -->  
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/services.css">
    <link rel="stylesheet" type="text/css" href="../css/global.css">


    <c:import url="../components/headers.jsp" />


</head>
<body>
    <!--<div class="gloabal_container">-->
    <!-- Services -->
    <div class="services_container">
        <div class="services_top_section">   
            <div class="servicesBg">
                <img src="../src/img/guasha1.jpg" alt="" />
            </div>           
            <div class ="services_top_wrap">
                <p>Services</p>
                <h1>괄사요법</h1>
                <button onclick="window.location.href = '/${language}/book'">Book Now</button>
            </div>
        </div>
        <div class="services_main_section">
            <div class ="services_main_top">
                <div class ="services_main_top_text">
                    <h2>
                        <strong>괄사요법</strong>이 무엇일까요?    
                    </h2>
                    <p>
                        괄사요법은 마사지 도구로 피부를 긁어 혈액순환을 돕는 대체요법으로, 
                        괄사요법은 짧거나 긴 스트로크로 피부를 긁어 연조직의 미세순환을 자극해 혈류량을 증가시키는 효과가 있습니다.
                    </p>
                </div>
            </div>
            <div class ="services_main_Info">
                <div class ="services_main_img">
                    <img src="../src/img/guasha2.jpg" alt="" />
                </div>
                <div class ="services_main_text">
                    <h3>괄사요법의 장점들</h3>
                    <ul>
                        <li class ="services_text_list">
                            <i class="fa-regular fa-circle-check"></i>
                            <span>혈액 순환 촉진</span>
                        </li>
                        <li class ="services_text_list">
                            <i class="fa-regular fa-circle-check"></i>
                            <span>주름 개선</span>
                        </li>
                        <li class ="services_text_list">
                            <i class="fa-regular fa-circle-check"></i>
                            <span>림프관 배액 촉진</span>
                        </li>
                        <li class ="services_text_list">
                            <i class="fa-regular fa-circle-check"></i>
                            <span>근육 이완</span>
                        </li>
                        


                    </ul>
                </div>

            </div>
        </div>
        <!--</div>-->
        <!-- Services Start -->
        <%@include file="../components/servicesList.jsp"%>
        <!-- Services End -->
    </div>


                            <!-- Footer Start -->
                            <footer>
                                <jsp:include page="../components/footer.jsp" />
                            </footer>

                            <!--<script src="js/bootstrap.bundle.min.js"></script>-->

                            </body>
                            </html>