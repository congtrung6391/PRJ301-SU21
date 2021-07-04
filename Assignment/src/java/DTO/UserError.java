/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import java.io.Serializable;

/**
 *
 * @author congt
 */
public class UserError  implements Serializable {
    private int userId ;
    private String usernameError ;
    private String passwordError ;
    private String roleError ;
    private String nameError ;
    private String PhoneError;
    private String AddressError;

    public UserError() {
        this.userId = -1;
        this.usernameError = null;
        this.passwordError = null;
        this.roleError = null;
        this.nameError = null;
        this.PhoneError = null;
        this.AddressError = null;
    }

    public UserError(int userId, String usernameError, String passwordError, String roleError, String nameError, String PhoneError, String AddressError) {
        this.userId = userId;
        this.usernameError = usernameError;
        this.passwordError = passwordError;
        this.roleError = roleError;
        this.nameError = nameError;
        this.PhoneError = PhoneError;
        this.AddressError = AddressError;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsernameError() {
        return usernameError;
    }

    public void setUsernameError(String usernameError) {
        this.usernameError = usernameError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getRoleError() {
        return roleError;
    }

    public void setRoleError(String roleError) {
        this.roleError = roleError;
    }

    public String getNameError() {
        return nameError;
    }

    public void setNameError(String nameError) {
        this.nameError = nameError;
    }

    public String getPhoneError() {
        return PhoneError;
    }

    public void setPhoneError(String PhoneError) {
        this.PhoneError = PhoneError;
    }

    public String getAddressError() {
        return AddressError;
    }

    public void setAddressError(String AddressError) {
        this.AddressError = AddressError;
    }
    
    
}
