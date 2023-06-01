<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="description" content="Internet programming project">
<meta name="author" content="김승환">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="./css/layout.css">
<title>ClipArt</title>
</head>
<body>
	<header>
		<a href="index.jsp" class="main_title">ClipArt</a>
		<div class="search_box">
			<fieldset class="main_search">
				<button class="search_button" onclick="search()">
					<img src="./image/search_icon.png" alt="search icon">
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
										src="./image/edit_icon.png" alt="edit icon"> 수정
								</span> <span class="list_delete_button"> X </span>
							</span></li>

						</div>
						<div class="list_container">
							<li><span class="classification_text" value="자동차">자동차
							</span> <span> <span class="edit_button"><img
										src="./image/edit_icon.png" alt="edit icon">수정 </span> <span
									class="list_delete_button"> X</span>
							</span></li>

						</div>
						<div class="list_container">
							<li><span class="classification_text" value="식물">식물 </span>
								<span> <span class="edit_button"><img
										src="./image/edit_icon.png" alt="edit icon">수정</span> <span
									class="list_delete_button"> X</span>
							</span></li>

						</div>
						<div class="list_container">
							<li><span class="classification_text" value="컴퓨터">컴퓨터
							</span> <span> <span class="edit_button"><img
										src="./image/edit_icon.png" alt="edit icon">수정</span> <span
									class="list_delete_button" style="color: black"> X</span>
							</span></li>

						</div>
					</ul>

				</div>

			</div>
			<a class="clipart_register_button" href="./jsp/upload.jsp">클립아트
				등록</a>

		</nav>


		<section class="thumbnails" style="margin: 20px 50px 50px 50px;">
			<div class="main_image">
				<a href=""><img src="./image/image_1.jpg" alt="image 1"></a>
				<div class=image_delete_button>X</div>
			</div>
			<div class="main_image">
				<a href=""><img src="./image/image_1.jpg" alt="image 2"></a>
				<div class=image_delete_button>X</div>
			</div>
			<div class="main_image">
				<a href=""><img src="./image/image_1.jpg" alt="image 3"></a>
				<div class=image_delete_button>X</div>
			</div>
			<div class="main_image">
				<a href=""><img src="./image/image_1.jpg" alt="image 4"></a>
				<div class=image_delete_button>X</div>
			</div>
			<div class="main_image">
				<a href=""><img src="./image/image_1.jpg" alt="image 5"></a>
				<div class=image_delete_button>X</div>
			</div>
			<div class="main_image">
				<a href=""><img src="./image/image_1.jpg" alt="image 6"></a>
				<div class=image_delete_button>X</div>
			</div>
			<div class="main_image">
				<a href=""><img src="./image/image_1.jpg" alt="image 7"></a>
				<div class=image_delete_button>X</div>
			</div>
			<div class="main_image">
				<a href=""><img src="./image/image_1.jpg" alt="image 8"></a>
				<div class=image_delete_button>X</div>
			</div>
			<div class="main_image">
				<a href=""><img src="./image/image_1.jpg" alt="image 9"></a>
				<div class=image_delete_button>X</div>
			</div>
			<div class="main_image">
				<a href=""><img src="./image/image_1.jpg" alt="image 10"></a>
				<div class=image_delete_button>X</div>
			</div>
			<div class="main_image">
				<a href=""><img src="./image/image_1.jpg" alt="image 11"></a>
				<div class=image_delete_button>X</div>
			</div>
			<div class="main_image">
				<a href=""><img src="./image/image_1.jpg" alt="image 12"></a>
				<div class=image_delete_button>X</div>

			</div>


		</section>


	</div>


	<footer>
		<img src="./image/prev_page_icon.png" alt="prev page button"> <a
			href="#" class="nextpage_button">1 </a> <a href="#"
			class="nextpage_button">2 </a> <a href="#" class="nextpage_button">3
		</a> <a href="#" class="nextpage_button">4 </a> <a href="#"
			class="nextpage_button">5</a> <img src="./image/next_page_icon.png"
			alt="next page button">


	</footer>
	<script src="./js/layout.js"></script>
</body>
</html>