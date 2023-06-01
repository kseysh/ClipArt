<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");	

String idx = request.getParameter("idx"); 
String originalURL = request.getParameter("originalURL");


Class.forName("org.mariadb.jdbc.Driver");
 
String DB_URL ="jdbc:mariadb://localhost:3306/clipartdb?useSSL=false";

Connection con =  DriverManager.getConnection(DB_URL,"admin","1234");


String sql = "DELETE FROM classification WHERE idx=?";

PreparedStatement pstmt = con.prepareStatement(sql);

pstmt.setInt(1, Integer.parseInt(idx));

pstmt.executeUpdate();

pstmt.close();
con.close();



response.sendRedirect(originalURL);
%>