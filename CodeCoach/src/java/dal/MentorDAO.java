/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;
import model.Mentors;
import model.Skills;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Duy Thai
 */
public class MentorDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Mentors> getAll() {
        List<Mentors> list = new ArrayList<>();
        String query = "Select * from mentors";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Mentors(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Mentors getMentorByMentorId(int mentorId) {
        String query = "select * from mentors where mentorId =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, mentorId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Mentors mentor = new Mentors(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4));
                return mentor;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public List<Integer> getMentorBySearch(String searchTxt){
        List<Integer> list = new ArrayList<>();
            String query = "select m.mentorId \n" +
                            "from Users u left join Mentors m \n" +
                            "on u.userId = m.userId inner join quanhuyen qh on u.maqh = qh.maqh inner join tinhthanhpho ttp on qh.mattp = ttp.mattp join Expertise e \n" +
                            "on m.mentorId = e.mentorId  join Skills sk\n" +
                            "on e.skillId = sk.skillId  join SubCategories sc\n" +
                            "on sk.subCategoryId = sc.subCategoryId join Categories c \n" +
                            "on sc.categoryId = c.categoryId\n" +
                            "where u.fName like ? or u.lName like ? or sk.skillName like ? or sc.subCategoryName like ? or c.categoryName like ?";
            try{
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query);
                ps.setString(1, "%"+searchTxt+"%");
                ps.setString(2, "%"+searchTxt+"%");
                ps.setString(3, "%"+searchTxt+"%");
                ps.setString(4, "%"+searchTxt+"%");
                ps.setString(5, "%"+searchTxt+"%");
                rs = ps.executeQuery();
                while(rs.next()){
                    list.add(rs.getInt(1));
                }
           }
            catch(Exception e) {
                System.out.println(e);
            }
            return list;
    }
//    public List<Integer> getAllMentorIdBySkillId(int skillId) {
//        String query = "select * from expertise where skillid =?";
//        List<Integer> list = new ArrayList<>();
//        try {
//            conn = new DBContext().getConnection();
//            ps = conn.prepareStatement(query);
//            ps.setInt(1, skillId);
//            rs = ps.executeQuery();
//            while(rs.next()){
//                list.add(rs.getInt(2));
//            }
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//        return list;
//    }

    public static void main(String[] args) {
        MentorDAO mdao = new MentorDAO();
        UserDAO udao = new UserDAO();
        List<Integer> listMId = mdao.getMentorBySearch("java");
        List<Object[]> listUInfo = new ArrayList<>();
        for (Integer mentorId : listMId) {
            Object[] uInfo = udao.getUserInfoByMentorIdForSearch(mentorId);
            listUInfo.add(uInfo);
        }
        for (Object[] objects : listUInfo) {
            for(int i = 0; i < objects.length; i++){
                System.out.print(objects[i] + " ");
            }
            System.out.println("");
        }
    }

}
