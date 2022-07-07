<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	if("admin@gmail.com".equals(email) && "admin".equals(password)){
		session.setAttribute("email", email);
		response.sendRedirect("admin/Products.jsp");
	}
	else{
		int z = 0;
		
		try{
			Connection con = ConnectionProvider.getCon();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from users where email = '"+email+"' and password = '"+password+"'");
			while(rs.next()){
				z=1;
				session.setAttribute("email", email);
				response.sendRedirect("Home.jsp");
			}
			if(z == 0){
				response.sendRedirect("LoginPage.jsp?msg=accountNotFound");
			}
		}
		catch(Exception e){
			System.out.println(e);
			response.sendRedirect("LoginPage.jsp?msg=invalid");
		}
	}
%>