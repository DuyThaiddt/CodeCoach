/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.BookingDAO;
import dal.BookingDetailDAO;
import dal.ChatMessagesDAO;
import dal.ChatRoomDAO;
import dal.ChatRoomUsersDAO;
import dal.MenteeDAO;
import dal.MentorDAO;
import dal.SlotDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Booking;
import model.BookingDetails;
import model.Mentors;
import model.Slot;
import model.Users;

/**
 *
 * @author Duy Thai
 */
@WebServlet(name="BookingSuccessfulController", urlPatterns={"/bookingsuccessful"})
public class BookingSuccessfulController extends HttpServlet {
   
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
            out.println("<title>Servlet BookingSuccessfulController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingSuccessfulController at " + request.getContextPath () + "</h1>");
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
            String menteeId = new MenteeDAO().getMenteeIdbyUserId(userId);
            Booking b = new BookingDAO().getBookingLatestbyMenteeId(menteeId);
            Mentors m = new MentorDAO().getMentorByMentorId(b.getMentorId());
            String mentorName = new UserDAO().getUserNameByUserId(m.getUserId());
            BookingDetails bookingdetail = new BookingDetailDAO().getBookingDetailbyBookingId(b.getBookingId());
            Slot slot = new SlotDAO().getSlotbySlotId(bookingdetail.getSlotId());
            request.setAttribute("mentorName", mentorName);
            request.setAttribute("bookingdetail", bookingdetail);
            request.setAttribute("slot", slot);
            int sharedChatRoomId = new ChatRoomUsersDAO().getSharedChatRoomIdbyId(u.getUserId(), m.getUserId());
            if (sharedChatRoomId==0) {
                new ChatRoomDAO().insertChatRoom(mentorName, u.getfName()+" "+u.getlName());
                int chatRoomId = new ChatRoomDAO().getLatestChatRoomId();
                new ChatRoomUsersDAO().insertChatRoomUser(chatRoomId, u.getUserId());
                new ChatRoomUsersDAO().insertChatRoomUser(chatRoomId, m.getUserId());
            }else {
                new ChatMessagesDAO().insertChatMessage(String.valueOf(m.getUserId()), String.valueOf(sharedChatRoomId), "You have successfully submitted your application, please wait for the mentor to review your request. During that time you can communicate with your mentor here");
                new ChatMessagesDAO().insertChatMessage(String.valueOf(u.getUserId()), String.valueOf(sharedChatRoomId), "Enter the message below to chat with the mentor");
            } 
            request.getRequestDispatcher("bookingsuccessful.jsp").forward(request, response);
        } catch (Exception e) {
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
