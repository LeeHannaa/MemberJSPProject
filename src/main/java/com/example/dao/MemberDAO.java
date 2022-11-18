package com.example.dao;

import com.example.bean.MemberVO;
import com.example.util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;

    private final String M_INSERT = "insert into member(userid, password, username, phone, email, blogurl, photo, detail)" + "values(?,sha1(?),?,?,?,?,?,?)";
    private final String M_UPDATE = "update member set username=?, email=?, phone=?, photo=?, detail=?" + "where sid=?";
    private final String M_DELETE = "delete from member where sid=?";
    private final String M_SELECT = "select * from member where sid=?";
    private final String M_LIST = "select * from member order by regdate desc";

    public int insertMember(MemberVO data){
        System.out.println("===> JDBC로 insertMember() 기능 처리");
        conn = JDBCUtil.getConnection();
        try{
            stmt = conn.prepareStatement(M_INSERT);
            stmt.setString(1, data.getUserid());
            stmt.setString(2, data.getPassword());
            stmt.setString(3, data.getUsername());
            stmt.setString(4, data.getPhone());
            stmt.setString(5, data.getEmail());
            stmt.setString(6, data.getBlogurl());
            stmt.setString(7, data.getPhoto());
            stmt.setString(8, data.getDetail());
            stmt.executeUpdate();

            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    public void deleteMember(MemberVO data) {
        System.out.println("===> JDBC로 deleteMember() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(M_DELETE);
            stmt.setInt(1, data.getSid());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public int updateMember(MemberVO data) {
        System.out.println("===> JDBC로 updateMember() 기능 처리");
        conn = JDBCUtil.getConnection();
        try {
            stmt = conn.prepareStatement(M_UPDATE);
            stmt.setString(1, data.getUsername());
            stmt.setString(2, data.getEmail());
            stmt.setString(3, data.getPhone());
            stmt.setString(4, data.getPhoto());
            stmt.setString(5, data.getDetail());
            stmt.setInt(6, data.getSid());

            System.out.println(data.getUserid() + "-" + data.getPassword() + "-" + data.getPhone() + "-"  + data.getUsername() + "-" + data.getEmail() + "-" + data.getPhoto() + "-" + data.getDetail());
            stmt.executeUpdate();
            return 1;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    public MemberVO getOne(int sid) {
        System.out.println("===> JDBC로 getMember() 기능 처리");
        MemberVO one = null;
        conn = JDBCUtil.getConnection();
        try {
            stmt = conn.prepareStatement(M_SELECT);
            stmt.setInt(1, sid);
            rs = stmt.executeQuery();
            if(rs.next()) {
                one = new MemberVO();
                one.setSid(rs.getInt("sid"));
                one.setUserid(rs.getString("userid"));
                one.setUsername(rs.getString("username"));
                one.setEmail(rs.getString("email"));
                one.setPhone(rs.getString("phone"));
                one.setPhoto(rs.getString("photo"));
                one.setBlogurl(rs.getString("blogurl"));
                one.setDetail(rs.getString("detail"));
                one.setRegdate(rs.getDate("regdate"));
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return one;
    }
    public List<MemberVO> getList(){
        System.out.println("===> JDBC로 getList() 기능 처리");
        List<MemberVO> list = new ArrayList<MemberVO>();
        conn = JDBCUtil.getConnection();
        try {
            stmt = conn.prepareStatement(M_LIST);
            rs = stmt.executeQuery();
            while(rs.next()) {
                MemberVO one = new MemberVO();
                one.setSid(rs.getInt("sid"));
                one.setUserid(rs.getString("userid"));
                one.setUsername(rs.getString("username"));
                one.setEmail(rs.getString("email"));
                one.setPhoto(rs.getString("photo"));
                one.setPhone(rs.getString("phone"));
                one.setBlogurl(rs.getString("blogurl"));
                one.setDetail(rs.getString("detail"));
                one.setRegdate(rs.getDate("regdate"));
                list.add(one);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public String getPhotoFilename(int sid){
        String filename = null;
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(M_SELECT);
            stmt.setInt(1,sid);
            rs = stmt.executeQuery();
            if(rs.next()){
                filename = rs.getString("photo");
            }
            rs.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        System.out.println("===> JDBC로 getPhotoFilename() 기능 처리");
        return filename;
    }
}

