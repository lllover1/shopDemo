package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbHelpper {
	private static final String driver="com.mysql.jdbc.Driver";
	private static final String url=
			"jdbc:mysql://localhost:3306/shopping?useUnicode=true";
	private static final String user="root";
	private static final String password="llw854597236";
	private static Connection cnn=null;
	static{
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("��������ʧ��");
		}
	}
	public static Connection getConnection(){
		if(cnn==null){
			try {
				cnn=DriverManager.getConnection(url, user, password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("����ʧ��");
			}
		}
		return cnn;
	}
	
	public static void main(String[] args){
		Connection c=getConnection();
		if(c==null){
			System.out.println("���ݿ����ʧ��");
		}else{
			System.out.println("���ݿ���سɹ�");
		}
	}
}