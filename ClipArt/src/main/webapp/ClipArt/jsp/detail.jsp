<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import = "java.util.Date" %>
<%
request.setCharacterEncoding("utf-8");

String idx = request.getParameter("idx");
Class.forName("org.mariadb.jdbc.Driver");
//Mariadb와 연결하기 위해 JDBC 드라이버를 로드하는 코드
String DB_URL = "jdbc:mariadb://localhost:3306/clipartdb?useSSL=false";
//데이터 베이스 연결 URL을 설정하는 변수

String DB_USER = "admin";
//데이터베이스에 접속하기 위한 사용자 이름 설정하는 변수
String DB_PASSWORD= "1234";
//데이터베이스를 사용하기 위한 사용자의 비밀번호를 설정하는 변수


Connection con= null;
//데이터베이스 연결을 나타내는 Connection 객체 선언하고 초기화하는 변수
Statement stmt = null;
//SQL문을 실행하기 위한 Statement 객체 선언후 초기화
ResultSet rs   = null;
ResultSet image_rs = null; 
//SQL 쿼리 결과를 담는 ResultSet 객체를 선언하고 초기화

con = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
//연결자 생성
stmt = con.createStatement();
//Statement 객체 생성
String query = "SELECT idx, classification_title FROM classification"; 
String image_query = "SELECT * FROM image_table WHERE idx=?"; 
PreparedStatement pstmt = con.prepareStatement(image_query);
pstmt.setInt(1,Integer.parseInt(idx));

//쿼리문 작성
rs = stmt.executeQuery(query);
image_rs = pstmt.executeQuery();
// pstmt는 이미 준비된 매개변수를 사용하므로 별도의 매개변수를 전달할 필요가 없다.
image_rs.next();

String image_name = image_rs.getString("image_name");
String image_classification = image_rs.getString("image_classification");
String last_edited_time = image_rs.getString("last_edited_time");

String image_source=image_rs.getString("savedFileName");
String src = "";
if(image_source == null){
	src = "../image/no_img.jpg";
} else{
	src = "../../upload/"+image_source;
}	

