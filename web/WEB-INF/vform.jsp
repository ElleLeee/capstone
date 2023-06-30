<%@page import="java.util.List"%>
<%@page import="models.User"%>
<%@page import="models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
        <title>Tai Yang Clinic</title>

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!--        <link rel="stylesheet" href="css/aform.css">-->
        <!--        <script src="js/ausers.js"></script>-->

        <!--google fonts -->

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

        <!--google material icon-->
        <link href="https://fonts.googleapis.com/css2?family=Material+Icons"rel="stylesheet">

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
            }
            
            .pageNumbers {
                margin-top: 10px;
                text-align: center;
            }
            .pageNumber {
                display: inline-block;
                margin: 5px;
                padding: 8px 12px;
                background-color: #eaeaea;
                color: #333;
                text-decoration: none;
                border-radius: 4px;
            }
            .pageNumber:hover {
                background-color: #ccc;
            }
            
            
            .confirmPopup{
                display: none;
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


            .show-all-users {
                color: #ececec;
                background-color: #0B486B;
                padding: 5px 10px;
                border-radius: 4px;
                text-decoration: none;


            }

            .show-all-users:hover {
                background-color: #076e95;
            }





            body,html{
                line-height:1.8;
                font-family:'Poppins',sans-serif;
                color:#555e58;
                text-transform:capitalize;
                font-weight:400;
                margin:0px;
                padding:0px;
            }


            /*==========================================================
            material-icon font-style
            ================================*/




            h1,h2,h3,h4,h5,h6,.h1 {
                font-weight:400;

            }

            p{
                font-size:15px;
                margin:12px 0 0;
                line-height:24px;
            }

            a{
                color:#333;
                font-weight:400;

            }


            button:focus{
                box-shadow:none;
                outline:none;
                border:none;
            }


            button{
                cursor:pointer;
            }

            ul,ol{
                padding:0px;
                margin:0px;
                list-style:none;
            }

            a,a:hover,a:focus{
                color:#333;
                text-decoration:none;
                transition:all 0.3s;
            }


            .wrapper{
                position:relative;
                width:100%;
                overflow:auto;	
            }

            /*=========sidebar---design------*/

            #sidebar{
                position:fixed;
                height:100%!important;
                top:0;
                left:0;
                bottom:0;
                z-index:11;
                width:260px;
                overflow:auto;
                transition:all 0.3s;
                background-color:#fff;
                box-shadow:0 0 30px 0 rgba(200 200 200 / 20%);
            }


            @media only screen and (min-width:992px){
                #sidebar.active{
                    left:-260px;
                    height:100%!important;
                    position:absolute!important;
                    overflow:visible!important;
                    top:0;
                    z-index:666;
                    float:left!important;
                    bottom:0!important;
                }

                #content{
                    width:calc(100% - 260px);
                    position:relative;
                    float:right;
                    transition:all 0.3s;
                }

                #content.active{
                    width:100%;
                }

            }


            #sidebar::-webkit-scrollbar{
                width:5px;
                border-radius:10px;
                background-color:#eee;
                display:none;
            }

            #sidebar::-webkit-scrollbar-thumbs{
                width:5px;
                border-radius:10px;
                background-color:#333;
                display:none;
            }

            #sidebar:hover::-webkit-scrollbar-thumbs{
                display:block;
            }

            #sidebar:hover::-webkit-scrollbar{
                display:block;
            }

            #sidebar .sidebar-header{
                padding:20px;
                background-color:#fff;
                border-bottom:1px solid #eee;
            }

            .sidebar-header h3{
                color:#333;
                font-size:17px;
                margin:0px;
                text-transform:uppercase;
                transition:all 0.5s ease;
                font-weight:600;
            }

            .sidebar-header h3 img{
                width:45px;
                margin-right:10px;
            }

            #sidebar ul li{
                padding:2px 0px;
            }

            #sidebar ul li.active> a{
                color:#4c7cf3;
                background-color:#DBE5FD;
            }


            #sidebar ul li.active> a i{
                color:#4c7cf3;
            }



            #sidebar ul li a:hover{
                color:#4c7cf3;
                background-color:#DBE5FD;
            }


            .dropdown-toggle::after{
                position:absolute;
                right:22px;
                top:18px;
                color:#777777;
            }

            #sidebar ul li.dropdown{
                position:sticky;
            }


            #sidebar ul.component{
                padding:20px 0px;  
            }

            #sidebar ul li a{
                padding:5px 10px 5px 20px;
                line-height:30px;
                font-size:15px;
                position:relative;
                font-weight:400;
                display:block;
                color:#777777;
                text-transform:capitalize;
            }

            #sidebar ul li a i{
                position:relative;
                margin-right:10px;
                top:6px;
            }


            /*=========sidebar---design- end-----*/

            input[type="search"]{
                background-color:#4a5263;
                color:#fff;
                padding-left:20px;
                border:none;
                border-radius:50px 0px 0px 50px;
            }


            /*========main-content- navbardesign -start-----*/

            #content{
                position:relative;
                transition:all 0.5s;
                background-attachment:#f9fafc;
            }


            .top-navbar{
                width:100%;
                z-index:9;
                position:relative;
                padding:15px 30px;
                background-color:#353b48;
            }

            .xd-topbar{
                width:100%;
                position:relative;
            }


            .input-group-append{
                margin-left:-1px;
            }


            .xp-searchbar .btn{
                background-color:#4a5263;
                color:#fff;
                font-weight:600;
                font-size:16px;
                border-radius:0 50px 50px 0;
                padding:4px  15px;
            }


            .xp-breadcrumbbar .page-title{
                font-size:20px;
                color:#fff;
                margin-bottom:0;
                margin-top:0;
            }

            .breadcrumb{
                display:inline-flex;
                background-color:transparent;
                margin:0;
                padding:10px 0 0;
            }

            .breadcrumb .breadcrumb-item a{
                color:#777777;
            }

            .breadcrumb-item.active{
                color:#6c757d;
            }


            .breadcrumb-item+.breadcrumb-item{
                padding-left:.5rem;
            }

            .main-content{
                padding:30px 30px 0px 30px;
            }

            .navbar{
                background-color:#353B48;
                color:#fff;
            }

            .navbar-brand{
                color:#fff;
            }

            .navbar button{
                background-color:transparent;
                border:none;		   
            }

            .navbar button span{
                color:#fff;
            }

            .xp-menubar{
                border-radius:50%;
                width:45px;
                height:45px;
                line-height:45px;
                text-align:center;
                margin-right:20px;
                border:none;
                color:#fff;
                cursor:pointer;
                background-color:rgba(0,0,0,0.09);	   
            }


            .xp-menubar span{
                margin:9px;
                padding:0px;
                transform:rotate(90deg);
            }

            .navbar-nav > li.active{
                color:#fff;
                border-radius:4px;
                background-color:rgba(0,0,0,0.08);
            }
            .navbar-nav > li > a{
                color:#fff;
            }

            .navbar .notification{
                position:absolute;
                top:2px;
                right:3px;
                display:block;
                font-size:9px;
                border:0;
                background-color:#2bcd72;
                min-width:15px;
                text-align:center;
                padding:1px 5px;
                height:15px;
                border-radius:2px;
                line-height:14px;
            }

            @media (max-width:768px){
                .xp-searchbar{
                    margin-top:20px;
                }
            }

            .navbar-nav > li.show .dropdown-menu{
                transform:translate3d(0,0,0);
                opacity:1;
                display:block;
                visibility:visible;
            }

            .dropdown-menu{
                border:0;
                box-shadow:0 2px 5px 0 rgba(0 0 0 / 26%);
                transform:translate3d(0, -20px ,0);
                visibility:hidden;
                position:absolute!important;
                transition:all 150ms linear;
                display:block;
                min-width:15rem;
                right:0;
                left:auto;
                opacity:0;
            }

            .small-menu{
                min-width:10rem;
            }


            .dropdown-menu li > a{
                font-size:13px;
                padding:10px 20px;
                margin:0 5px;
                border-radius:2px;
                font-weight:400;
                transition:all 150ms linear;
            }


            .dropdown-menu li > a .material-icons{
                position:relative;
                top:3px;
                color:#777;
                margin-right:6px;
                font-size:16px;

            }

            .navbar-nav > .active > a:focus{
                color:#fff;
                background-color:rgba(0,0,0,0.08);
            }
            .navbar-nav li a{
                position:relative;
                display:block;
                padding:4px 10px!important;
            }

            .nav-item .nav-link .material-icons{
                position:relative;
                top:10px;
                font-size:19px;
            }

            .xp-user-live{
                position:absolute;
                bottom:5px;
                right:9px;
                width:12px;
                height:12px;
                border-radius:50%;
                border:2px solid #353b48;
                background-color:#4c7cf3;
            }

            /*---navbardesign -end-----*/



            /*--table design start----*/ 

            .table-wrapper {
                background-color: #fff;
                /* padding: 20px 25px; */
                margin:6px 0px 40px 0px;
                width: 100%;
                overflow: auto;
                border-radius: 3px;
                box-shadow: 0 1px 1px rgb(0 0 0 / 5%);
            }

            .table-title{
                background:#353b48;
                color:#fff;
                position:sticky;
                top:0;
                width:100%;
                left:0;
                padding:10px 30px;
                border-radius:0px 0px 0 0;
            }

            .table-title h2{
                margin:5px 0  0;
                font-size:17px;
            }

            .table-title .btn-group{
                float:right;
            }
            .table-title .btn{
                color:#fff;
                float:right;
                font-size:13px;
                border:none;
                min-width:50px;
                border-radius:2px;
                border:none;
                outline:none!important;
                margin-left:10px;
            }
            .table-title .btn i{
                float:left;
                font-size:21px;
                margin-right:5px;
            }

            .table-title .btn span{
                float:left;
                margin-top:2px;
            }

            table.table tr th, table.table tr td{
                border-color:#e9e9e9;
                padding:8px 15px;
                font-size:14px;
                font-weight: 400;
                vertical-align:middle;
            }

            /*                        table.table tr th:first-child{
            width:200px;
            }*/

            /*            table.table tr th:last-child{
            width:200px;
            }*/

            table.table-stripped tbody tr:nth-of-type(odd){
                background-color:#fcfcfc;
            }

            table.table-stripped.table-hover tbody tr:hover{
                background-color:#f5f5f5;
            }

            table.table th i{
                font-size:17px;
                margin: 6px 5px;
                cursor:pointer;
            }

            table.table td a{
                font-weight:bold;
                color:#566787;
                display:inline-block;
                text-decoration:none;
                outline:none!important;
            }
            table.table td a:hover{
                color:#2196F3;
            }



            table.table td  i{
                font-size:19px;
            }

            table.table .avatar{
                border-radius:50%;
                vertical-align:middle;
                margin-right:10px;
            }



            .hint-text{
                float:left;
                margin-top:10px;
                font-size:13px;
            }

            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }	
            .pagination li.active a, .pagination li.active a.page-link {
                background: #03A9F4;
            }
            .pagination li.active a:hover {        
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }


            /*--table design end----*/ 




            /*-------footer design start------*/
            footer{
                background-color:#353b48;
                color:#fff;
                text-align:center;
                padding:10px 30px;
                position:relative;
                width:100%;
            }

            /*-------footer design end------*/
            #sidebar.show-nav, .body-overlay.show-nav{
                transform:translatex(0%);
                opacity:1;
                display:block;
                visibility:visible;
                z-index:15;
            }


            /*========main-content- navbardesign -end-----*/


            @media only screen and (max-width:992px){
                #sidebar{
                    position:fixed;
                    top:0;
                    bottom:0;
                    z-index:10;
                    width:260px;
                    transform:translatex(-100%);
                    transition:all 150ms linear;
                    box-shadow:none!important;
                }

                .body-overlay{
                    position:fixed;
                    top:0;
                    left:0;
                    width:100%;
                    height:100%;
                    display:none;
                    visibility:hidden;
                    opacity:0;
                    z-index:3;
                    transition:all 150ms linear;
                    background-color:rgba(0,0,0,0.5);
                }


            }

        </style>

    </head>
    <body>


        <div class="wrapper">

            <div class="body-overlay"></div>

            <!-- Sidebar  -->
            <nav id="sidebar">

                <div class="sidebar-header">
                    <h3><img src="logo" class="img-fluid"/><span>Tai Yang Clinic</span></h3>
                </div>
                <ul class="list-unstyled components">
                    <li  class="active">
                        <a href="admin" class="dashboard"><i class="material-icons">dashboard</i>
                            <span>Today</span></a>
                    </li>


                    <li class="dropdown">
                        <a href="ausers" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">aspect_ratio</i>Users</a>
                    </li>

                    <li class="dropdown">
                        <a href="aavailability" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">library_books</i><span>Availability</span></a>
                    </li>

                    <li class="dropdown">
                        <a href="aform" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">border_color</i><span>Add Form</span></a>
                    </li>

                    <li class="dropdown">
                        <a href="vform" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">extension</i><span>View Form</span></a>
                    </li>

                    <li class="dropdown">
                        <a href="viewappointment" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">apps</i><span>View Appointments</span></a>
                    </li>

                    <li class="dropdown">
                        <a href="areport" data-toggle="collapse" aria-expanded="false" 
                           class="dropdown-toggle">
                            <i class="material-icons">grid_on</i><span>Reports</span></a>
                        <ul class="collapse list-unstyled menu" id="pageSubmenu6">
                    </li>
                </ul>
            </nav>




            <div id="content">

                <!--top--navbar--->

                <div class="top-navbar">
                    <div class="xp-topbar">
                        <div class="row"> 
                            <div class="col-2 col-md-1 col-lg-1 order-2 order-md-1 align-self-center">
                                <div class="xp-menubar">
                                    <span class="material-icons text-white">signal_cellular_alt
                                    </span>
                                </div>
                            </div> 
                            <div class="col-10 col-md-11 col-lg-11 order-1 order-md-2 text-end">
                                <a href="/home" class="btn btn-primary me-2">Home</a>
                                <a href="home?logout" class="btn btn-danger me-2">Logout</a>
                            </div>
                        </div> 
                    </div>
                    <div class="xp-breadcrumbbar text-center">
                        <h4 class="page-title">Dashboard</h4>               
                    </div>
                </div>




                <!--------main-content------------->
                <div class="my-4"></div>
                <div class="col-md-5 col-lg-3 mx-auto order-3 order-md-2">
                    <div class="xp-searchbar">
                        <form>
                            <div class="input-group">
                                <input type="search" class="form-control" id="searchterm" placeholder="Search By First Name" oninput="handleSearch(this.value)" />
                                <div class="input-group-append">
                                    <button class="btn" type="submit" 
                                            id="button-addon2">GO</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="main-content">
                    <div class="row">

                        <div class="col-md-12">
                            <div class="table-wrapper">
                                <div class="table-title">
                                    <div class="row">
                                        <div class="col-sm-6 p-0 d-flex justify-content-lg-start justify-content-center">
                                            <h2 class="ml-lg-2">View Forms</h2>
                                            <!--                                            <div class="show">
                                                                                            <a href="/vform" class="show-all-users">Show all users</a>    
                                                                                        </div>-->
                                        </div>

                                    </div>
                                </div>
                                <c:if test="${userForm eq null}">


                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Email</th>
                                                <th>Phone</th>
                                                <th>Forms</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% int usersPerPage = 10; %>
                                        <% List<User> userList = (List<User>) request.getAttribute("userList"); %>
                                        <% int totalUsers = userList.size(); %>
                                        <% int totalPages = (int) Math.ceil((double) totalUsers / usersPerPage); %>
                                        <% int currentPage = 1; %>
                                        <% String pageParam = request.getParameter("page"); %>
                                        <% if (pageParam != null && !pageParam.isEmpty()) { %>
                                        <% currentPage = Integer.parseInt(pageParam); %>
                                        <% } %>
                                        <% int startIndex = (currentPage - 1) * usersPerPage; %>
                                        <% int endIndex = Math.min(startIndex + usersPerPage, totalUsers);%>
                                        <% int loopIndex = 0; %>
                                            
                                            
                                            
                                            <c:forEach items="${userList}" var="user">
                                                <tr class="userRow <% if (loopIndex >= startIndex && loopIndex < endIndex) { %>active<% } %>">
                                                    <td>${user.getFirstname()}</td>
                                                    <td>${user.getLastname()}</td>
                                                    <td>${user.getEmailAddress()}</td>
                                                    <td>${user.getPhoneNumber()}</td>
                                                    <td> <a href="/vform?userId=${user.getUserid()}">View Forms</a></td>
                                                </tr>
                                                <% loopIndex++; %>
                                                </c:forEach>
                                        </tbody>

                                    </table>
                                <div class="pageNumbers">
                                    <% for (int pageNumber = 1; pageNumber <= totalPages; pageNumber++) {%>
                                    <button onclick="showPage(<%= pageNumber%>)">Page <%= pageNumber%></button>
                                    <% }%>
                                </div>
                                
                                <script>
                                    const userRows = document.querySelectorAll('.userRow');
                                    const rowsPerPage = 10;
                                    let currentPage = 1;

                                    function showPage(pageNumber) {
                                        document.getElementById('searchterm').value="";
                                        const startIndex = (pageNumber - 1) * rowsPerPage;
                                        const endIndex = startIndex + rowsPerPage;

                                        userRows.forEach(function (row, index) {
                                            if (index >= startIndex && index < endIndex) {
                                                row.style.display = 'table-row';
                                            } else {
                                                row.style.display = 'none';
                                            }
                                        });

                                        currentPage = pageNumber;
                                    }

                                    function handleSearch(searchTerm) {
                                        searchTerm = searchTerm.toLowerCase();

                                        if (searchTerm === '') {
                                            showPage(1); // Display the first page with all users
                                            return; // Exit the function
                                        }

                                        userRows.forEach(function (row) {
                                            const firstName = row.querySelector('td:first-child').textContent.toLowerCase();
                                            if (firstName.includes(searchTerm)) {
                                                row.style.display = 'table-row';
                                            } else {
                                                row.style.display = 'none';
                                            }
                                        });

                                        // Hide all rows on other pages
                                        const currentPageRows = Array.from(document.querySelectorAll('.userRow.active'));
                                        currentPageRows.forEach(function (row) {
                                            if (!row.style.display) {
                                                row.style.display = 'none';
                                            }
                                        });
                                    }

                                    // Show the first page on initial load
                                    showPage(1);
                                </script>
                                
                                
                                </c:if>

                                <c:if test="${userForm ne null}">


                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>${userForm.getFirstname()}</th>
                                                <th>${userForm.getLastname()}</th>
                                                <th>${userForm.getEmailAddress()}</th>
                                                <th>Time Added</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${medicalforms}" var="mdform">
                                                <tr><td>${mdform.getUserid().getFirstname()}</td>
                                                    <td>${mdform.getUserid().getLastname()}</td>
                                                    <td>Medical Form</td>
                                                    <td>${mdform.getTimeAdded()}</td>
                                                    <td><button onclick="openPdfPopup('/viewForm?formId=${mdform.getId()}&form=1')">View</button></td>
                                                    <td> <a href="/downloadForm?formId=${mdform.getId()}&form=1&referer=${pageContext.request.requestURI}">Download</a></td>
                                                    <td><button onclick="openDeleteConfirm(this.value, 'medical')" value="${mdform.getId()}">Delete</button></td>
                                                </tr>

                                            </c:forEach>
                                            <c:forEach items="${consentforms}" var="csform">
                                                <tr><td>${csform.getUserid().getFirstname()}</td>
                                                    <td>${csform.getUserid().getLastname()}</td>
                                                    <td>Consent Form</td>
                                                    <td>${csform.getTimeAdded()}</td>
                                                    <td><button onclick="openPdfPopup('/viewForm?formId=${csform.getId()}&form=2')">View</button></td>
                                                    <td> <a href="/downloadForm?formId=${csform.getId()}&form=2&referer=${pageContext.request.requestURI}">Download</a></td>
                                                    <td><button onclick="openDeleteConfirm(this.value, 'consent')" value="${csform.getId()}">Delete</button></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <div class="show">
                                        <a href="/vform" class="show-all-users">Show all users</a>    
                                    </div>
                                </c:if>
                                <div id="javascriptmessage">
                                    
                                </div>



                                <div class="clearfix">
                                    <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                                    <ul class="pagination">
                                        <li class="page-item disabled"><a href="#">Previous</a></li>
                                        <li class="page-item"><a href="#" class="page-link">1</a></li>
                                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                                        <li class="page-item active"><a href="#" class="page-link">3</a></li>
                                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                                        <li class="page-item"><a href="#" class="page-link">Next</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- The popup container -->
                <div id="pdfPopup" class="popup">
                    <div class="popup-content" id="popup-content">
                        <div class="pdf-container">
                            <div id="pdfViewer" class="pdfViewer"></div>
                        </div>
                        <span class="popup-close" onclick="closePopup()">&times;</span>
                    </div>
                </div>
                <!-- Confirmation when delete form-->
                <div id="confirmPopup" class="confirmPopup">
                    <div class="popup-content" id="confirm-content">
                        
                    </div>
                </div>



                <!--start footer-->
                <div class="my-5"></div>
                <footer class="footer">
                    <div class="container-fluid">
                        <div class="footer-in">
                            <p class="mb-0">&copy Tai Yang Clinic. All Rights Reserved.</p>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
    </div>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.11.338/pdf.min.js"></script>
    <script src="js/vform.js"></script>

    <script type="text/javascript">

                            $(document).ready(function () {
                                $(".xp-menubar").on('click', function () {
                                    $('#sidebar').toggleClass('active');
                                    $('#content').toggleClass('active');
                                });

                                $(".xp-menubar,.body-overlay").on('click', function () {
                                    $('#sidebar,.body-overlay').toggleClass('show-nav');
                                });

                            });

    </script>

</body>
</html>