/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import DBUtils.DBHelper;
import java.sql.SQLException;
import javax.naming.NamingException;
/**
 *
 * @author khang
 */
public class CheckoutDAO {
    public int createOrder (int userId, String address, float totalprice) throws NamingException, SQLException{
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "insert into Orders "
                + "values (?,?,?)";
        int orderId  = -1;
        try {
            con = DBHelper.makeConnection();
            if (con != null){
                ps = con.prepareStatement(sql);
                ps.setInt(1, userId);
                ps.setString(2, address);
                ps.setFloat(3, totalprice);
                ps.executeUpdate();
                
                sql = "select @@IDENTITY as OrderID";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                if (rs.next()){
                    orderId = rs.getInt("OrderID");
                }
            }
        }
        finally{
            if (rs != null){
                rs.close();
            }
            if (ps != null){
                ps.close();
            }
            if (con != null){
                con.close();
            }
        }
        return orderId;
    }
    public boolean createOrderDetail (int orderId,int laptopId,int quantity) throws NamingException, SQLException{
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "insert into OrderDetail "
                + "values (?,?,?)";
        try {
            con = DBHelper.makeConnection();
            if (con != null){
                ps = con.prepareStatement(sql);
                ps.setInt(1, orderId);
                ps.setInt(2,quantity );
                ps.setInt(3, laptopId);
                int i =  ps.executeUpdate();
                if (i > 0) return true;
            }
        }
        finally{
            if (rs != null){
                rs.close();
            }
            if (ps != null){
                ps.close();
            }
            if (con != null){
                con.close();
            }
        }
        return false;
    }
}
