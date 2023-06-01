<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.sql.*, java.util.*, myBean.multipart.*, java.io.*"%>
<%
request.setCharacterEncoding("utf-8");

int idx = Integer.parseInt(request.getParameter("idx"));
String image_classification = request.getParameter("image_classification");
String image_name = request.getParameter("image_name");

ServletContext context = getServletContext();
String realFolder = context.getRealPath("upload");

//  Part API를 사용하여 클라이언트로부터 multipart/form-data 유형의 전송 받은 파일 저장
Collection<Part> parts = request.getParts();
MyMultiPart multiPart = new MyMultiPart(parts, realFolder);

String jdbc_driver = "org.mariadb.jdbc.Driver";
Class.forName(jdbc_driver);

Connection con= null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = null;

String jdbc_url = "jdbc:mariadb://localhost:3306/clipartdb?useUnicode=true&characterEncoding=utf8&useSSL=false";
con = DriverManager.getConnection(jdbc_url,"admin","1234");


if(multiPart.getMyPart("fileName") != null) { // 사용자가 새로운 파일을 지정한 경우
	//member 테이블에 저장된 idx 레코드의 파일명을 알아내어, 물리적 파일을 삭제한다.
	sql = "SELECT savedFileName FROM image_table WHERE idx=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, idx);
	rs = pstmt.executeQuery();
	rs.next();
	String oldFileName = rs.getString("savedFileName");
	File oldFile = new File(realFolder + File.separator + oldFileName);
	oldFile.delete();
	
	// 새로운 파일명(original file name, UUID 적용 file name)과 데이터로 member 테이블 수정
	sql = "UPDATE image_table SET image_classification=?, image_name=?, originalFileName=?, savedFileName=?, last_edited_time=now() WHERE idx=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, image_classification);
	pstmt.setString(2, image_name);
	pstmt.setString(3, multiPart.getOriginalFileName("fileName"));
	pstmt.setString(4, multiPart.getSavedFileName("fileName"));
	pstmt.setInt(5, idx);
	
	
}else{ // fileName에 해당되는 Part 객체가 null이라면, 새로운 파일을 선택하지 않을 경우임
	// 파일명을 제외한 id, name, pwd 정보 수정
	sql = "UPDATE image_table SET image_classification=?, image_name=?, last_edited_time=now() WHERE idx=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, image_classification);
	pstmt.setString(2, image_name);
	pstmt.setInt(3, idx);

}



pstmt.executeUpdate();


if(pstmt != null) pstmt.close();
if(rs != null) rs.close();
if(con != null) con.close();

response.sendRedirect("detail.jsp?idx="+idx);

%>