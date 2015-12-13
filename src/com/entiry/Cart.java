package com.entiry;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

public class Cart {
	private HashMap<Items,Integer> goods;
	private Double totalPrice;
	
	public Cart(){
		goods=new HashMap<Items,Integer>();
		totalPrice=0.0;
	}
	
	public boolean addGoods(Items items, int number){
		if (goods.containsKey(items)){
			goods.put(items, number+goods.get(items));
		}else{
			goods.put(items, number);
		}
		calTotalPrice();
		return true;
	}
	
	public boolean deleteGoods(Items items){
		goods.remove(items);
		calTotalPrice();
		return true;
	}
	
	public Double calTotalPrice(){
		Double sum=0.0;
		Set<Items> items = goods.keySet();
		Iterator<Items> it=items.iterator();
		while(it.hasNext()){
			sum+= ((Items) it).getPrice()*goods.get(it);
		}
		this.setTotalPrice(sum);
		return this.getTotalPrice();
		
	}
	public void setGoods(HashMap<Items, Integer> goods) {
		this.goods = goods;
	}
	
	public HashMap<Items, Integer> getGoods() {
		return goods;
	}
	public Double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}

}
