/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Booking;
import dal.BookingDAO;
import dal.ChatMessagesDAO;
import dal.ChatRoomDAO;
import dal.MentorDAO;
import dal.UserDAO;
import jakarta.servlet.http.HttpSession;
import model.ChatMessages;
import model.ChatRoom;
import model.Mentees;
import model.Mentors;
import model.Users;
import dal.MenteeDAO;
import dal.SkillDAO;
import model.BookingDetails;
import model.Skills;
import dal.BookingDetailDAO;

/**
 *
 * @author giang
 */
@WebServlet(name="ListInvoiceController", urlPatterns={"/listinvoice"})
public class ListInvoiceController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ListInvoiceController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListInvoiceController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

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
         try {
            HttpSession session = request.getSession();
            Users u = (Users) session.getAttribute("users");
            String userId = Integer.toString(u.getUserId());
            if (userId != null) {
                Mentors m = new MentorDAO().getMentorByUserId(userId);
                request.setAttribute("m", m);
                List<Booking> bookings = new BookingDAO().getBookingsByMentorId(m.getMentorId());
                request.setAttribute("bookings", bookings);
                List<Users> listusers = new UserDAO().getAllUser();
                request.setAttribute("listusers", listusers);
                List<Mentors> mentors = new MentorDAO().getAllMentor();
                request.setAttribute("mentors", mentors);
                List<Mentees> mentees = new MenteeDAO().getAllMentee();
                request.setAttribute("mentees", mentees);
                List<Skills> skills = new SkillDAO().getAll();
                request.setAttribute("skills", skills);
                List<BookingDetails> bookingDetails = new BookingDetailDAO().getAllBookingDetails();
                request.setAttribute("bookingDetails", bookingDetails);
                List<Integer> listCountDetail = new BookingDetailDAO().countBookingDetailsbyId();
                request.setAttribute("listCountDetail", listCountDetail);

                request.getRequestDispatcher("listinvoice.jsp").forward(request, response);
            } else {
                response.sendRedirect("login");
            }

        } catch (Exception e) {
            response.sendRedirect("login");
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
        processRequest(request, response);
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
