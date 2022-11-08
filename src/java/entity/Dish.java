/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.awt.Image;
import java.io.Serializable;

/**
 *
 * @author phuon
 */
public class Dish implements Serializable{
    public String ID;
    public String name;
    public String type;
    public int price;
    public String description;
    public String picture;

    public Dish(String ID, String name, String type, int price, String description, String picture) {
        this.ID = ID;
        this.name = name;
        this.type = type;
        this.price = price;
        this.description = description;
        this.picture = picture;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    
    

       

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
      public String getDishStringInfoAsString() {
        String str = this.ID;
        str += "," + this.name;
        str += "," + this.type;
        str += "," + this.description;
        str += "," + this.price;
        str += "," + this.picture;
      

        return str;

    }
}
