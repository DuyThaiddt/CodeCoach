/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import controller.booking.Utilities;
import model.QuanHuyen;
import model.TinhThanhPho;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.QuanHuyen;
import model.TinhThanhPho;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Duy Thai
 */
public class TinhThanhPhoDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;



    private final String GET_TTPNAME_QHNAME_BY_USER_ID = "select qh_name.name as qh_name, ttp.name as tp_name from (SELECT qh.name, qh.mattp\n" +
            "FROM Users u\n" +
            "JOIN quanhuyen qh ON u.maqh = qh.maqh\n" +
            "WHERE u.userId = ? ) as qh_name join tinhthanhpho ttp on qh_name.mattp = ttp.mattp";


    public String getTTPNameAndQHName(int userID){
        String result = "";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(GET_TTPNAME_QHNAME_BY_USER_ID);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                result = rs.getString(1) + ", " + rs.getString(2);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public List<TinhThanhPho> getAllTinhThanhPho() {
        List<TinhThanhPho> list = new ArrayList<>();
        String querry = "SELECT *\n"
                + "  FROM [CodeCoach].[dbo].[tinhthanhpho]";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new TinhThanhPho(rs.getString(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<QuanHuyen> getDistrictByCityID(String id) {
        List<QuanHuyen> list = new ArrayList<>();
        String querry = "SELECT *\n"
                + "  FROM [CodeCoach].[dbo].[quanhuyen] where mattp = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new QuanHuyen(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }
}
