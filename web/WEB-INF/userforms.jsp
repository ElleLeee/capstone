<%-- 
    Document   : history
    Created on : 2023. 6. 6, 오전 1:18:37
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tai Yang Clinic</title>

        <!--        <link rel="stylesheet" type="text/css" href="css/global.css">-->
        <!--<link rel="stylesheet" type="text/css" href="css/history.css">-->
        <script src="https://kit.fontawesome.com/b0274adb94.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Cinzel&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Manrope&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@300&family=Open+Sans:wght@300;400&display=swap" rel="stylesheet">

        <link rel="apple-touch-icon" sizes="57x57" href="src/img/favicon/apple-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="60x60" href="src/img/favicon/apple-icon-60x60.png">
        <link rel="apple-touch-icon" sizes="72x72" href="src/img/favicon/apple-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="76x76" href="src/img/favicon/apple-icon-76x76.png">
        <link rel="apple-touch-icon" sizes="114x114" href="src/img/favicon/apple-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="120x120" href="src/img/favicon/apple-icon-120x120.png">
        <link rel="apple-touch-icon" sizes="144x144" href="src/img/favicon/apple-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="152x152" href="src/img/favicon/apple-icon-152x152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="src/img/favicon/apple-icon-180x180.png">
        <link rel="icon" type="image/png" sizes="192x192"  href="src/img/favicon/android-icon-192x192.png">
        <link rel="icon" type="image/png" sizes="32x32" href="src/img/favicon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="src/img/favicon/favicon-96x96.png">
        <link rel="icon" type="image/png" sizes="16x16" href="src/img/favicon/favicon-16x16.png">
        <link rel="manifest" href="src/img/favicon/manifest.json">
        <meta name="msapplication-TileColor" content="#ffffff">
        <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
        <meta name="theme-color" content="#ffffff">

        <!--        Libraries Stylesheet -->  
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>   


        <link rel="stylesheet" type="text/css" href="css/global.css">
        <link rel="stylesheet" type="text/css" href="css/userForms.css">
        <c:import url="./components/headers.jsp" />
        <style>

        </style>
    </head>
    <body>
        <!--History Start-->
        <div class="gloabal_container">
            <div class="gloabal_top_section">
                <h1>VIEW FORMS</h1>
            </div>
            <div class="account_container">

                <div class="account_side">
                    <%@include file="./components/accountSidebar.jsp"%>
                </div>
                <div class="account_main">

                    <div class="form_wrapper">
                        <h4><i class="fa-solid fa-align-left"></i>Forms</h4>




                        <c:if test="${userForms eq null}">
                            <table>
                                <tr><th>You have no forms!</th></tr>
                            </table>
                        </c:if>
                        <c:if test="${userForms ne null}">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Form</th>
                                        <th>Date Added</th>
                                        <th>View</th>
                                        <th>Download</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${medicalforms}" var="mdform">
                                        <tr>
                                            <td>Medical</td>
                                            <td>${mdform.getTimeAdded()}</td>
                                            <td><button class="view-button" onclick="openPdfPopup('/viewForm?formId=${mdform.getId()}&form=1')">View</button></td>                                        
                                            <td> <a class="download-link" href="/downloadForm?formId=${mdform.getId()}&form=1&referer=${pageContext.request.requestURI}">Download</a></td>
                                        </tr>
                                    </c:forEach>
                                    <c:forEach items="${consentforms}" var="csform">
                                        <tr>
                                            <td>Consent</td>
                                            <td>${csform.getTimeAdded()}</td>
                                            <td><button class="view-button" onclick="openPdfPopup('/viewForm?formId=${csform.getId()}&form=2')">View</button></td>                                        
                                            <td> <a class="download-link" href="/downloadForm?formId=${csform.getId()}&form=1&referer=${pageContext.request.requestURI}">Download</a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                        <div id="pdfPopup" class="popup">
                            <div class="popup-content" id="popup-content">
                                <div class="pdf-container">
                                    <div id="pdfViewer" class="pdfViewer"></div>
                                </div>
                                <span class="popup-close" onclick="closePopup()">&times;</span>
                            </div>
                        </div>

                    </div>
                </div>  
            </div>  

        </div>

        <style>



            .popup {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.8); /* Adjust the transparency here */
                z-index: 9999;
                animation: 2s ease-in-out;
            }

            .popup-content {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                height: 100%;
            }

            .pdf-container {
                max-width: 90%;
                max-height: 90%;
                background-color: #fff; /* Set the background color for the PDF container */
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* Add a box shadow for styling */
            }

            .pdf-container #pdfViewer {
                display: flex;
                margin: auto;
                overflow-x: scroll;
            }
        </style>



        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.11.338/pdf.min.js"></script>
        <script src="js/vform.js"></script><!-- Vform has the exact same code, no need for new javascript file :P-->
        <footer>
            <jsp:include page="./components/footer.jsp" />
        </footer>
    </body>
</html>