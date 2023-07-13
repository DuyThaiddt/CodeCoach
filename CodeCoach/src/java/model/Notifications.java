/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Duy Thai
 */
public class Notifications {

    private int notificationId;
    private int userId;
    private int bookingId;
    private String content;
    private String dateTime;
    private String type;
    private String status;

    public Notifications() {
    }

    public Notifications(int userId, int bookingId, String content, String dateTime, String type, String status) {
        this.userId = userId;
        this.bookingId = bookingId;
        this.content = content;
        this.dateTime = dateTime;
        this.type = type;
        this.status = status;
    }

    public Notifications(int notificationId, int userId, int bookingId, String content, String dateTime, String type, String status) {
        this.notificationId = notificationId;
        this.userId = userId;
        this.bookingId = bookingId;
        this.content = content;
        this.dateTime = dateTime;
        this.type = type;
        this.status = status;
    }

    @Override
    public String toString() {
        return "Notifications{" + "notificationId=" + notificationId + ", userId=" + userId + ", bookingId=" + bookingId + ", content=" + content + ", dateTime=" + dateTime + ", type=" + type + ", status=" + status + '}';
    }

    public int getNotificationId() {
        return notificationId;
    }

    public void setNotificationId(int notificationId) {
        this.notificationId = notificationId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
