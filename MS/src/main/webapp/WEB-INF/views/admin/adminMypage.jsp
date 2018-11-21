<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MS</title>
<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zipcode.js"></script>
<style>
.adminMypage_adminInfo {
   margin: 30px 20px;
   position : relative;
}
.adminMypage_adminTable>tbody>tr>th {
   color: black;
   width : 240px;
   height : 80px;
   font-size : 25px;
   padding : 10px 40px;
   border-top : 2px solid darkgray;
   border-bottom : 2px solid darkgray;
   border-right : 2px solid darkgray;
}
.adminMypage_adminTable>tbody>tr>td {
   width : 600px;
   color: black;
   border-top: 2px solid darkgray;
   border-bottom: 2px solid darkgray;
   background-color: #white;
}
.adminMypage_adminTable input[type=text]{
   width : 400px;
   height : 50px;
   margin-left : 70px;
   border-radius : 7px;
   border : 1px solid ivory;
   background-color : #eee;
   padding-left : 20px;
   font-size : 20px;
}
.adminMypage_title{
   margin-top : 30px;
}
.adminMypage_deleteBtn {
   border : none;
   background-color : red;
   width : 130px;
   height : 50px;
   color : white;
   margin-left : 190px;
   font-size : 20px;
   border-radius: 7px;
}
.adminMypage_deleteBtn:hover{
   background-color : palevioletred;
   cursor : pointer;
}
.adminMypage_close{
   position : absolute;
   right : 10px;
   top : 2px;
   color : darkgray;
}
.adminMypage_close:hover {
   color: white;
   text-decoration: none;
   cursor: pointer;
}

