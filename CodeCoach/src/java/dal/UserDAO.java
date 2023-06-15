/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Roles;
import model.Users;

/**
 *
 * @author Duy Thai
 */
public class UserDAO extends DBContext {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    
     public List<Users> getAllUser() {
        List<Users> listUsers = new ArrayList<>();
        String querry = "select * from Users";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                listUsers.add(new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11), rs.getString(12)));
            }
        } catch (Exception e) {
        }

        return listUsers;
    }
     
    public List<Roles> getAll() {
        List<Roles> list = new ArrayList<>();
        String querry = "select * from roles";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Roles(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }

        return list;
    }

    public Users checkLogin(String email, String password) {
        try {
            String query = "Select * from Users where email =? and password =?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
                        rs.getInt(8), rs.getInt(9), rs.getString(10), rs.getString(11), rs.getString(12));
                return u;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean checkEmailExist(String email) {
        try {
            String querry = "Select * from Users where email=?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void changePassword(Users u) throws Exception {

        String upd = "Update Users set password=?"
                + " where email=?";
        try {
            conn = new DBContext().getConnection();
            PreparedStatement st = conn.prepareStatement(upd);
            st.setString(1, u.getPassword());
            st.setString(2, u.getEmail());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void changePasswordWhenForget(String email, String password) throws Exception {

        String upd = "Update Users set password=?"
                + " where email=?";
        try {
            conn = new DBContext().getConnection();
            PreparedStatement st = conn.prepareStatement(upd);
            st.setString(1, password);
            st.setString(2, email);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public boolean checkUserByEmail(String email) {
        try {
            String query = "Select * from Users where email = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void insert(Users user) {
        String sql = "INSERT INTO [dbo].[Users]\n"
                + "           ([email]\n"
                + "           ,[password]\n"
                + "           ,[fName]\n"
                + "           ,[lName]\n"
                + "           ,[gender]\n"
                + "           ,[phoneNum]\n"
                + "           ,[roleId]\n"
                + "           ,[statusId]\n"
                + "           ,[address]\n"
                + "           ,[maqh]\n"
                + "           ,[facebook])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,3,1,?,?,?)";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(3, user.getfName());
            st.setString(4, user.getlName());
            st.setString(5, user.getGender());
            st.setString(1, user.getEmail());
            st.setString(6, user.getPhoneNum());
            st.setString(7, user.getAddress());
            st.setString(9, user.getFacebook());
            st.setString(2, user.getPassword());
            st.setString(8, user.getMaqh());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Object[]> getAllUserInfoOfMentor() {
        List<Object[]> list = new ArrayList<>();

        String querry = "select m.mentorId, m.userId, m.bio, m.hourlyRate, u.email, u.password, u.fName, u.lName, u.gender, u.phoneNum, u.roleId, u.statusId, u.address, u.maqh, u.facebook, qh.name, ttp.name from mentors m join users u on m.userId = u.userId join quanhuyen qh on u.maqh = qh.maqh join tinhthanhpho ttp on qh.mattp = ttp.mattp";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                Object[] userInfo = new Object[17];
                // Populate the array with data from the ResultSet
                userInfo[0] = rs.getString("mentorId");
                userInfo[1] = rs.getString("userId");
                userInfo[2] = rs.getString("bio");
                userInfo[3] = rs.getInt("hourlyRate");
                userInfo[4] = rs.getString("email");
                userInfo[5] = rs.getString("password");
                userInfo[6] = rs.getString("fName");
                userInfo[7] = rs.getString("lName");
                userInfo[8] = rs.getString("gender");
                userInfo[9] = rs.getString("phoneNum");
                userInfo[10] = rs.getInt("roleId");
                userInfo[11] = rs.getInt("statusId");
                userInfo[12] = rs.getString("address");
                userInfo[13] = rs.getString("maqh");
                userInfo[14] = rs.getString("facebook");
                userInfo[15] = rs.getString(16);
                userInfo[16] = rs.getString(17);
                list.add(userInfo);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Object[] getUserInfoByMentorId(int mentorId) {
        Object[] o = new Object[17];
        String query = "select m.mentorId, m.userId, m.bio, m.hourlyRate, u.email, u.password, u.fName, u.lName, u.gender, u.phoneNum, u.roleId, u.statusId, u.address, u.maqh, u.facebook, qh.name, ttp.name from mentors m join users u on m.userId = u.userId join quanhuyen qh on u.maqh = qh.maqh join tinhthanhpho ttp on qh.mattp = ttp.mattp where m.mentorId =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, mentorId);
            rs = ps.executeQuery();
            while (rs.next()) {
                o[0] = rs.getInt(1); //mentorId
                o[1] = rs.getInt(2); //userId
                o[2] = rs.getString(3); //bio
                o[3] = rs.getInt(4); //hourlyRate
                o[4] = rs.getString(5); //email
                o[5] = rs.getString(6); // password
                o[6] = rs.getString(7); //fname
                o[7] = rs.getString(8); //lname
                o[8] = rs.getString(9); //gender
                o[9] = rs.getString(10); //phoneNum
                o[10] = rs.getInt(11); // roleId
                o[11] = rs.getInt(12); //statusId
                o[12] = rs.getString(13); // address
                o[13] = rs.getInt(14); // maqh
                o[14] = rs.getString(15); //facebook
                o[15] = rs.getString(16); //qh name
                o[16] = rs.getString(17); //ttp name
            }
        } catch (Exception e) {

        }
        return o;
    }
    
    public void updateRoleIdUser(String userId) {
        String query = "UPDATE [dbo].[Users] SET [roleId] = 2 WHERE userId = "+userId+"";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();         
        } catch (Exception e) {
        }
    }
    
    public String getUserNameByUserId(int userId) {
        String fullName ="";
        String querry = "select fName,lName from Users where userId="+userId+"";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                fullName = rs.getString(1) + " " +rs.getString(2);
            }
            
        } catch (Exception e) {
        }
        return fullName;
    }

    public static void main(String[] args) {
        
        
    }
}
