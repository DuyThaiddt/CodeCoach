package dal;

import model.Notifications;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class NotificationDAO {
    /*
    CREATE TABLE Notifications (
  notificationId INT IDENTITY(1,1) PRIMARY KEY,
  userId INT NOT NULL,
  bookingId INT NOT NULL,
  content VARCHAR(MAX) NOT NULL,
  dateTime DATETIME NOT NULL,
  type VARCHAR(50) NOT NULL,
  status VARCHAR(50) NOT NULL,
  FOREIGN KEY (userId) REFERENCES Users(userId),
  FOREIGN KEY (bookingId) REFERENCES Booking(bookingId)
);
     */

    public static void main(String[] args) {
        NotificationDAO notificationDAO = new NotificationDAO();
        Notifications notifications = new Notifications(1, 1, "Hello", "2021-05-05 12:00:00", "Booking", "Unread");
        notificationDAO.addNotification(notifications);
    }

    private static final String ADD_NOTIFICATION = "INSERT INTO Notifications (userId, bookingId, content, dateTime, type, status) VALUES (?,?,?,?,?,?)";
    public void addNotification(Notifications notifications){
        try(Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(ADD_NOTIFICATION)) {
            ps.setInt(1, notifications.getUserId());
            ps.setInt(2, notifications.getBookingId());
            ps.setString(3, notifications.getContent());
            ps.setString(4, notifications.getDateTime());
            ps.setString(5, notifications.getType());
            ps.setString(6, notifications.getStatus());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
