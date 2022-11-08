/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manager;

import dao.DishDAO;
import entity.CartItem;
import entity.Dish;
import java.util.ArrayList;

/**
 *
 * @author phuon
 */
public class CartManager {

//    private ArrayList listDish;
//    private DishDAO myDishDAO;
//
//    public CartManager() {
//        listDish = new ArrayList();
//    }
//
//    public CartManager(ArrayList listDish) {
//        this.listDish = listDish;
//    }
//
//    public boolean addBookIntoCart(CartItem cart) {
//        boolean result = false;
//        String name = cart.getCartName();
//        Dish foundBook = this.getDishByID(name);
//        if (foundBook == null) {
//            this.listDish.add(cart);
//            result = true;
//        }
//        return result;
//    }
//
//    public boolean deleteCart(String name) {
//        boolean result = false;
//        Dish foundB = this.getDishByID(name);
//        if (foundB != null) {
//            this.listDish.remove(foundB);
//            result = true;
//        }
//        return result;
//    }
//
//    private Dish getDishByID(String name) {
//        Dish resDish = null;
//        for (int i = 0; i < this.listDish.size(); i++) {
//            Dish curentBook = (Dish) listDish.get(i);
//            if (curentBook.getID().equalsIgnoreCase(name)) {
//                return curentBook;
//            }
//        }
//        return resDish;
//    }
//
//    public ArrayList getListDish() {
//        return this.listDish;
//    }
//
//    public int countQuantity(String name) {
//        ArrayList resultDishlist = new ArrayList();
//        CartItem temp;
//        int count = 0;
//        for (int i = 0; i < listDish.size(); i++) {
//            temp = (CartItem) listDish.get(i);
//            if (temp.getCartName()== name) {
//                count++;
//            }
//        }
//        return count;
//    }
//
//    public int saveByteData_Cart() {
//            this.myDishDAO.saveListCartAsByte(listDish);
//        return this.listDish.size();
//    }
//
//    public int getByteData_Cart() {
//        if (this.myDishDAO.readListCartAsByte() != null) {
//            this.listDish = this.myDishDAO.readListCartAsByte();
//        }
//
//        return this.listDish.size();
//    }


}
