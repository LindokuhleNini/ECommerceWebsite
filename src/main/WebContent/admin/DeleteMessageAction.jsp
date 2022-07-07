<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String msg_id = request.getParameter("msg_id");
String sender_email = request.getParameter("sender_email");
String subject = request.getParameter("subject");
String message = request.getParameter("message");

try
{
	Connection con = ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("delete from messages where msg_id='"+msg_id+"'");
	
	response.sendRedirect ("Messages.jsp?msg=deleted");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect ("Messages.jsp?msg=notdeleted");
}
%>