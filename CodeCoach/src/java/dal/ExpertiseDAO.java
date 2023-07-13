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
import model.Expertise;

/**
 *
 * @author Duy Thai
 */
public class ExpertiseDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Expertise> getExpertiseByMentorId(int mentorId) {
        String query = "select * from Expertise where mentorId =?";
        List<Expertise> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, mentorId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Expertise(rs.getInt(1), rs.getInt(2), rs.getInt(3)));
            }
        } catch (Exception e) {
        }

        return list;
    }

    public List<Object[]> getExpertiseDetailsByMentorId(int mentorId) {
    String query = "SELECT e.expertiseId, e.mentorId, e.skillId, s.skillName FROM Expertise e JOIN Skills s ON e.skillId = s.skillId WHERE e.mentorId = ?";
    List<Object[]> list = new ArrayList<>();

    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        ps.setInt(1, mentorId);
        rs = ps.executeQuery();

        while 
                (rs.next()) {
            Object[] expertiseDetails = new Object[4];
            // Populate the array with data from the ResultSet
            expertiseDetails[0] = rs.getInt(1);
            expertiseDetails[1] = rs.getInt(2);
            expertiseDetails[2] = rs.getInt(3);
            expertiseDetails[3] = rs.getString(4);

            list.add(expertiseDetails);
        }
    } catch (Exception e) {
        
    } 

    return list;
}



}
