/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import configPkg.ConfigInfo;
import entity.CartItem;
import java.util.ArrayList;
import entity.Dish;
import java.awt.Image;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import javax.swing.ImageIcon;

/**
 *
 * @author ThanhDaiMacW10
 */
public class DishDAO {

    private String pathStr = ConfigInfo.getCtxRealPath() + "\\data";
    private String fileNameByte = "DishData_Byte.dat";
    private String fileNameChar = "DishData_Char.txt";
    private String fileNameByte_cart = "CartData_Byte.dat";
    private ImageIcon myImage;

    public DishDAO() {

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
        System.out.println("-------------------------" + folder.getAbsolutePath());
    }

    public void saveListDishAsByte(ArrayList<Dish> listDish) {
        FileOutputStream fos = null;
        ObjectOutputStream oos = null;

        try {
            fos = new FileOutputStream(this.pathStr + "\\" + this.fileNameByte);
            oos = new ObjectOutputStream(fos);

            oos.writeObject(listDish);
            oos.flush();
            oos.close();
            fos.close();
        } catch (IOException ex) {
            System.out.println("Exception:  " + ex.getMessage());
        }

    }

    public void saveListCartAsByte(ArrayList<CartItem> listDish) {
        FileOutputStream fos = null;
        ObjectOutputStream oos = null;

        try {
            fos = new FileOutputStream(this.pathStr + "\\" + fileNameByte_cart);
            oos = new ObjectOutputStream(fos);

            oos.writeObject(listDish);
            oos.flush();
            oos.close();
            fos.close();
        } catch (IOException ex) {
            System.out.println("Exception:  " + ex.getMessage());
        }
    }

    public ArrayList<Dish> readListDishAsByte() {

        FileInputStream fis = null;
        ObjectInputStream ois = null;

        try {
            fis = new FileInputStream(this.pathStr + "\\" + this.fileNameByte);
            ois = new ObjectInputStream(fis);

            ArrayList<Dish> listDish = (ArrayList<Dish>) ois.readObject();
 ois.close();
            fis.close();
            return listDish;

           
        } catch (IOException ex) {
            System.out.println("Exception:  " + ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.out.println("Exception:  " + ex.getMessage());
        }

        return null;
    }

    public ArrayList<CartItem> readListCartAsByte() {
        FileInputStream fis = null;
        ObjectInputStream ois = null;

        try {

            fis = new FileInputStream(this.pathStr + "\\" + this.fileNameByte_cart);
            ois = new ObjectInputStream(fis);

            ArrayList<CartItem> listDish = (ArrayList<CartItem>) ois.readObject();
            
             ois.close();
            fis.close();
            return listDish;

        } catch (IOException ex) {
            System.out.println("Exception:  " + ex.getMessage());
        } catch (ClassNotFoundException ex) {
            System.out.println("Exception:  " + ex.getMessage());
        }
        return null;
    }

    public void saveListDishAsChar(ArrayList<Dish> listDish) {
        FileWriter fw = null;
        BufferedWriter bw = null;
        try {
            fw = new FileWriter(this.pathStr + "\\" + this.fileNameChar);
            bw = new BufferedWriter(fw);
            Dish tempDish;

            for (int i = 0; i < listDish.size(); i++) {
                tempDish = listDish.get(i);
                bw.write(tempDish.getDishStringInfoAsString());
                bw.newLine();
            }
            bw.flush();
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
    }

}
