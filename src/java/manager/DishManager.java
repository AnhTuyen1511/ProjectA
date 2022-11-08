/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manager;

import dao.DishDAO;
import entity.Dish;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author ThanhDaiMacW10
 */
public class DishManager {

    private ArrayList<Dish> listDish;
    private DishDAO myDishDao;
    

    public DishManager() {
        this.listDish = new ArrayList();
        myDishDao=new DishDAO();
        myDishDao.createFolder();
        
    }
    
    public DishManager(ArrayList<Dish> listDish)
    {
        this.listDish= listDish;
        myDishDao=new DishDAO();
    }
    
    public Dish getDishbyID(String id) {
        Dish resDish = null;
        for (int i = 0; i < this.listDish.size(); i++) {
            Dish currentDish = listDish.get(i);
            if (currentDish.getID().equalsIgnoreCase(id)) {
                return currentDish;
            }
        }
        return resDish;
    }
    public boolean addDish(Dish dish) {
        boolean result = false;
//        String id=cd.getCdID();
//        CD foundCD=this.getDishbyID(id);
//        if(foundCD==null)
        if (this.getDishbyID(dish.getID()) == null) {
            this.listDish.add(dish);
            result = true;
        }
        return result;
    }

    public boolean deleteDishbyID(String id) {
        boolean result = false;

        Dish foundDish = this.getDishbyID(id);
        if (foundDish != null) {
            this.listDish.remove(foundDish);
            result = true;
        }
        return result;
    }

    public ArrayList getListDish() {
        return this.listDish;
    }

   

    public ArrayList getDishByType(String type) {
        ArrayList resultDishlist = new ArrayList();

        Dish tempDish;
        for(int i=0;i<listDish.size();i++)
        {
            tempDish =listDish.get(i);
            if(tempDish.getType().toLowerCase().contains(type.toLowerCase()))
            {
                resultDishlist.add(tempDish);
            }
        }     
        return resultDishlist;
    }

//    public ArrayList getCDByCollection(String collection) {
//        ArrayList resultCdlist = new ArrayList();
//
//        CD tempCD;
//        for(int i=0;i<listCD.size();i++)
//        {
//            tempCD =listCD.get(i);
//            if(tempCD.getCollection().toLowerCase().contains(collection.toLowerCase()))
//            {
//                resultCdlist.add(tempCD);
//            }
//        }     
//        return resultCdlist;
//    }

//    public ArrayList getCDByPriceRang(float from, float to ) {
//        ArrayList resultCdlist = new ArrayList();
//
//        CD tempCD;
//        for(int i=0;i<listCD.size();i++)
//        {
//            tempCD =listCD.get(i);
//            if()
//            {
//                resultCdlist.add(tempCD);
//            }
//        }     
//        return resultCdlist;
//    }
    
    public boolean updateDish(Dish edittedDish) {
        boolean result = false;
        Dish oldDish;
        //        for(int i=0;i<this.listCD.size();i++)
        //        {
        //            oldCD=(CD)this.listCD.get(i);
        //            if(oldCD.getCdID().equalsIgnoreCase(edittedCD.getCdID()))
        //            {
        //                this.listCD.remove(i);
        //                this.listCD.add(i, edittedCD);
        //                result=true;
        //                break;
        //            }
        //        }
        oldDish = this.getDishbyID(edittedDish.getID());
        if (oldDish != null) {
            int i = this.listDish.indexOf(oldDish);
            this.listDish.remove(i);
            this.listDish.add(i, edittedDish);
            result = true;
        }
        return result;
    }

    public int saveByteData()
    {
        this.myDishDao.saveListDishAsByte(this.listDish);
        return this.listDish.size();
    }
    
    public int saveCharData()
    {
        this.myDishDao.saveListDishAsChar(this.listDish);
        return this.listDish.size();
    }
    
    public int getByteData()
    {
        this.listDish= this.myDishDao.readListDishAsByte();
        if(listDish==null)
        {
            listDish=new ArrayList<>();
        }
        return this.listDish.size();
    }

    
    
    
    
}
