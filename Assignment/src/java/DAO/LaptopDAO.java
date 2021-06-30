/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUtils.DBHelper;
import DTO.LaptopDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;

/**
 *
 * @author khang
 */
public class LaptopDAO {
    public ArrayList<LaptopDTO> SearchLaptop (String name , float minPrice, float maxPrice, int minYear, int maxYear) throws NamingException, SQLException{
        Connection con = null ;
        PreparedStatement ps = null;
        ResultSet rs = null ;
        ArrayList<LaptopDTO> laptopList = null;
        try {

            con = DBHelper.makeConnection();
            if (con != null){
                String sql = "select LaptopID,Price,Name,CPU,Ram,Screen,Graphic,Disk,OS,Weight,Region,Year "
                        + "from Laptop "
                        + "where name like ? and Price > ? and Price < ? and Year > ? and Year < ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, "%"+name+"%");
                ps.setFloat(2, minPrice);
                ps.setFloat(3, maxPrice);
                ps.setInt(4, minYear);
                ps.setInt(5, maxYear);
                rs = ps.executeQuery();
                laptopList = new ArrayList();
                while (rs.next()){
                    int id = rs.getInt("LaptopID");
                    float price = rs.getFloat("Price");
                    String laptopname = rs.getString("Name");
                    String CPU = rs.getString("CPU");
                    String ram = rs.getString("Ram");
                    String Screen = rs.getString("Screen");
                    String graphic = rs.getString("Graphic");
                    String disk = rs.getString("Disk");
                    String OS = rs.getString("OS");
                    float weight = rs.getFloat("Weight");
                    String region = rs.getString("Region");
                    int year = rs.getInt("Year");
                    LaptopDTO dto = new LaptopDTO(id, laptopname, price, CPU, ram, Screen, graphic, disk, OS, weight, region, year);
                    laptopList.add(dto);
                }
                return laptopList;
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
        return null;
    }
    public boolean CreateLaptop () throws NamingException, SQLException{
        Connection con = null ;
        PreparedStatement ps = null;
        ResultSet rs = null ;
        try {

            con = DBHelper.makeConnection();
            if (con != null){
                String sql = "a";
                
                while (rs.next()){
                    
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
        return false;
    }
}
