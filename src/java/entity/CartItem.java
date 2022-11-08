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
public class CartItem {
   private Dish dish;
   private int quantity;

    public CartItem(Dish dish, int quantity) {
        this.dish = dish;
        this.quantity = quantity;
    }

    public Dish getDish() {
        return dish;
    }

    public void setDish(Dish dish) {
        this.dish = dish;
    }

    public int getQuantity() {
        return quantity;
    }

    public void increase(int quantity) {
        this.quantity +=quantity;
    }
    public double getSumValue(){
        double sumValue = dish.price*this.quantity;
        return sumValue;
    }
    
    
    
    
   
   
}
