package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DAO;
import com.entiry.Cart;

import com.entiry.Items;

public class Servlet extends HttpServlet {
	private String action;
	private DAO dao;

	/**
	 * Constructor of the object.
	 */
	public Servlet() {
		action=null;
		dao=new DAO();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		action=request.getParameter("action");
		if(action.equals("add")){
			if ( addCart(request,response) ){
				request.getRequestDispatcher("/sucess.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("/failure.jsp").forward(request, response);
			}
		}
		if(action.equals("show")){
			request.getRequestDispatcher("/cart.jsp").forward(request, response);
		}
		
		if(action.equals("delete")) //如果是执行删除购物车中的商品
		{
			if(deleteFromCart(request,response))
			{
				request.getRequestDispatcher("/cart.jsp").forward(request, response);
			}
			else
			{
				request.getRequestDispatcher("/cart.jsp").forward(request, response);
			}
		}
		
	}
	
	private boolean deleteFromCart(HttpServletRequest request, HttpServletResponse response)
	{
		String id = request.getParameter("id");
		Cart cart = (Cart)request.getSession().getAttribute("cart");
	    Items item = dao.getItems(Integer.parseInt(id));
	    if(cart.deleteGoods(item))
	    {
	    	return true;
	    }
	    else
	    {
	    	return false;
	    }
	}
	
	public boolean addCart(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		int id = Integer.parseInt(request.getParameter("id"));
		int num = Integer.parseInt(request.getParameter("num"));
		if(session.getAttribute("cart")==null) {
			Cart cart = new Cart();
			session.setAttribute("cart",cart);
		 }
		Cart cart = (Cart)session.getAttribute("cart");
	
		
		if (cart.addGoods(dao.getItems(id),num)){
			return true;
		}else{
			return false;
		}
	}
	
    public boolean showCart(HttpServletRequest request, HttpServletResponse response){
		return true;
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
