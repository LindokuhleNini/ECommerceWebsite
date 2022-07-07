<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String sender_email=session.getAttribute("email").toString();
String msg_id=request.getParameter("msg_id");
String message=request.getParameter("message");
String subject=request.getParameter("subject");

try{
   Connection con=ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet rs=st.executeQuery("select *from users where email='"+sender_email+"'");
    while(rs.next()){
    	sender_email=rs.getString(3);
    }
   

    	PreparedStatement ps=con.prepareStatement("insert into messages(msg_id,sender_email,subject,message) values(?,?,?,?)");
    	ps.setString(1, msg_id);
    	ps.setString(2, sender_email);
    	ps.setString(3, subject);
    	ps.setString(4, message);
    	ps.executeUpdate();
    	response.sendRedirect("ContactUs.jsp?msg=sent");
    
}
catch(Exception e)
{
    System.out.println(e);
    response.sendRedirect("ContactUs.jsp?msg=invalid");

}
%>