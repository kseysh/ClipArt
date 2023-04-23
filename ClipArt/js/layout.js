// 검색어를 입력하고 검색 버튼을 누를 시 검색어와 분류를 출력하는 코드
function search(){
    var search_area = document.getElementById("search_text_area");
    var search_classification = document.getElementById("search_classification");
    var search_text = search_area.value;
    var classfication_text=search_classification.value;
    if(search_text==""){
        alert("검색어를 입력해주세요.");
    }else{
      if(classfication_text=="분류 선택"){
        alert("검색어 : "+search_text);
      }else{
        alert("검색어 : "+search_text+"\n분류 : "+classfication_text);
      }
    }
}

//분류 값을 선택하였을 때, alert를 통해 분류 값이 출력되는 코드
var nav_classifications = document.getElementsByClassName("classification_text");
for (var i = 0; i < nav_classifications.length; i++) {
  nav_classifications[i].addEventListener('click', function() {
    alert("분류 값 : " +this.getAttribute('value'));
  });
}

// 수정 버튼을 눌렀을 때 prompt를 통해 수정 값을 받고 분류 값을 수정하는 코드
var edit_btn =document.getElementsByClassName("edit_button");
for (var i = 0; i < edit_btn.length; i++) {
  edit_btn[i].addEventListener('click', function() {
    var classification_text = this.parentNode.previousElementSibling;
    var input = prompt('변경할 값을 입력하세요.');
    if (input) {
        alert("변경한 값 : "+input);
      classification_text.textContent = input;
      classification_text.setAttribute('value', input);
    }
  });
}


//등록 버튼을 눌렀을 시 분류 추가하는 코드
var register_btn = document.getElementById("classification_register_button");
register_btn.addEventListener('click', function(){
    var classification_value = prompt("등록할 분류 값을 입력하세요 : ");
    if(classification_value){
        alert("등록할 분류 값 : "+classification_value);

        var classification_list_ul_obj = document.getElementById("classification_list_ul");

        var list_container_obj = document.createElement("div");
        list_container_obj.setAttribute("class","list_container");

        var li_obj = document.createElement("li");

        var classification_text_obj = document.createElement("span");
        classification_text_obj.setAttribute("class","classification_text");
        classification_text_obj.setAttribute("value",classification_value);
        var classification_name = document.createTextNode(classification_value);


        var span_obj = document.createElement("span");

        var edit_button_obj = document.createElement("span");
        edit_button_obj.setAttribute("class","edit_button");
        var edit_text = document.createTextNode("수정");

        var img_obj = document.createElement("img");
        if (window.location.pathname == "/index.html") {
            img_obj.setAttribute("src","./image/edit_icon.png");
        } 
        else{
            img_obj.setAttribute("src","../image/edit_icon.png");
        }        
        img_obj.setAttribute("alt","edit icon");

        var list_delete_button_obj = document.createElement("span");
        list_delete_button_obj.setAttribute("class","list_delete_button")
        var x_text = document.createTextNode(" X");

        edit_button_obj.appendChild(img_obj);
        edit_button_obj.appendChild(edit_text);
        list_delete_button_obj.appendChild(x_text);
        span_obj.appendChild(edit_button_obj);
        span_obj.appendChild(list_delete_button_obj);
        classification_text_obj.appendChild(classification_name);
        li_obj.appendChild(classification_text_obj);
        li_obj.appendChild(span_obj);
        list_container_obj.appendChild(li_obj);
        classification_list_ul_obj.appendChild(list_container_obj);


        //분류 값을 선택하였을 때, alert를 통해 분류 값이 출력되는 코드
        classification_text_obj.addEventListener('click', function() {
            alert("분류 값 : " +this.getAttribute('value'));
        });


        // 수정 버튼을 눌렀을 때 prompt를 통해 수정 값을 받고 분류 값을 수정하는 코드
        edit_button_obj.addEventListener('click', function() {
            var classification_text = this.parentNode.previousElementSibling;
            var input = prompt('변경할 값을 입력하세요.');
            if (input) {
                alert("변경한 값 : "+input);
              classification_text.textContent = input;
              classification_text.setAttribute('value', input);
            }
        });
     
    }
});
