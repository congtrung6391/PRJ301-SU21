/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import java.io.Serializable;

/**
 *
 * @author khang
 */
public class OrderDTO implements Serializable{
    private UserDTO user ;
    private String Address ;
    private float totalprice;

    public OrderDTO() {
    }

    public OrderDTO(UserDTO user, String Address, float totalprice) {
        this.user = user;
        this.Address = Address;
        this.totalprice = totalprice;
    }

    public UserDTO getUser() {
        return user;
    }

    public void setUser(UserDTO user) {
        this.user = user;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public float getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(float totalprice) {
        this.totalprice = totalprice;
    }
    
}
