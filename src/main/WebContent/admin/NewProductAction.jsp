<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String id=request.getParameter ("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");
String image=request.getParameter("image");
String active=request.getParameter("active");

try
{
    Connection con=ConnectionProvider.getCon();
    PreparedStatement ps=con.prepareStatement ("insert into products values (?,?,?,?,?,?)");
    ps.setString(1, id);
    ps.setString(2, name);
    ps.setString(3, category);
    ps.setString(4, price);
    ps.setString(5, image);
    ps.setString(6, active);
    ps.executeUpdate();
    response.sendRedirect("NewProduct.jsp?msg=done");
}
catch(Exception e)
{
    response.sendRedirect("NewProduct.jsp?msg=wrong");
}

%>