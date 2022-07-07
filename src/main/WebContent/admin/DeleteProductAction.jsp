<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String category = request.getParameter("category");
String price = request.getParameter("price");
String image = request.getParameter("image");
String active = request.getParameter("active");

try
{
	Connection con = ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("delete from products where id='"+id+"'");
	
	response.sendRedirect ("Products.jsp?msg=deleted");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect ("Products.jsp?msg=notdeleted");
}
%>