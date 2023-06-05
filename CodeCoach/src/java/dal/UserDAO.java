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
public class UserDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

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

    public Users checkLogin
        (String email, String password) {
        try {
            String querry = "Select * from Users where email =? and password =?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
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
            if(rs.next()) return true;
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
            conn = new DBContext().getConnection();
            PreparedStatement st = conn.prepareStatement(sql);
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
    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        System.out.println(dao.checkEmailExist("admin@admin.com"));
        
    }

}
