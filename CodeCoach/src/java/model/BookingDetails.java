/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Duy Thai
 */
public class BookingDetails {

    private int bookingDetailId;
    private int bookingId;
    private int slotId;
    private String date;

    public BookingDetails() {
    }

    @Override
    public String toString() {
        return "BookingDetails{" + "bookingDetailId=" + bookingDetailId + ", bookingId=" + bookingId + ", slotId=" + slotId + ", date=" + date + '}';
    }

    public BookingDetails(int bookingId, int slotId, String date) {
        this.bookingId = bookingId;
        this.slotId = slotId;
        this.date = date;
    }

    public BookingDetails(int bookingDetailId, int bookingId, int slotId, String date) {
        this.bookingDetailId = bookingDetailId;
        this.bookingId = bookingId;
        this.slotId = slotId;
        this.date = date;
    }

    public int getBookingDetailId() {
        return bookingDetailId;
    }

    public void setBookingDetailId(int bookingDetailId) {
        this.bookingDetailId = bookingDetailId;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getSlotId() {
        return slotId;
    }

    public void setSlotId(int slotId) {
        this.slotId = slotId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

}
