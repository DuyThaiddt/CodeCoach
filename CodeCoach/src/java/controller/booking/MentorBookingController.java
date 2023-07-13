/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.booking;

import dal.BookingDAO;
import dal.MentorDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Booking;
import model.Mentors;
import model.Users;

import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author dai nghia
 */
@WebServlet(name="MentorBookingController", urlPatterns={"/mentor-booking"})
public class MentorBookingController extends HttpServlet {


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String go = request.getParameter("go");
        if (go == null){
            Users user = (Users) request.getSession().getAttribute("users");
            if(user == null || user.getRoleId() != 2){
                response.sendRedirect("login");
                return;
            }

            Mentors mentor = new MentorDAO().getMentorByUserId(user.getUserId());

            ArrayList<Booking> mentorBookings = new BookingDAO().getBookingMentorId(mentor.getMentorId());

            request.setAttribute("mentorBookings", mentorBookings);

            request.getRequestDispatcher("booking/mentor-booking.jsp").forward(request, response);
        }
        else if("change-status".equals(go)){
            int bookingId = Integer.parseInt(request.getParameter("booking-id"));
            String status = request.getParameter("status");
            BookingDAO bookingDAO = new BookingDAO();
            bookingDAO.updateBookingStatus(bookingId, status);
            response.sendRedirect("mentor-booking");
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
