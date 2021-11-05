
package dataaccess;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import models.User;

public class UserDB {
    
public List<User> getAll() throws Exception {
        List<User> users = new ArrayList<>();
        ConnectionPool cp = ConnectionPool.getInstance();
        Connection con = cp.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        String sql = "SELECT * FROM user;";
        
         try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String email = rs.getString(1);
                boolean isActive = rs.getBoolean(2);
                String first_name = rs.getString(3);
                String last_name = rs.getString(4);
                String password = rs.getString(5);
                int roleId = rs.getInt(6);
                
                User newUser = new User(email, isActive, first_name, last_name, password, roleId);
                users.add(newUser);
            }
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            cp.freeConnection(con);
        }
        return users;
    }
    
    
    public void insert(User newUser) throws Exception{
        ConnectionPool cp = ConnectionPool.getInstance();
        Connection con = cp.getConnection();
        PreparedStatement ps = null;
        String sql = "INSERT INTO user (email, active, first_name, last_name, password, role) VALUES (?, ?, ?, ?, ?, ?)";
        
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, newUser.getEmail());
            ps.setBoolean(2, newUser.isActive());
            ps.setString(3, newUser.getFirst_name());
            ps.setString(4, newUser.getLast_name());
            ps.setString(5, newUser.getPassword());
            ps.setInt(6, newUser.getRole());
            ps.executeUpdate();
            System.out.println("added a new user");
        } finally {
            DBUtil.closePreparedStatement(ps);
            cp.freeConnection(con);
        }
    }
    
    public void delete(User user) throws Exception {
        ConnectionPool cp = ConnectionPool.getInstance();
        Connection con = cp.getConnection();
        PreparedStatement ps = null;
        String sql = "DELETE FROM user WHERE email=?";
        
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, user.getEmail());
            ps.executeUpdate();
        } finally {
            DBUtil.closePreparedStatement(ps);
            cp.freeConnection(con);
        }
    }
    
        public User get(String email) throws Exception {
        User user = new User();
        ConnectionPool cp = ConnectionPool.getInstance();
        Connection con = cp.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM user WHERE email=?";
        
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if(rs.next()){
                String email2 = rs.getString(1);
                Boolean isActive = rs.getBoolean(2);
                String firstName2 = rs.getString(3);
                String lastName2 = rs.getString(4);
                String password2 = rs.getString(5);
                int role2 = rs.getInt(6);
                user = new User(email2, isActive, firstName2, lastName2, password2, role2);
            }
        } finally {
            DBUtil.closePreparedStatement(ps);
            cp.freeConnection(con);
        }
       return user;
            
    }
        
        public void update(User user) throws Exception {
        ConnectionPool cp = ConnectionPool.getInstance();
        Connection con = cp.getConnection();
        PreparedStatement ps = null;
        String sql = "UPDATE user SET email=?, active=?, first_name=?, last_name=?, password=?, role=? WHERE email=?";
        
        try {
            ps = con.prepareStatement(sql);
                ps.setString(1, user.getEmail());
                ps.setBoolean(2, user.isActive());
                ps.setString(3, user.getFirst_name());
                ps.setString(4, user.getLast_name());
                ps.setString(5, user.getPassword());
                ps.setInt(6, user.getRole());
                ps.setString(7, user.getEmail());
            ps.executeUpdate();
        } finally {
            DBUtil.closePreparedStatement(ps);
            cp.freeConnection(con);
        }
    }
}