.adminMypage_deleteModal{
   position : fixed;
   width : 100%;
   height : 100%;
   left : 0px;
   top : 0px;
   z-index : 1;
   background-color : rgba(0, 0, 0, 0.4);
   display : none;
}
.adminMypage_deleteDiv{
   position : absolute;
   top : 20%;
   left : 35%;
   width : 500px;
   height : 200px;
   background-color : #eee;
   text-align : center;
   border-radius: 10px;
}
.adminMypage_deleteDiv p{
   margin-top : 30px;
   margin-bottom : 30px;
   font-size : 35px;
}
.adminMypage_deleteOkBtn, .adminMypage_deleteCancelBtn{
   background-color : red;
   border : none;
   width : 130px;
   height : 50px;
   color : white;
   margin-left : 30px;
   margin-right : 30px;
   font-size : 18px;
   border-radius: 10px;
}
.adminMypage_deleteCancelBtn{
   background-color : black !important;
}
.adminMypage_deleteOkBtn:hover, .storeDeleteBtn:hover{
   background-color : palevioletred;
    cursor : pointer;
}
.adminMypage_deleteCancelBtn:hover, .storeDeleteCancel:hover, .addBtn:hover{
   background-color : #8e8e8e !important;
    cursor : pointer;
}
.adminMypage_management{
   padding-left : 70px;
   position : relative;
}
.adminMypage_addStore{
    width: 100px;
   font-size : 20px;
   color : black;
   height: 50px;
    border: none;
    border-radius: 7px;
    margin : 10px 20px 10px 0px;
}
.adminMypage_addStore:hover{
   background-color : grey;
   cursor : pointer;
}
.adminMypage_storeName{
   width : 100px;
   height : 50px;
   border : none;
   font-size : 16px;
   border-radius: 7px;
   margin : 10px 20px 10px 0px;
}
.adminMypage_storeName:hover{
   background-color : grey;
}
.adminMypage_storeDetail{
   position : absolute;
   top : -370px;
   left : 50px;
}
.adminMypage_management table>tbody>tr>th{
   font-size : 20px;
}
.adminMypage_storeDetail th {
   width : 160px;
   padding : 10px 0px 10px 20px;
   border : 4px solid darkgrey;
   height : 60px;
   background-color : white;
   /* -webkit-text-stroke : 1px black; */
}
.adminMypage_storeDetail td {
   width : 220px;
   padding : 10px 30px;
   font-size : 20px;
   border : 4px solid darkgrey;
   background-color : white;
   /* -webkit-text-stroke : 1px black; */
}
.adminMypage_storeTitle{
   text-align : center;
   height : 70px !important;
   background-color : white;
   font-size : 25px !important;
}
.deleteStoreWrap{
   margin-right : 20px;
   width : 100px;
   position : relative;
   float : left;
   margin-bottom : 0px;
   border-radius: 10px;
}
.deleteStore{
   width : 15px;
   height : 15px;
   position : absolute;
   right : -5px;
   top : 7px;
   border-radius: 10px;
}
.storeDeleteModal{
   position : fixed;
   width : 100%;
   height : 100%;
   left : 0px;
   top : 0px;
   z-index : 1;
   background-color : rgba(0, 0, 0, 0.4);
   display : none;
}
.deleteStore:hover, .adminMypage_select{
   cursor : pointer;
}
.storeDeleteDiv{
   position : absolute;
   top : 20%;
   left : 35%;
   width : 550px;
   height : 200px;
   background-color : #eee;
   text-align : center;
   border-radius: 10px;
}
.storeDeleteBtn, .storeDeleteCancel{
   background-color : red;
   border : none;
   width : 130px;
   height : 50px;
   color : white;
   margin-left : 30px;
   margin-right : 30px;
   font-size : 18px;
   border-radius: 10px;
}
.storeDeleteCancel{
   background-color : black !important;
}
.storeDeleteDiv p{
   margin-top : 30px;
   margin-bottom : 30px;
   font-size : 35px;
}
.addStoreModal{
   position : fixed;
   width : 100%;
   height : 100%;
   left : 0px;
   top : 0px;
   z-index : 1;
   background-color : rgba(0, 0, 0, 0.4);
   display : none;
}
.addStoreWrap{
   position : absolute;
   top : 10%;
   left : 50%;
   width : 500px;
   height : 600px;
   background-color : white;
   border-radius: 10px;
   margin-left : -250px;
}
.addStoreWrap p{
   position : relative;
   font-size : 30px;
   margin-top : 20px;
   margin-bottom : 15px;
   text-align : center;
}
.adminMypage_select{
   width : 220px;
   font-size : 15px;
   height : 38px;
   padding : 7px;
   background-color : #eee;
   margin-right : 30px;
}
.addBtn{
   border : none;
   background-color : black;
   color : white;
   width : 300px;
   height : 50px;
   border-radius: 10px;
   margin-left : 20%;
   margin-top : 15px;
}
.storeClose{
   position : absolute;
   top : 0px;
   right : 15px;
   font-size : 30px;
}
.storeClose:hover{
   color : grey;
   cursor : pointer;
}
.store_nameWrap{
	margin : 0px 60px ;
}
.store_nameWrap input[type="text"]{
	width : 100%;
	height : 35px;
	margin-bottom : 10px;
}
.edit:hover{
	color : red;
	cursor : pointer;
}
#store_zip{
	width : 225px;
}
#find_zip{
	position : absolute;
	top : -14px;
	right : 0px;
}
</style>
</head>
<body>
   <%@ include file="/WEB-INF/views/common/header.jsp"%>
   
   <div class="container">
      <h1 class = "adminMypage_title">마이 페이지</h1>
      <hr>
      <div class ="adminMypage_adminInfo">
         <form action="" id = "adminMypage_myForm">
            <table class ="adminMypage_adminTable">
               <tr id = "adminMypage_adminIdTr">
                  <th>회원아이디</th>
                  <td><input type = "text" name = "admin_id" id = "adminMypage_id" value = "${admin.admin_id }" readonly></td>
               </tr>
               <tr>
                  <th>이름</th>
                  <td><input type = "text" name = "admin_name" id = "adminMypage_name" value = "${admin.admin_name }" readonly>
                  <p id = "edit_name" class = "edit" style = "float : right; font-size : 18px; margin-top : 10px; margin-right : 30px;" onclick ="edit('name')">수정하기</p></td>
               </tr>
               <tr>
                  <th>비밀번호</th>
                  <td><input type = "text" name = "admin_pw" id = "adminMypage_pw" value = "***********" readonly>
                  <p id = "edit_pw" class = "edit" style = "float : right; font-size : 18px; margin-top : 10px; margin-right : 30px;" onclick ="edit('pw')">수정하기</p></td>
               </tr>
               <tr>
                  <th>핸드폰번호</th>
                  <td><input type = "text" name = "admin_phone" id = "adminMypage_phone" value = "${admin.admin_phone }" readonly>
                  <p id = "edit_phone" class = "edit" style = "float : right; font-size : 18px; margin-top : 10px; margin-right : 30px;" onclick ="edit('phone')">수정하기</p></td>
               </tr>
               <tr>
                    <th>나의매장정보</th>
                    <td class = "adminMypage_management">
                     <c:forEach var = "store" items = "${store}" varStatus = "status">
                        <p class = "deleteStoreWrap"><input type = "button" class = "adminMypage_storeName" id = "${store.store_id }" value = "${store.store_name}">
                        <img src="${pageContext.request.contextPath}/images/minus.PNG" id = "${store.store_id}" class = "deleteStore"></p>
                     </c:forEach>
                  </td>
               </tr>
               <tr>
                  <th>회원정보관리</th>
                  <td class = "adminMypage_btnTd"><input type="button" id="adminMypage_deleteBtn" value="탈퇴" class = "adminMypage_deleteBtn"></td>
               </tr>
            </table>
         </form>


      </div>
   <!-- 매장 추가 모달창 -->
      <div class = "addStoreModal" id = "addStoreModal">
         <div class = 'addStoreWrap' id = "addStoreWrap">
           <div id = 'newAddStore'><p>매장을 추가하세요</p> <hr>
            <span class = 'storeClose' id = 'storeClose'>x</span>
            <div class = "store_nameWrap"><label for = "Store_name" style = "font-size : 20px;">매장 이름</label><br>
            <input type = "text" class = "addStore_name" id = "store_name"></div>
            <div class = "store_nameWrap"><label for = "store_address" style = "font-size : 20px;">매장 주소</label><br>
			<div class = "zipWrap" style = "position : relative">
				<input type="text" class="form-control d-inline" id="store_zip"	name="store_zip" readonly="readonly" placeholder="우편번호">
				<button type="button" class="btn bg-dark text-white" id="find_zip" onclick="execDaumPostcode()" >우편번호 찾기</button></div>
				<input type="text" class="form-control" id="store_address1"	name="store_address1" readonly="readonly" placeholder="도로명주소">
				<input type="text" class="form-control" id="store_address2"	name="store_address2" placeholder="상세주소"></div>
            <div class = "store_nameWrap"><label for = "store_num" style = "font-size : 20px;">매장 번호</label><br>
            <input type = "text" class = "addStore_num" id = "store_num"></div><br><hr>
            <input type = 'button' class = 'addBtn' id = 'addBtn' value = '매장등록'></div>
         </div>
      </div>
      
   <!-- 회원 탈퇴 모달창 -->
         <div id = "adminMypage_deleteModal" class = "adminMypage_deleteModal">
            <div class = "adminMypage_deleteDiv"><p>정말 탈퇴하시겠습니까?</p>
               <input type = "button" id = "adminMypage_deleteOkBtn" class = "adminMypage_deleteOkBtn" value = "탈퇴하기">
               <input type = "button" id = "adminMypage_deleteCancelBtn" class = "adminMypage_deleteCancelBtn" value = "취소하기">
            </div>
         </div>
   
   <!-- 매장 삭제 모달창 -->
         <div id = "storeDeleteModal" class = "storeDeleteModal">
            <div class = "storeDeleteDiv"><p>정말 매장을 날리시겠습니까?</p>
               <input type = "button" id = "storeDeleteBtn" class = "storeDeleteBtn" value = "삭제하기">
               <input type = "button" id = "storeDeleteCancel" class = "storeDeleteCancel" value = "취소하기">
            </div>
         </div>
