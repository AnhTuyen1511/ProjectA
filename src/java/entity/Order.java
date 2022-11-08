/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author phuon
 */
public class Order {
    public String id;
    public String name;
    public int unitSold;
    public String status;

    public Order(String id, String name, int unitSold, String status) {
        this.id = id;
        this.name = name;
        this.unitSold = unitSold;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public int getUnitSold() {
        return unitSold;
    }

    public void setUnitSold(int unitSold) {
        this.unitSold = unitSold;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    public String getOrderInfoAsString(){
        String str = this.id;
        str += "\t" + this.name;
        str += "\t" + this.unitSold;
        str += "\t" + this.status;
        return str;
    }
}
