<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<%
request.setCharacterEncoding("utf-8");

String classification_title = request.getParameter("classification_title");
String originalURL = request.getParameter("originalURL");




Class.forName("org.mariadb.jdbc.Driver");
String DB_URL ="jdbc:mariadb://localhost:3306/clipartdb?useSSL=false";

Connection con = DriverManager.getConnection(DB_URL, "admin", "1234");

String sql = "INSERT INTO classification(classification_title) VALUES(?)";

PreparedStatement pstmt = con.prepareStatement(sql);

//pstmt에 UPDATE문 쿼리 구성
pstmt.setString(1, classification_title);

// 쿼리 실행
pstmt.executeUpdate();


pstmt.close();
con.close();

// 리스트 출력 페이지로 이동시키기
response.sendRedirect(originalURL);
%>