</div>  
</body>
<script>
      $(document).ready(function(){
         $('#adminMypage_deleteModal').hide(); // 시작시 삭제모달창 가림
         $('#storeDeleteModal').hide(); // 시작시 매장삭제 모달창 가림
        // $('#addStoreModal').hide(); // 시작시 매장추가 모달창 가림
      });
      ///////////// 관리자 정보 수정/////////////
      function edit(e){ //수정하기를 눌렀을때
    	  if(e == "pw"){
    	  $('#adminMypage_' + e + '').focus().val("");
    	  }
    	  $('#adminMypage_' + e + '').css("border","3px solid red").attr("readonly", false);
    	  $('#edit_' + e + '').text("수정완료").attr("id", "edit_" + e + "Ok").attr("onclick","editOk(" + "'"+ e +"'" + ")");
      }
		function editOk(e){ //수정확인을 눌렀을때
	    	if($('#adminMypage_' + e + '').val() == ""){
    			  alert("제대로 정보를 입력하세요.");
			} else {
   		  		$.ajax({
   	  				url : '${pageContext.request.contextPath}' + '/admin/adminEdit' + e + '',
					type : 'post',
					data : $('#adminMypage_myForm').serialize(),
      				success : function(data){
      					alert("수정을 완료했습니다.");
	      				location.reload();
    	  			}
      			});
    		}
     	}
         //삭제버튼 클릭시 삭제확인 모달창이 뜸
         $('#adminMypage_deleteBtn').click(function(){
            $('#adminMypage_deleteModal').show();
         });
         
         //매장정보에 마우스오버시 매장에 대한 정보가 뜸
         $('.adminMypage_storeName').click(function(){ //반복문으로 만들어진것의 선택자를 id 로 입력하면 중복이되어 각각 이벤트를 줄 수 없으므로 class로 선택자를 준다.
            //console.log($(this).val());
            var store_id = $(this).attr("id");
            $.ajax({
               url : '${pageContext.request.contextPath}' + '/admin/adminMypage/' + store_id,
               type : 'get',
               success : function(data){
                  var str = "<div class = 'adminMypage_storeDetail' style = 'background-color : #eee;'>";
                     //조건필요없이 무조건 상세테이블 생성
                     str += "<table><tr><th colspan = '2' class = 'adminMypage_storeTitle' style = 'position : relative;'>매장 상세정보" + 
                     		"<span class = 'storeClose' id = 'storeDetailClose' style = 'position : absolute'>x</span></th></tr>"
                     str += "<tr><th>매장아이디</th><td>" + data.store_id + "</td></tr>";
                     str += "<tr><th>매장이름</th><td>" + data.store_name + "</td></tr>";
                     str += "<tr><th>우편번호</th><td>" + data.store_zip + "</td></tr>";
                     str += "<tr><th>매장주소</th><td>" + data.store_address + "</td></tr>";
                     str += "<tr><th>매장번호</th><td>" + data.store_num + "</td></tr>";
                     str += "<tr><th>등록날짜</th><td>" + data.store_regDate + "</td></tr></table></div>";
                  
                  $('.adminMypage_management').append(str);
               }
            });
         });           
         //모달창에서 삭제확인버튼클릭시 로그인페이지로 이동
         $('#adminMypage_deleteOkBtn').click(function(){
            $.ajax({
               url : '${pageContext.request.contextPath}' + '/admin/adminDelete',
               type : 'post',
               data : $('#adminMypage_myForm').serialize(),
               success : function(data){
                  alert("탈퇴처리 되었습니다.");
                  location.href = '<%=request.getContextPath()%>'
               }
            });
            $('#adminMypage_mainModal').hide();
         });
         
         //모달창에서 취소버튼 클릭시 다시 마이페이지이동
         $('#adminMypage_deleteCancelBtn').click(function(){
            
            $('#adminMypage_deleteModal').hide();
         
         });
         
         //모달창 밖의 영역을 누르면 띄워져 있는 모달창을 닫음
         $(window).on('click', function() {
            //jquery는 dom 객체를 jquery 객체로 한 번 감싸 리턴하므로 dom 객체를 얻어와야 비교 가능
            if (event.target == $('#adminMypage_mainModal').get(0)) {
                $('#adminMypage_mainModal').hide();
             } else if(event.target == $('#storeDeleteModal').get(0)){
               $('#storeDeleteModal').hide();
             } else if(event.target == $('#adminMypage_deleteModal').get(0)){
               $('#adminMypage_deleteModal').hide();
             } else if(event.target == $('#addStoreModal').get(0)){
               $('#addStoreModal').hide();
             }
         });
         
         var list = new Array(); //소유한 매장이름을 받아올 리스트
         <c:forEach items = "${store}" var = "store"> //소유한 매장이름을 list에 넣음
            list.push("${store.store_name}");
         </c:forEach>
         
         if(list.length < 10){ // 모든매장을 다 갖고있으면 매장추가 버튼이 사라진다
            $('.adminMypage_management').append('<input type = "button" id = "adminMypage_addStore" class = "adminMypage_addStore" value = "+">');
         }
         //매장 추가 클릭시 이벤트
         $('.adminMypage_addStore').click(function(){
         	$('#addStoreModal').show();
         });
         //console.log($('#adminMypage_id').val());
         $('#addBtn').click(function(){ //모달창에서 매장등록 눌렀을때 이벤트
            var store_address = $('#store_address1').val() + " " + $('#store_address2').val(); // 매장주소1,2 합친것
        	 $.ajax({
               url : '${pageContext.request.contextPath}' + '/admin/adminStoreAdd',
               type : 'post',
               data : {
                  store_name : $('#store_name').val(),
                  store_zip : $('#store_zip').val(),
                  store_address : store_address,
                  store_num : $('#store_num').val(),
                  admin_id : $('#adminMypage_id').val()
               },
               success : function(data){
                  alert("매장등록에 성공하셨습니다.");
                  location.reload();
               } //매장추가 성공 끝
            }); // 매장추가 ajax 끝 
         }); // 모달창 이벤트 끝
         
       //닫기버튼을 누르면 매장추가모달창 닫음
         $('#storeClose').click(function(){
            $('#addStoreModal').hide();
         });
         $(document).on('click','#storeDetailClose',function(){
        	$('.adminMypage_storeDetail').hide(); 
         });
         
         //매장 삭제클릭시 이벤트
         $('.deleteStore').click(function(){
               var store_id = $(this).attr("id"); // delete버튼의 아이디값
               console.log(store_id);
            $('#storeDeleteModal').show();
            $('#storeDeleteBtn').click(function(){
               $.ajax({
                  url : '${pageContext.request.contextPath}' + '/admin/adminStoreDelete',
                  type : 'post',
                  data : {
                     store_id : store_id
                  },
                  success : function(data){
                     alert("매장을 날리셨습니다.");
                    location.reload(); 
                  }
               }); // 삭제 ajax끝
            });
         }); //매장 삭제 클릭종료
         $('#store_zip, #store_address1').click(function() {
     		$('#find_zip').trigger('click');
     	});
       //모달창에서 취소버튼 클릭시 다시 마이페이지이동
         $('#storeDeleteCancel').click(function(){
            
            $('#storeDeleteModal').hide();
         
         });
   </script>
</html>