<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.dao.DAO" %>
<%@ page import="com.entiry.Items" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'details.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/main.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="js/lhgcore.js"></script>
    <script type="text/javascript" src="js/lhgdialog.js"></script>
    <script type="text/javascript">
      function selflog_show(id)
      { 
         var num =  document.getElementById("number").value; 
         J.dialog.get({id: 'haoyue_creat',title: '购物成功',width: 600,height:400, link: '<%=path%>/com.servlet/Servlet?id='+id+'&num='+num+'&action=add', cover:true});
      }
	function add()
      {
         var num = parseInt(document.getElementById("number").value);
         if(num<100)
         {
            document.getElementById("number").value = ++num;
         }
      }
      function sub()
      {
         var num = parseInt(document.getElementById("number").value);
         if(num>1)
         {
            document.getElementById("number").value = --num;
         }
      }
     
    </script>
	
	<style type="text/css">
	 hr{
	     
	     border-color:FF7F00; 
	   }
	   
	   div{
	      float:left;
	      margin-left: 30px;
	      margin-right:30px;
	      margin-top: 5px;
	      margin-bottom: 5px;
	     
	div dd{
	margin:0px;
	font-size:10pt;
	}
	div dd.dd_name
	   {
	      color:blue;
	   }
	div dd.dd_city
	   {
	      color:#000;
	   }
	div #cart
	   {
	     margin:0px auto;
	     text-align:right; 
	   }
	span{
	     padding:0 2px;border:1px #c0c0c0 solid;cursor:pointer;
	   }
	   a{
	      text-decoration: none; 
	   }
	</style>

  </head>
  
  <body>
  <h1>商品详情</h1>
  <a href="index.jsp">首页</a> >><a href="index.jsp">商品列表</a>
  <hr/>
  
  <center>
  <table height="60px" width="750px" cellpadding="0px" cellspacing="0px" border="0px">
     <tr>
     <%
   

       int id=Integer.parseInt(request.getParameter("id"));
       
       DAO dao=new DAO();
       Items items=dao.getItems(id);
       if(items!=null)
       {
      %>
        <td width="70%" valign="top">
           <table>
              <tr>
                <td rowspan="4"><img src="images/<%=items.getPicture() %>" width="200px" height="160px"/></td>
              </tr>
              <tr>
                <td><B><%=items.getName() %></B></td>
              </tr>
              <tr>
                <td>价格：<%=items.getPrice() %></td>
              </tr>
              <tr>
                <td>产地：<%=items.getCity() %></td>
              </tr>
              <tr>
                 <td>购买数量：<span id="sub" onclick="sub();">-</span><input type="text" id="number" name="number" value="1" size="2"/><span id="add" onclick="add();">+</span></td>
               </tr> 
           </table>
           <div id="cart">
               <img src="images/buy_now.png">
               <a href="javascript:selflog_show(<%=items.getId()%>)"><img src="images/in_cart.png" /></a>
               <a href="com.servlet/Servlet?action=show">
               <img src="images/view_cart.jpg"/></a>
             </div>
        </td>
        <%
        }
         %>
         <%
           String list="";
           Cookie[] cookies=request.getCookies();
           if(cookies!=null&&cookies.length>0){
           for(Cookie c:cookies){
               if(c.getName().equals("viewList")){
                  list=c.getValue();
               }
             }
           }
           list+=request.getParameter("id")+",";
           if(list.split(",").length>100){
             list="";
           }
           Cookie cookie=new Cookie("viewList",list);
           response.addCookie(cookie);
         %>
        <td width="30%" bgcolor="#EEE" align="center">
        <br/>
        <b>您浏览过的商品</b><br/>
        <%
        System.out.println(list);
           List<Items> itemsList=new ArrayList<Items>(); 
           itemsList=dao.getCookieItems(list);
           System.out.println(itemsList.size());
           if(itemsList!=null&&itemsList.size()>0){
           for(Items i:itemsList){
         %>
        <div>
          <dl>
            <dt>
            <a href="details.jsp?id=<%=i.getId() %>">
            <img src="images/<%=i.getPicture() %>" width="120px" height="90px" border="1px"/></a>
            </dt>
            <dd class="dd_name"><%=i.getName() %></dd>
            <dd class="dd_city">产地：<%=i.getCity() %>&nbsp;&nbsp;价格：<%=i.getPrice() %></dd>
          </dl>
        </div>
         <%
           }
        }
         %>
        </td>
     </tr>
  </table>
  </center>
    
  </body>
</html>
