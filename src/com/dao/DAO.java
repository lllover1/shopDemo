package com.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.entiry.*;

public class DAO {
	public List<Items> getItemsList(){
		Connection cnn=com.db.DbHelpper.getConnection();
		PreparedStatement pst=null;
		ResultSet rs=null;
		List<Items> itemsList=new ArrayList<Items>();
		String str="select * from items";
		try {
			 pst=cnn.prepareStatement(str);
			 rs=pst.executeQuery();
			 while(rs.next()){
					Items items=new Items();
					items.setId(rs.getInt("id"));
					items.setName(rs.getString("name"));
					items.setCity(rs.getString("city"));
					items.setNumble(rs.getInt("number"));
					items.setPrice(rs.getInt("price"));
					items.setPicture(rs.getString("picture"));
					itemsList.add(items);
					
			 }
			 return itemsList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		finally{
			if(rs!=null){
				rs=null;
			}
			if(pst!=null){
				pst=null;
			}
		}

	}
	
	public Items getItems(int id){
		Connection cnn=com.db.DbHelpper.getConnection();
		PreparedStatement pst=null;
		ResultSet rs=null;
		String str="select * from items where id=?";
		try {
			 pst=cnn.prepareStatement(str);
			 pst.setInt(1, id);
			 rs=pst.executeQuery();
			 if(rs.next()){
					Items items=new Items();
					items.setId(rs.getInt("id"));
					items.setName(rs.getString("name"));
					items.setCity(rs.getString("city"));
					items.setNumble(rs.getInt("number"));
					items.setPrice(rs.getInt("price"));
					items.setPicture(rs.getString("picture"));
					return items;
			 }
			 else{
				 return null;
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		finally{
			if(rs!=null){
				rs=null;
			}
			if(pst!=null){
				pst=null;
			}
		}
	}

    public List<Items> getCookieItems(String list){
    	List<Items> itemsList=new ArrayList<Items>();
    	itemsList=new ArrayList<Items>();
    	String[] str=list.split(",");
    	
    	int iCount=5;
    	if(str!=null&&str.length>0){
    		if(str.length>=iCount){
    			
    			for(int i=str.length-1;i>str.length-iCount-1;i--){
   
    				Items items=new Items();
    				if(str[i]!=null){
    					items=getItems(Integer.parseInt(str[i]));
    				}
    				itemsList.add(items);
    
    			}
    		}else{
    			
    			for(int i=str.length-1;i>0;i--){
    				Items items=new Items();
    				items=getItems(Integer.parseInt(str[i]));
    				itemsList.add(items);
    			}
    			
    		}
    		return itemsList;
    	}else{
    		return null;
    	}
    }
}
