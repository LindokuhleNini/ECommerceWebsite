<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<% 

try{
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	//String q1 = "create table users (firstName varchar(100), lastName varchar(100), email varchar(100)primary key, phoneNumber bigint, address varchar(500), password varchar(100))";
	//String q2= "create table product(id int, name varchar(500), category varchar(200), price int, active varchar(10))";
	String q2= "create table messages(msg_id int, sender_email varchar(250), subject varchar(100), message varchar(1000))";
	//String q3= "create table cart(email varchar (100), product_id int, quantity int,price int, total int, address varchar(500), phoneNumber bigint,orderDate varchar(100), deliveryDate varchar (100), paymentMethod varchar(100), transactionId varchar (100), status varchar (10))";
	//String q4= "create table products(id int, name varchar(500), category varchar(200), price int, image varchar(200), active varchar(10))";
	//st.execute(q1);
	st.execute(q2);
	//st.execute(q3);
	System.out.print("Table created.");
	con.close();
}
catch(Exception e){
	System.out.print(e);
}
%>