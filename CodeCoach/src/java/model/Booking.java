/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.BookingDetailDAO;
import dal.MenteeDAO;
import dal.SkillDAO;
import dal.SlotDAO;

/**
 *
 * @author Duy Thai
 */
public class Booking {

    private int bookingId;
    private int mentorId;
    private int menteeId;
    private int skillId;
    private String status;

    private String startTime;
    private String endTime;
    private String menteeName;
    private String skillName;
    private String date;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Booking(int bookingId, int mentorId, int menteeId, int skillId, String status, boolean getAllInfo) {
        this.bookingId = bookingId;
        this.mentorId = mentorId;
        this.menteeId = menteeId;
        this.skillId = skillId;
        this.status = status;
        if(getAllInfo){
            BookingDetails bookingDetails = new BookingDetailDAO().getBookingDetailbyBookingId(bookingId);
            Slot slot = new SlotDAO().getSlotByBookingDetailsId(bookingDetails.getSlotId());
            Skills skill = new SkillDAO().getSkillBySkillId(skillId);
            Users mentee = new MenteeDAO().getUserByMenteeId(menteeId);
            this.menteeName  = mentee.getfName() + " " + mentee.getlName();
            this.startTime = slot.getStartTime();
            this.endTime = slot.getEndTime();
            this.skillName = skill.getSkillName();
            this.date = bookingDetails.getDate();
        }
    }

    public Booking(int mentorId, int menteeId, int skillId, String status) {
        this.mentorId = mentorId;
        this.menteeId = menteeId;
        this.skillId = skillId;
        this.status = status;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getMenteeName() {
        return menteeName;
    }

    public void setMenteeName(String menteeName) {
        this.menteeName = menteeName;
    }

    public String getSkillName() {
        return skillName;
    }

    public void setSkillName(String skillName) {
        this.skillName = skillName;
    }

    public Booking() {
    }

    public Booking(int bookingId, int mentorId, int menteeId, int skillId, String status) {
        this.bookingId = bookingId;
        this.mentorId = mentorId;
        this.menteeId = menteeId;
        this.skillId = skillId;
        this.status = status;
    }

    @Override
    public String toString() {
        return "Booking{" +
                "bookingId=" + bookingId +
                ", mentorId=" + mentorId +
                ", menteeId=" + menteeId +
                ", skillId=" + skillId +
                ", status='" + status + '\'' +
                ", startTime='" + startTime + '\'' +
                ", endTime='" + endTime + '\'' +
                ", menteeName='" + menteeName + '\'' +
                ", skillName='" + skillName + '\'' +
                ", date='" + date + '\'' +
                '}';
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getMentorId() {
        return mentorId;
    }

    public void setMentorId(int mentorId) {
        this.mentorId = mentorId;
    }

    public int getMenteeId() {
        return menteeId;
    }

    public void setMenteeId(int menteeId) {
        this.menteeId = menteeId;
    }

    public int getSkillId() {
        return skillId;
    }

    public void setSkillId(int skillId) {
        this.skillId = skillId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