//쿼리를 전달하고, ResultSet 객체를 반환 받는다.

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="description" content="Internet programming project">
<meta name="author" content="김승환">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/layout.css">
<link rel="stylesheet" href="../css/edit.css">
<title>ClipArt</title>
</head>
<body>
	<header>
		<a href="./index.jsp" class="main_title">ClipArt</a>
		<div class="search_box">
			<fieldset class="main_search">
			<form action="search.jsp">
				<input class="search_button" type="image" src="../image/search_icon.png">
				<input id="search_text_area" type="text" name="search_text"> <select
					id="search_classification" name="classification_text">
					<optgroup label="분류">
						<option selected="selected" value="분류 선택">분류 선택</option>
						<% 
						while(rs.next()){
						%>
						<option value="<%= rs.getString("classification_title")%>"><%= rs.getString("classification_title")%></option>
						<% 
						}
						%>
					</optgroup>
				</select>
			</form>

			</fieldset>
		</div>

	</header>

	<div class="main">
		<nav>
			<div class="wrapper">

				<div id="classification_register_button" onclick="create_classification()">등록</div>
				<div class="nav_container">


					<h3 style="text-align: center;">분류</h3>

					<ul id="classification_list_ul">
					<%			
						rs.beforeFirst(); // rs 커서를 초기 위치로 되돌리는 함수
						int count = 0;
						ResultSet count_rs = null;
						PreparedStatement p_stmt = null;
						while(rs.next()){

							String cmd = "SELECT COUNT(image_classification) AS count FROM image_table WHERE image_classification = ?";
							p_stmt = con.prepareStatement(cmd);
							p_stmt.setString(1, rs.getString("classification_title"));
							count_rs = p_stmt.executeQuery();
							if(count_rs.next()) {
								count = count_rs.getInt("count");
							}
						%>
						<div class="list_container">
							<li><span class="classification_text">
							 
							<form action="search.jsp">
								<input type="submit" value="<%= rs.getString("classification_title")%> (<%= count %>)">
								<input type="hidden" name="search_text" value="">
								<input type="hidden" name="classification_text" value="<%= rs.getString("classification_title")%>">
								
							</form>
							
							
							</span>
								<span> <span class="edit_button" onclick="update_classification( <%= rs.getInt("idx") %> ) "> <img
										src="../image/edit_icon.png" alt="edit icon"> 수정
								</span> 
								<% 

								if(count == 0){ 
								%>
									<span class="list_delete_button" style = "color:black;" onclick="delete_classification(<%= rs.getInt("idx") %>, '<%= rs.getString("classification_title") %>')">X</span> 
								<% }else{ %>
									<span class="list_delete_button"  onclick="alert('삭제하고자 하는 분류에 클립아트가 존재하여 삭제할 수 없습니다.')">X</span>
									<%} %>
									</span>

							</li>

						</div>
						<% 
						}
						%>
					</ul>

				</div>

			</div>
			<a class="clipart_register_button" href="./upload.jsp">클립아트 등록</a>

		</nav>

		<section class="thumbnails" style="margin: 0px 50px 50px 50px;">
			<form action="update_image.jsp" method="POST" enctype="multipart/form-data" style="display:flex; width:100%">		
			<div class="image_upload_block">
				<div class="image_upload_square_box">
					<div id="image_upload_square_content">
						<img src="<%=src%>" alt="upload_image" id="upload_image" style="width:100%; height:100%">
					</div>
				</div>
					<label for="file_upload_button">	
					<div class="image_upload_button" id="upload_btn" style=" display:none">
						<img src="../image/download_icon.png" alt="" style="width:20px;height:20px;"> 업로드
					</div>
					</label>
					<div class="image_upload_button" id="back_btn" style="display:none" onclick="location.href='detail.jsp?idx=<%=idx%>'">
						수정 취소
					</div>
				 <input type="file" id="file_upload_button" accept=".png, .jpg, .gif" name="fileName"
					onchange="print_image()">


			</div>
			<div class="image_description_block">
			<div id="form">
			<input type="hidden" name="idx" value="<%= idx %>">
			
				<div class="image_description" id="not_hidden_box">
					<p>
						파일 이름 : <br><%=image_name%> <br>분류 : <br><select
							id="image_classification" name="image_classification"  disabled>
							<optgroup label="분류">
								<option selected="selected">분류 선택</option>
								<% 
								rs.beforeFirst();
								while(rs.next()){
								%>
								<% String title = rs.getString("classification_title"); %>
								<option value="<%= title %>"<% if(title.equals(image_classification)) { %>selected<% } %>><%= title %></option>
								<% 
								}
								%>
							</optgroup>
						</select>
				</div>
				<div class="image_description" id="hidden_box" style="display:none">
					<p>
						파일 이름 : <br><input type="text" id="p_image_name"
							value="<%=image_name%>" name ="image_name"> <br>분류 : <br><select
							id="image_classification" name="image_classification">
							<optgroup label="분류">
								<option selected="selected">분류 선택</option>
								<% 
								rs.beforeFirst();
								while(rs.next()){
								%>
								<% String title = rs.getString("classification_title"); %>
								<option value="<%= title %>"<% if(title.equals(image_classification)) { %>selected<% } %>><%= title %></option>
								<% 
								}
								%>
							</optgroup>
						</select>
				</div>

				<div class="edit_register_box">
					<div class="last_edit_time">
						<p>최종 수정 일시</p>
						<p id="last_edit_time">
							<%= last_edited_time %>
						</p>
					</div>
					<div class="image_register_button" >
					<input value ="수정" type="submit" id="hidden_button" style="display:none" onclick="return confirm_submit();">	
					<span id="not_hidden_button" onclick="show_hidden_box()">수정</span>				
					</div>
					<div class="image_register_button" onclick="delete_image(<%= idx %>)">삭제</div>
				</div>


			</form>
			</div>
			</div>

		</section>

	</div>

	<script>
	// 분류 수정 값을 받고, 수정을 확인 받고 수정하기 위해 update_classification.jsp로 이동하는 함수
	function update_classification(idx) {
	    var title = prompt('수정할 값을 입력하세요.');
	    if(title){
			var	is_confirmed = confirm(title+"로 수정하시겠습니까?");
			if(is_confirmed){
			    var originalURL = window.location.href;
		        var encodedTitle = encodeURIComponent(title);
		        var editURL = 'update_classification.jsp?idx=' + idx + '&classification_title=' + encodedTitle + '&originalURL=' + encodeURIComponent(originalURL);
		        location.href = editURL;
			}
	    }


	}
	// 분류 삭제를 확인받고 삭제하기 위해 delete_classification.jsp로 이동하는 함수
	function delete_classification(idx, classification_title) {
	    var is_delete = confirm("분류: " + classification_title + "를 삭제하시겠습니까?");
	    if (is_delete) {
		    var originalURL = window.location.href;
	        var editURL = 'delete_classification.jsp?idx=' + idx  + '&originalURL=' + encodeURIComponent(originalURL);
	        location.href = editURL;
	    }
	}
	// 분류 추가를 위해 등록할 값을 입력받고 분류를 등록하기 위해 create_classification.jsp로 이동하는 함수
	function create_classification(){
	    var title = prompt('등록할 값을 입력하세요.');
	    var originalURL = window.location.href;
	    if (title) {
	        var editURL = 'create_classification.jsp?classification_title='+title+'&originalURL=' + encodeURIComponent(originalURL);
	        location.href = editURL;
	    }

	}
	// 이미지를 삭제하기 위해 delete_image.jsp로 이동하는 함수
	function delete_image(idx){
		var is_confirmed = confirm("삭제하시겠습니까?");
		if(is_confirmed){
			location.href = "delete_image.jsp?idx="+idx;
		}
	}
	// 수정 버튼을 누르면 업로드 버튼과 수정 취소 버튼을 나오게 하고, 이미지 이름과 분류값을 수정 가능하도록 하는 함수
	function show_hidden_box(){
		var hidden_box = document.getElementById("hidden_box");
		var hidden_button= document.getElementById("hidden_button");
		var not_hidden_box = document.getElementById("not_hidden_box");
		var not_hidden_button = document.getElementById("not_hidden_button");
		var upload_btn = document.getElementById("upload_btn");
		var download_btn = document.getElementById("back_btn");
		
		hidden_box.style.display="block";
		hidden_button.style.display="block";
		upload_btn.style.display="inline-block";
		back_btn.style.display="inline-block";
		not_hidden_box.style.display="none";
		not_hidden_button.style.display="none";
	}
	// 수정을 확인 받는 함수
	function confirm_submit(){
		var is_confirmed = confirm("수정하시겠습니까?");
		return is_confirmed;
	}
	// 업로드를 통해 파일을 올렸을 때 그 이미지를 출력해주는 함수
	function print_image(){
	    var image_upload_square_content_obj = document.getElementById("image_upload_square_content");
	  var file_upload_button_obj = document.getElementById("file_upload_button");

	  // FileReader 객체를 생성
	  var reader = new FileReader();

	  // 이미지가 로딩 될 때 부를 onload 함수 생성
	  reader.onload = function(event) {
	    // 이미지 태그 생성 & 속성 부여 
	    var file_image = document.getElementById("upload_image");
	    file_image.setAttribute("style","width:100%;height:100%;display:block;");
	    file_image.setAttribute("src", event.target.result);
	    file_name = event.target.result;
	  };

	  // 선택한 파일을 읽어들이는 함수
	  reader.readAsDataURL(file_upload_button_obj.files[0]);

	}
	</script>
</body>
</html>

<%

rs.close();
stmt.close();
con.close(); 

%>