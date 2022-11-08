/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.ArrayList;

/**
 *
 * @author phuon
 */
public class Cart {

    private ArrayList<CartItem> listItem;

    public Cart(ArrayList<CartItem> listItem) {
        this.listItem = listItem;
    }

    public ArrayList<CartItem> getListItem() {
        return listItem;
    }

    public void setListItem(ArrayList<CartItem> listItem) {
        this.listItem = listItem;
    }

    public void addItem(CartItem cartItem) {
        int index = checkItemExist(cartItem);
        if (index != -1) {
            this.listItem.get(index).increase(1);
        } else {
            this.listItem.add(cartItem);
        }
    }

    public int checkItemExist(CartItem cartItem) {
        int index = -1;
        for (int i = 0; i < listItem.size(); i++) {
            if (listItem.get(i).getDish().getID().equalsIgnoreCase(cartItem.getDish().getID())) {
                return i;
            }
        }

        return index;
    }

    public double getTotal() {
        double total = 0;
        for (int i = 0; i < listItem.size(); i++) {
            total += listItem.get(i).getSumValue();
        }
        return total;
    }

}
