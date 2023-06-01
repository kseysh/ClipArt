<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Internet programming project">
<meta name="author" content="김승환">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/layout.css">
<link rel="stylesheet" href="../css/upload.css">
<title>ClipArt</title>
</head>
<body>
	<header>
		<a href="../index.jsp" class="main_title">ClipArt</a>
		<div class="search_box">
			<fieldset class="main_search">
				<button class="search_button" onclick="search()">
					<img src="../image/search_icon.png" alt="search icon">
				</button>
				<input id="search_text_area" type="text"> <select
					id="search_classification">
					<optgroup label="분류">
						<option selected="selected" value="분류 선택">분류 선택</option>
						<option value="사람">사람 (5)</option>
						<option value="자동차">자동차 (6)</option>
						<option value="식물">식물 (3)</option>
						<option value="컴퓨터">컴퓨터 (0)</option>
					</optgroup>
				</select>

			</fieldset>
		</div>

	</header>

	<div class="main">
		<nav>
			<div class="wrapper">

				<div id="classification_register_button">등록</div>
				<div class="nav_container">


					<h3 style="text-align: center;">분류</h3>

					<ul id="classification_list_ul">
						<div class="list_container">
							<li><span class="classification_text" value="사람">사람 </span>
								<span> <span class="edit_button"> <img
										src="../image/edit_icon.png" alt="edit icon"> 수정
								</span> <span class="list_delete_button"> X </span>
							</span></li>

						</div>
						<div class="list_container">
							<li><span class="classification_text" value="자동차">자동차
							</span> <span> <span class="edit_button"><img
										src="../image/edit_icon.png" alt="edit icon">수정 </span> <span
									class="list_delete_button"> X</span>
							</span></li>

						</div>
						<div class="list_container">
							<li><span class="classification_text" value="식물">식물 </span>
								<span> <span class="edit_button"><img
										src="../image/edit_icon.png" alt="edit icon">수정</span> <span
									class="list_delete_button"> X</span>
							</span></li>

						</div>
						<div class="list_container">
							<li><span class="classification_text" value="컴퓨터">컴퓨터
							</span> <span> <span class="edit_button"><img
										src="../image/edit_icon.png" alt="edit icon">수정</span> <span
									class="list_delete_button" style="color: black"> X</span>
							</span></li>

						</div>
					</ul>

				</div>

			</div>
			<a class="clipart_register_button" href="./upload.jsp">클립아트 등록</a>

		</nav>

		<section class="thumbnails" style="margin: 0px 50px 50px 50px;">
			<div class="image_upload_block">
				<div class="image_upload_square_box">
					<div id="image_upload_square_content">
						<img src="" alt="upload_image" id="upload_image"
							style="display: none;">
					</div>
				</div>
				<label for="file_upload_button">
					<div id="image_upload_button">
						<img src="../image/download_icon.png" alt=""> 업로드
					</div>
				</label> <input type="file" id="file_upload_button" accept=".png, .jpg"
					onchange="print_image()">


			</div>

			<div class="image_description_block">
				<form action="edit.jsp" method="post">

					<div class="image_description">
						<p>
							파일 이름: <input type="text" id="image_name" name="image_name">
							</p>
						분류 : <select id="image_classification" name="image_classification">
							<optgroup label="분류">
								<option selected="selected">분류 선택</option>
								<option value="사람">사람 (5)</option>
								<option value="자동차">자동차 (6)</option>
								<option value="식물">식물 (3)</option>
								<option value="컴퓨터">컴퓨터 (0)</option>
							</optgroup>
						</select>

					</div>

					<div class="edit_register_box">
						<div class="last_edit_time">
							<p>최종 수정 일시</p>
							<p id="last_edit_time">23/03/11 21:19</p>
						</div>
						<input class="image_register_button" onclick="print_description()"
							type="submit" value="등록">
					</div>
				</form>
			</div>


		</section>

	</div>
	<script src="../js/layout.js"></script>
	<script src="../js/upload.js"></script>
</body>
</html>