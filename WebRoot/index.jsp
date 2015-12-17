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
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	div{
	float:left;
	margin:10px;
	
	}
	div dd{
	margin:0px;
	font-size:10pt;
	}
	div dd.dd_name{
	color:blue;
	}
	div dd.dd_city{
	color:#000;
	}
	</style>
	
  </head>
  
  <body>
    <h1>商品展示</h1>
    <hr/>
    
    
    <center>
    <table height="60px" width="750px" cellpadding="0px" cellspacing="0px" border="0px">
       <tr>
         <td>
         <%
           DAO dao=new DAO();
           List<Items> itemsList=new ArrayList<Items>();
           itemsList=dao.getItemsList();
           Items item=new Items();
           if(itemsList!=null&&itemsList.size()>0)
           {
               for(int i=0; i<itemsList.size();i++){
                item=itemsList.get(i);
           
          %>
           <div>
              <dl>
                 <dt>
                 <a href="details.jsp?id=<%=item.getId()%>"><img src="images/<%=item.getPicture() %>" height="110px" width="150px" border="1px"/></a> 
                 </dt>
                 <dd class="dd_name">运动鞋</dd>
                 <dd class="dd_city">产地：<%=item.getCity() %>&nbsp;&nbsp;价格：<%=item.getPrice() %></dd>
              </dl>
              
           </div>
           <%
                 }
           }
         
            %>
         
         </td>
       </tr>
    </table>
  </body>
  </center>
</html>
