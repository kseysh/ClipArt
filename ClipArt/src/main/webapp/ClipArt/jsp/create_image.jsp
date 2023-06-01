<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*, java.io.*, java.util.*, myBean.multipart.*"%>
<%
request.setCharacterEncoding("utf-8");

String image_classification = request.getParameter("image_classification");
String image_name = request.getParameter("image_name");

Connection con= null;
//데이터베이스 연결을 나타내는 Connection 객체 선언하고 초기화하는 변수
PreparedStatement pstmt = null;
//SQL문을 실행하기 위한 Statement 객체 선언후 초기화
String jdbc_driver = "org.mariadb.jdbc.Driver";
String jdbc_url = "jdbc:mariadb://localhost:3306/clipartdb?useUnicode=true&characterEncoding=utf8&useSSL=false";

Class.forName(jdbc_driver);

// upload 이름을 가지는 실제 서버의 경로명 알아오는 코드
ServletContext context = getServletContext();
String realFolder = context.getRealPath("upload");

//Part API를 사용하여 클라이언트로부터 전송받은 파일 저장
Collection<Part> parts = request.getParts();
MyMultiPart multiPart = new MyMultiPart(parts, realFolder);

String originalFileName="";
String savedFileName="";

if(multiPart.getMyPart("fileName") != null){
	originalFileName = multiPart.getOriginalFileName("fileName");
	savedFileName = multiPart.getSavedFileName("fileName");
}
con = DriverManager.getConnection(jdbc_url,"admin","1234");

String sql = "INSERT INTO image_table(image_name,image_classification, originalFileName, savedFileName) VALUES(?, ?, ?, ?)";
pstmt = con.prepareStatement(sql);

pstmt.setString(1, image_name);
pstmt.setString(2, image_classification);
pstmt.setString(3, originalFileName);
pstmt.setString(4, savedFileName);

pstmt.executeUpdate();


pstmt.close();
con.close();

response.sendRedirect("index.jsp");

%>