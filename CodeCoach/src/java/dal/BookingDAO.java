/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Booking;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author giang
 */
public class BookingDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Booking> getAllBooking() {
        List<Booking> listBookings = new ArrayList<>();
        String querry = "select * from Booking";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                listBookings.add(new Booking(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return listBookings;
    }

    private final String GET_BOOKING_BY_MENTOR_ID = "SELECT * FROM [dbo].[Booking] WHERE mentorId = ?";

    public List<Booking> getBookingsByMentorId(int mentorId) {
        List<Booking> listBookings = new ArrayList<>();
        String querry = "Select * From Booking Where mentorId=" + mentorId + " AND status='Accepted'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                listBookings.add(new Booking(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return listBookings;
    }

    public Booking getBookingLatestbyMenteeId(String menteeId) {
        Booking b = new Booking();
        String querry = "SELECT * FROM [dbo].[Booking] WHERE menteeId = " + menteeId
                + " AND bookingId = (SELECT MAX(bookingId) FROM [dbo].[Booking] WHERE menteeId = " + menteeId + ");";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                b = new Booking(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getString(5));
            }
        } catch (Exception e) {
        }
        return b;
    }

    public void updateBookingStatus(int bookingId, String status) {
        String querry = "UPDATE [dbo].[Booking] SET status = ? WHERE bookingId = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            ps.setString(1, status);
            ps.setInt(2, bookingId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getTotalBookingByMenteeId(int menteeId) {
        String query = "select count(bookingId) as Total from Booking where menteeId =" + menteeId + "";
        try {
            int total = 0;
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                total = rs.getInt("Total");
                return total;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getTotalAcceptedBookingByMenteeId(int menteeId) {
        String query = "select count(bookingId) as Total from Booking where menteeId =" + menteeId
                + " and status = 'Accepted'";
        try {
            int total = 0;
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                total = rs.getInt("Total");
                return total;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getTotalPendingBookingByMenteeId(int menteeId) {
        String query = "select count(bookingId) as Total from Booking where menteeId =" + menteeId
                + " and status = 'Pending'";
        try {
            int total = 0;
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                total = rs.getInt("Total");
                return total;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getTotalMoneySpentByMenteeId(int menteeId) {
        String query = "select  sum(cast(m.hourlyRate as int)) as Total  from BookingDetails bd \n"
                + "   join Booking b on bd.bookingId = b.bookingId \n"
                + "   join Mentors m on m.mentorId = b.mentorId\n"
                + "   where b.menteeId = " + menteeId + " and status = 'Accepted' ";
        try {
            int total = 0;
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                total = rs.getInt("Total");
                return total;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }
    public int getTotalBookingByMentorId(int mentorId) {
        String query = "select count(bookingId) as Total from Booking where mentorId =" + mentorId + "";
        try {
            int total = 0;
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                total = rs.getInt("Total");
                return total;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }
    public int getTotalMoneyEarnByMentorId(int mentorId) {
        String query = "select  sum(cast(m.hourlyRate as int)) as Total  from BookingDetails bd \n"
                + "   join Booking b on bd.bookingId = b.bookingId \n"
                + "   join Mentors m on m.mentorId = b.mentorId\n"
                + "   where b.mentorId = " + mentorId + " and status = 'Accepted' ";
        try {
            int total = 0;
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                total = rs.getInt("Total");
                return total;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }
    public List<Object> getBookingInfoByMentorId(int mentorId){
        List<Object> infoList = new ArrayList<>();
        String query = "select distinct u.userId, u.fName, u.lName, b.status\n" +
                        "from Booking b join Mentees m on b.menteeId = m.menteeId join Users u on m.userId = u.userId\n" +
                        "where mentorId = "+mentorId+""; 
         try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Object[] bookingInfo = new Object[4];
                bookingInfo[0] = rs.getInt("userId");
                bookingInfo[1] = rs.getString("fName");
                bookingInfo[2] = rs.getString("lName");
                bookingInfo[3] = rs.getString("status");
                infoList.add(bookingInfo);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return infoList;
    }

}