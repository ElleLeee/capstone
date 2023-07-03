/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;
import services.UserService;

/**
 *
 * @author third
 */
public class ProfileServlets extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("loggedUser");

        if (request.getParameter("translate") != null) { //translate the page
            String language = request.getParameter("translate");
            if (language.equals("en")) {
                session.setAttribute("language", language);
                //set the cookie to new language
                Cookie languageCookie = new Cookie("language", language);
                languageCookie.setMaxAge(60 * 60 * 24 * 30); // Set the cookie to expire in 30 days
                languageCookie.setPath("/");
                response.addCookie(languageCookie);
                response.sendRedirect("/en/profile");
            } else {
                session.setAttribute("language", language);
                //set the cookie to new language
                Cookie languageCookie = new Cookie("language", language);
                languageCookie.setMaxAge(60 * 60 * 24 * 30); // Set the cookie to expire in 30 days
                languageCookie.setPath("/");
                response.addCookie(languageCookie);
                response.sendRedirect("/kr/profile");
            }
            return;
        }

        String logout = request.getParameter("logout");
        if (logout != null) {
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect("home");
            return;
        }
        String language = utilities.GetLanguageCookie.getLanguageCookie(request);
        if (language == null) {
            response.sendRedirect("/welcome");
        } else {
            session = request.getSession(true); // Create a new session
            session.setAttribute("language", language);
            if (language.equals("kr")) {
                getServletContext().getRequestDispatcher("/WEB-INF/kr/profile.jsp").forward(request, response);
            } else if (language.equals("en")) {
                getServletContext().getRequestDispatcher("/WEB-INF/en/profile.jsp").forward(request, response);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String language = utilities.GetLanguageCookie.getLanguageCookie(request);

        User loggedUser = (User) session.getAttribute("loggedUser");
        UserService us = new UserService();
        String action = request.getParameter("action");
        if (action.equals("update")) {
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");

            loggedUser.setEmailAddress(email);
            loggedUser.setPhoneNumber(phone);
            loggedUser.setPassword(password);
            String message = "";
            try {

                message = us.update(loggedUser, language);

                if (message.equals("Update successful!")||message.equals("업데이트 성공!")) {
                    session.setAttribute("updatedEmail", email);
                    session.setAttribute("updatedPhone", phone);
                    request.setAttribute("updatedInfo", true);

                    if (us.getByEmail(email).getIsValid() == 2) {

                        if (language.equals("kr")) {
                            request.setAttribute("message", "태양의원 서비스를 이용하기 위해서는 먼저 이메일 인증이 필요합니다.");
                            getServletContext().getRequestDispatcher("/WEB-INF/kr/sendvalidation.jsp").forward(request, response);
                        } else if (language.equals("en")) {
                            request.setAttribute("message", "To use TaiYang clinic services, You need to validate the email first");
                            getServletContext().getRequestDispatcher("/WEB-INF/en/sendvalidation.jsp").forward(request, response);
                        }

                    }
                }
                request.setAttribute("message", message);
            } catch (Exception ex) {
                Logger.getLogger(ProfileServlets.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            if (language.equals("en")) {
                getServletContext().getRequestDispatcher("/WEB-INF/en/profile.jsp").forward(request, response);
            }
            if (language.equals("kr")) {
                getServletContext().getRequestDispatcher("/WEB-INF/kr/profile.jsp").forward(request, response);
            }
            
            
        }
    }

}
