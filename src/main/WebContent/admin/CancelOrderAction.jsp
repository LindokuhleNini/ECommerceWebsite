<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%

String transactionId = request.getParameter("transactionId").toString();
String status = "cancelled";
try{
	
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("update cart set status=? where transactionId=? and status='processing'");
	ps.setString(1, status);
	ps.setString(2, transactionId);
	ps.executeUpdate();
	response.sendRedirect("OrdersRecieved.jsp");
	
} catch(Exception e){
	System.out.println(e);
}
%>