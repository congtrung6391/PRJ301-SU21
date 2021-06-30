/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author khang
 */
public class LaptopDTO implements Serializable{
    private int id;
    private String name ;
    private float price ;
    private String CPU;
    private String Ram;
    private String Screen ;
    private String Graphic;
    private String Disk ;
    private String OS ;
    private float weight;
    private String region;
    private int Year;

    public LaptopDTO() {
    }

    public LaptopDTO(int id, String name, float price, String CPU, String Ram, String Screen, String Graphic, String Disk, String OS, float weight, String region, int Year) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.CPU = CPU;
        this.Ram = Ram;
        this.Screen = Screen;
        this.Graphic = Graphic;
        this.Disk = Disk;
        this.OS = OS;
        this.weight = weight;
        this.region = region;
        this.Year = Year;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getCPU() {
        return CPU;
    }

    public void setCPU(String CPU) {
        this.CPU = CPU;
    }

    public String getRam() {
        return Ram;
    }

    public void setRam(String Ram) {
        this.Ram = Ram;
    }

    public String getScreen() {
        return Screen;
    }

    public void setScreen(String Screen) {
        this.Screen = Screen;
    }

    public String getGraphic() {
        return Graphic;
    }

    public void setGraphic(String Graphic) {
        this.Graphic = Graphic;
    }

    public String getDisk() {
        return Disk;
    }

    public void setDisk(String Disk) {
        this.Disk = Disk;
    }

    public String getOS() {
        return OS;
    }

    public void setOS(String OS) {
        this.OS = OS;
    }

    public float getWeight() {
        return weight;
    }

    public void setWeight(float weight) {
        this.weight = weight;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public int getYear() {
        return Year;
    }

    public void setYear(int Year) {
        this.Year = Year;
    }
    
}
