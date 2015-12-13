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
	<style type="text/css">
	div {
	float:left;
	margin:30px,5px;
	}
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
	</style>

  </head>
  
  <body>
  <h1>商品详情</h1>
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
                <td rowspan="4"><img src="imagines/<%=items.getPicture() %>" width="200px" height="160px"/></td>
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
           </table>
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
           List<Items> itemsList=new ArrayList<Items>(); 
           itemsList=dao.getCookieItems(list);
           System.out.println(itemsList.size());
           if(itemsList!=null&&itemsList.size()>0){
           for(Items i:itemsList){
         %>
        <div>
          <dl>
            <dt>
            <a href="details.jsp?id=<%=i.getId() %>"><img src="imagines/<%=i.getPicture() %>" width="120px" height="90px" border="1px"/></a>
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
