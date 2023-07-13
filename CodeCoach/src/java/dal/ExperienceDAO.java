/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Experience;
import model.Roles;

/**
 *
 * @author Duy Thai
 */
public class ExperienceDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Experience> getExperienceByMentorId(int mentorId) {
        String query = "select * from Experience where mentorId =?";
        List<Experience> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, mentorId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Experience(rs.getInt(1), rs.getInt(2), rs.getString(3)));
            }
        } catch (Exception e) {
        }

        return list;
    }
    

}


