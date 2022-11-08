/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Dish;
import entity.Order;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;

/**
 *
 * @author phuon
 */
public class OrderDAO {
     private String pathStr = "Data\\Private";
    private String fileNameByte = "DishData_Byte.dat";
    private String fileNameChar = "DishData_Char.txt";

    public OrderDAO() {
        
        this.createFolder();
    }

    
    
    public void createFolder() {
        File folder = new File(pathStr);

        if (folder.exists()) {
            System.out.println("Folder exists");
        } else {
            System.out.println("Folder not exists");
            folder.mkdirs();
            System.out.println("Folder created");
        }
        System.out.println("-------------------------"+folder.getAbsolutePath());
    }

    public void saveListOrderAsByte(ArrayList<Order> listOrder) {
        FileOutputStream fos = null;
        ObjectOutputStream oos = null;

        try {
            fos = new FileOutputStream(this.pathStr + "\\" + this.fileNameByte);
            oos = new ObjectOutputStream(fos);

            oos.writeObject(listOrder);
            oos.flush();
        } catch (IOException ex) {
            System.out.println("Exception:  " + ex.getMessage());
        }
        
    }

    public ArrayList<Order> readListOrderAsByte() {

        FileInputStream fis = null;
        ObjectInputStream ois = null;

        try {
            fis = new FileInputStream(this.pathStr + "\\" + this.fileNameByte);
            ois = new ObjectInputStream(fis);

            ArrayList<Order> listOrder = (ArrayList<Order>) ois.readObject();

            return listOrder;

        } catch (IOException ex) {
            System.out.println("Exception:  " + ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.out.println("Exception:  " + ex.getMessage());
        }

        return null;
    }

    public void saveListAsChar(ArrayList<Order> listOrder) {
        FileWriter fw = null;
        BufferedWriter bw = null;
        try {
            fw = new FileWriter(this.pathStr + "\\" + this.fileNameChar);
            bw = new BufferedWriter(fw);
            Order tempOrder;

            for (int i = 0; i < listOrder.size(); i++) {
                tempOrder = listOrder.get(i);                
                bw.write(tempOrder.getOrderInfoAsString());
                bw.newLine();
            }
            bw.flush();
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
    }

}
