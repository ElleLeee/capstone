<%-- 
    Document   : book
    Created on : 2023. 6. 5, 오전 12:53:35
    Author     : third
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tai Yang Clinic</title>
        <link rel="stylesheet" type="text/css" href="css/global.css">
        <link rel="stylesheet" type="text/css" href="css/book.css">
        <script src="https://kit.fontawesome.com/b0274adb94.js" crossorigin="anonymous"></script>
        
        <c:import url="./components/header.jsp" />
    </head>
    <body>
        
    <!--Book Start-->
    <div class="gloabal_container">
      <div class="gloabal_top_section">
        <h1>BOOK AN APPOINTMENT</h1>
      </div>
      <div class="book_main_section gloabal_main_section">
        <div class="book_main-left">
          <!-- Calendar -->
          <div class="book_left_top">
            <button class="prev_week"><i class="fa-solid fa-chevron-left"></i></button>
            <h2>Sun Jun 4 - Sat Jun 10</h2>
            <button class="next_week"><i class="fa-solid fa-chevron-right"></i></button>
          </div>
          <div class="book_left_time">
            <div class="book_table_time">
              <div class="table_header"></div>
              <div class="table_time">8:00am</div>
              <div class="table_time">9:00am</div>
              <div class="table_time">10:00am</div>
              <div class="table_time">11:00am</div>
              <div class="table_time">12:00pm</div>
              <div class="table_time">1:00pm</div>
              <div class="table_time">2:00pm</div>
              <div class="table_time">3:00pm</div>
              <div class="table_time">4:00pm</div>
              <div class="table_time">5:00pm</div>
              <div class="table_time">6:00pm</div>
              <div class="table_time">7:00pm</div>
            </div>
            <div class="book_table_date">
              <div class="table_header">Sun June 4</div>
              <div class="table_time_data">
                <div class="table_data"></div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data"></div>
              </div>
            </div>
            <div class="book_table_date">
              <div class="table_header">Mon June 5</div>
              <div class="table_time_data">
                <div class="table_data"></div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_unavailable">Booked</div>
                <div class="table_data data_unavailable">Booked</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_unavailable">Booked</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data"></div>
              </div>
            </div>
              <div class="book_table_date">
              <div class="table_header">Tus June 6</div>
              <div class="table_time_data">
                <div class="table_data"></div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_unavailable">Booked</div>
                <div class="table_data data_unavailable">Booked</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_unavailable">Booked</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data"></div>
              </div>
            </div>
              <div class="book_table_date">
              <div class="table_header">Wed June 7</div>
              <div class="table_time_data">
                <div class="table_data"></div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_unavailable">Booked</div>
                <div class="table_data data_unavailable">Booked</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_unavailable">Booked</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data"></div>
              </div>
            </div>
              <div class="book_table_date">
              <div class="table_header">Thu June 8</div>
              <div class="table_time_data">
                <div class="table_data"></div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_unavailable">Booked</div>
                <div class="table_data data_unavailable">Booked</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_unavailable">Booked</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data"></div>
              </div>
            </div>
              <div class="book_table_date">
              <div class="table_header">Fri June 9</div>
              <div class="table_time_data">
                <div class="table_data"></div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_unavailable">Booked</div>
                <div class="table_data data_unavailable">Booked</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_unavailable">Booked</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data"></div>
              </div>
            </div>
              <div class="book_table_date">
              <div class="table_header">Sat June 10</div>
              <div class="table_time_data">
                <div class="table_data"></div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_unavailable">Booked</div>
                <div class="table_data data_unavailable">Booked</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_unavailable">Booked</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data data_available">Available</div>
                <div class="table_data"></div>
              </div>
            </div>
          </div>
        </div>
        <div class="book_main_right">
          <div class="book_right_icon">
            <div class="able">Available</div>
            <div class="unable">unavailable</div>
          </div>
          <div class="book_right_selected">
            <div>Selected time:</div>
            <div>Mon Jone 5, 11:00am</div>
          </div>
          <div class="book_right_btn">
            <button class="book_btn">Booking Now</button>
          </div>
        </div>
      </div>
    </div>
    
    </body>
    
    <footer>
        <jsp:include page="./components/footer.jsp" />
    </footer>
</html>