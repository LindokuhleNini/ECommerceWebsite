<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");
	String email = request.getParameter("email");
	String phoneNumber = request.getParameter("phoneNumber");
	String address = request.getParameter("address");
	String password = request.getParameter("password");
	try
	{
		Connection con = ConnectionProvider.getCon();
		PreparedStatement pst = con.prepareStatement("insert into users values(?,?,?,?,?,?)");
		pst.setString(1, firstName);
		pst.setString(2, lastName);
		pst.setString(3, email);
		pst.setString(4, phoneNumber);
		pst.setString(5, address);
		pst.setString(6, password);
		pst.executeUpdate();
		response.sendRedirect("LoginPage.jsp?msg=valid");
	} 
	catch(Exception e)
	{
		System.out.println(e);
		response.sendRedirect("LoginPage.jsp?msg=invalid");
	}
%>