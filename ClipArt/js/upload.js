window.file_name = "";
function print_image(){
    var image_upload_square_content_obj = document.getElementById("image_upload_square_content");
  var file_upload_button_obj = document.getElementById("file_upload_button");

  // FileReader 객체를 생성
  var reader = new FileReader();

  // 이미지가 로딩 될 때 부를 onload 함수 생성
  reader.onload = function(event) {
    // 이미지 태그 생성 & 속성 부여 
    //var file_image = document.getElementById("upload_image");
    //file_image.setAttribute("style","width:100%;height:100%;display:block;");
    //file_image.setAttribute("src", event.target.result);
    file_name = event.target.result;
  };

  // 선택한 파일을 읽어들이는 함수
  reader.readAsDataURL(file_upload_button_obj.files[0]);

}

function print_description(){
    var image_name_obj = document.getElementById("image_name");
    var image_classification_obj = document.getElementById("image_classification");
    var last_edit_time_obj = document.getElementById("last_edit_time");
    var time = new Date();
    var year = time.getFullYear();
    var month = time.getMonth()+1;
    var day = time.getDate();
    var hour = time.getHours();
    var minute = time.getMinutes();
    var currentTime = year+"/"+month+"/"+day+"  "+hour+":"+minute;



    var name = image_name_obj.value;
    var classification_name = image_classification_obj.value;
    if(name==""){
        alert("파일 이름을 작성해주세요.")
    }else{
        if(classification_name=="분류 선택"){
            alert("분류를 선택해주세요.");
        }else{
            var str = "파일 이름 : "+name+"\n분류 : "+classification_name+"\n최종 수정 일시 : "+currentTime;
            if(file_name!=""){
                str+="\n파일 URL : "+file_name;
            }
            alert(str);
        }
    }
}