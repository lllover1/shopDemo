package com.entiry;

public class Items {
	private int id;
	private String name;
	private String city;
	private int price;
	private int numble;
	private String picture;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getNumble() {
		return numble;
	}
	public void setNumble(int numble) {
		this.numble = numble;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return getId()+getName().hashCode();
	}
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		if(this==obj){
			return true;
		}else{
			if (obj instanceof Items){
				Items items = (Items) obj;
				if (this.getId()==items.getId()&&this.getName().equals(items.getName())) {
					return true;
				}else{
					return false;
				}
			}else{
				return false;
			}
		}
	}
	
	
}
