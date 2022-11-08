/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manager;

import dao.DishDAO;
import dao.OrderDAO;
import entity.Dish;
import entity.Order;
import java.util.ArrayList;

/**
 *
 * @author phuon
 */
public class OrderManager  {
    private ArrayList<Order> listOder;
    private OrderDAO  myOrderDAO;
    
      public OrderManager() {
        this.listOder = new ArrayList();
        myOrderDAO=new OrderDAO();
        myOrderDAO.createFolder();
        
    }
    
    public OrderManager(ArrayList<Order> listOrder)
    {
        this.listOder= listOrder;
        myOrderDAO =new OrderDAO();
    }
     public Order getOrderByID(String id) {
        Order resOrder = null;
        for (int i = 0; i < this.listOder.size(); i++) {
            Order currentOrder = listOder.get(i);
            if (currentOrder.getId().equalsIgnoreCase(id)) {
                return currentOrder ;
            }
        }
        return resOrder;
    }
       public ArrayList getListOrder() {
        return this.listOder;
    }
       public boolean updateOrder(Order edittedOrder) {
        boolean result = false;
        Order oldOrder;
        
        oldOrder= this.getOrderByID(edittedOrder.getId());
        if (oldOrder != null) {
            int i = this.listOder.indexOf(oldOrder);
            this.listOder.remove(i);
            this.listOder.add(i, edittedOrder);
            result = true;
        }
        return result;
    }

    public int saveByteData()
    {
        this.myOrderDAO.saveListOrderAsByte(listOder);
        return this.listOder.size();
    }
    
    public int saveCharData()
    {
        this.myOrderDAO.saveListOrderAsByte(listOder);
        return this.listOder.size();
    }
    
    public int getByteData()
    {
        this.listOder= this.myOrderDAO.readListOrderAsByte();
        if(listOder==null)
        {
            listOder=new ArrayList<>();
        }
        return this.listOder.size();
    }
    
}
