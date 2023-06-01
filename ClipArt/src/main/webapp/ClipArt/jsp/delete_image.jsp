<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, java.io.*"%>
<%
request.setCharacterEncoding("utf-8");	

Class.forName("org.mariadb.jdbc.Driver");

String DB_URL ="jdbc:mariadb://localhost:3306/clipartdb?useSSL=false";

String idx = request.getParameter("idx"); 

String sql = "SELECT savedFileName FROM image_table WHERE idx=?";

Connection con =  DriverManager.getConnection(DB_URL,"admin","1234");

PreparedStatement pstmt = con.prepareStatement(sql);

pstmt.setInt(1, Integer.parseInt(idx));

ResultSet rs = pstmt.executeQuery();

rs.next();
String filename = rs.getString("savedFileName");

ServletContext context = getServletContext();
String realFolder = context.getRealPath("upload");

File file = new File(realFolder + File.separator + filename);

file.delete();


sql = "DELETE FROM image_table WHERE idx=?";

pstmt = con.prepareStatement(sql);
pstmt.setInt(1, Integer.parseInt(idx));

pstmt.executeUpdate();

pstmt.close();
con.close();



response.sendRedirect("index.jsp");
%>