/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Skills;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Duy Thai
 */
public class SkillDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    private final String getSkillBySkillId = "SELECT * FROM [dbo].[Skills] WHERE skillId = ?";

    public Skills getSkillBySkillId(int skillId) {
        Skills skill = new Skills();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(getSkillBySkillId);
            ps.setInt(1, skillId);
            rs = ps.executeQuery();
            while (rs.next()) {
                skill = new Skills(rs.getInt(1), rs.getString(2), rs.getInt(3));
            }
        } catch (Exception e) {
        }
        return skill;
    }

    public List<Skills> getAll() {
        List<Skills> list = new ArrayList<>();
        String querry = "Select * from skills";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Skills(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Skills> getTop8() {
        List<Skills> list = new ArrayList<>();
        String querry = "Select top 8 * from skills order by skillId";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Skills(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Skills> getNext8(int amount) {
        List<Skills> list = new ArrayList<>();
        String querry = "Select * from skills order by skillId offset ? rows fetch next 8 rows only";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            ps.setInt(1, amount);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Skills(rs.getInt(1), rs.getString(2), rs.getInt(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getTotalSkill() {
        String query = "select count(skillId) as Total from skills";
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

    public List<Object[]> getTop5MostBookedSkills(){
        String query = "SELECT top 5 s.skillName, COUNT(*) AS occurrence FROM booking b JOIN Skills s ON b.skillId = s.skillId GROUP BY s.skillName order by occurrence desc;";
        List<Object[]> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
               Object[] skillOccurrence = new Object[4];
               skillOccurrence[0] = rs.getString("skillName");
               skillOccurrence[1] = rs.getInt("occurrence");
               list.add(skillOccurrence);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    private static String GET_SKILLID_BY_NAME = "SELECT skillId FROM Skills WHERE skillName = ?";

    public int getSkillIdByName(String skill) {
        int skillId = 0;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(GET_SKILLID_BY_NAME);
            ps.setString(1, skill);
            rs = ps.executeQuery();
            while (rs.next()) {
                skillId = rs.getInt("skillId");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return skillId;
    }
}
