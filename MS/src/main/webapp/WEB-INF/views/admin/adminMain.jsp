<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Management System</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}
.adminMain_container {
	padding: 20px;
}

.title_text {
	font-size: 40px;
	font-weight: bold;
	text-align: center;
}

.left_area {
	width: 30%;
	float: left;
}

.right_area {
	width: 70%;
	float: right;
}

/* 사용자 정보 표시 */
.left_content {
	position: absolute;
	border-radius: 15px;
	border: 1px solid black;
	box-shadow:3px 3px 3px 3px #999;
	text-align: center; /* 컨텐트 안의 모든 요소 가운데 정렬 */
	font-size: 27px;
	width: 26%;
	height: 75%;
	margin-left: 2%;
	margin-top: -2%;
}

.left_content_title {
	position: relative;
	top: -15%;
	padding-top: 2%;
	border: 1px solid black;
	border-radius: 15px;
	background-color: #2BBBAD;
	font-size: 25px;
	font-weight: bold;
	color: white;
	width: 60%;
	height: 40%;
	margin: 0 auto;
}

/* 웹에 접근한 기기가 screen일 때 세로 길이가 700px 미만일 때 */
@media screen and (max-height:700px) {
	.left_content {
		overflow-y: scroll; /* 애초부터 auto 설정해주면 타이틀 보이지 않으므로 */
		height: 60%;
	}
	
	.left_content_title {
		padding-top: 15px;
		height: 55px;
	}
}

/* 웹에 접근한 기기가 screen일 때 가로 길이가 1500px 미만일 때 */
@media screen and (max-width:1500px){
	.left_content {
		overflow-y: scroll;
	}
	
	.left_content_title {
		padding-top: 25px;
		height: 65px;
	}
}

.user_info_wrap {
	overflow: auto;
	text-align: left;
	padding: 10px;
	font-size: 20px;
	border: 1px solid black;
	margin-left: 20px;
	margin-right: 20px;
	margin-bottom: 7%;
}

.order_list_wrap {
	overflow: auto;
	text-align: left;
	padding: 10px;
	font-size: 20px;
	border: 1px solid black;
	margin-left: 20px;
	margin-right: 20px;
}

.seat_list {
	width: 90%;
	margin: 0 auto;
	margin-left: 6%;
}

.seat_list > div {
	float: left;
	width: 22%;
	height: 200px; 	
	font-size: 30px;
	border-radius: 15px;
	margin-right: 3%;
	margin-top: 3%;
}

.seat_list > div:hover {
	opacity: 0.7;
	cursor: pointer;
}

.using {
	background-color: #0099CC;
	color: white;
	text-align: right;
	padding: 10px;
}

/* 타이틀 스타일 */
.using > div:nth-child(1) {
	background-color: #33b5e5;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	padding-left: 5px;
	padding-right: 5px;
}

/* 사용 종료 버튼 스타일 */
.using > button {
	width: 100%;
	background-color: lightgray;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
	border: none;
	text-align: center;
	color: black;
	font-size: 25px;
}

.using > button:hover {
	color: red;
}

.un_using {
	line-height: 200px;
	background-color: lightgray;
	color: gray;
	text-align: center;
}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<%@ include file="/WEB-INF/views/modal/adminAddTimeModal.jsp"%>
	
	<!-- 오늘 날짜 구하기 -->
	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/></c:set> 
	
	<div class="adminMain_container">
		<div class="title_text">[${storeSelectSession.store_name}]</div>
			
		<div class="left_area">
			<div class="left_content">
				<div style="height: 25%">
					<div class="left_content_title"><c:out value="${sysYear}" /></div>
					<div class="com_cnt_text"><span id="useCnt">0</span> / <span id=totalCnt>20</span></div>
					<hr style="border: 1px dashed gray">
				</div>
				
				<div style="height: 75%">
					<div style="height: 10%"><b>사용자 정보</b></div>
					<div style="height: 28%" id="selectedUserInfo" class="user_info_wrap">
						<span style="color: red">* 좌석을 선택하세요.</span>
					</div>
					
					<div style="height: 10%"><b>음식 주문 목록</b></div>
					<div style="height: 28%" class="order_list_wrap">
						<span style="color: red">* 주문 대기 중인 음식이 없습니다.</span>
					</div>
				
					<div style="height: 22%; margin-top: 2%" class="main_btn_wrap">
						<button type="button" class="btn btn-mdb-color" id="showAddTimeModalBtn">충전</button>
						<button type="button" class="btn btn-deep-orange" id="seatChangeBtn">자리 변경</button>
					</div>
				</div>
			</div>
		</div>
		<div class="right_area">
			<div id="seatList" class="seat_list"></div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/admin/adminMessage.jsp" %>
</body>

<script>
	$(document).ready(function() {
		var currentPosition = parseInt($('.left_content').css('top'));
		
		/* 스크롤따라 움직이는 Div */
		$(window).scroll(function() {
			var position = $(window).scrollTop();
			$('.left_content').stop().animate({
				'top' : position + currentPosition + 'px'
			}, 1000);
		});
		
		/* 시간 select option 초기화  */
		for (var i = 1; i <= 12; i++) {
			var option = '<option value='+ i + '>' + i + ' 시간</option>';
			$('#selectAddTime').append(option);
		}
		
		/* 페이지 로드 시 좌석 초기화 */
		$.ajax({
			url: '${pageContext.request.contextPath}/admin/getSeatListAll?storeId=${storeSelectSession.store_id}', 
			type: 'get',
			success:function(data){ 
				var str = '';
				var useCnt = 0;
				$('#totalCnt').text(data.length); // 전체 좌석 수 표시
				
				for(var i=0; i<data.length; i++){
					if(data[i].user_id != null){ // 사용 중인 좌석
						str += '<div class="using" onclick="seatChoise(this, '+ data[i].seat_id +', \''+ data[i].user_id +'\')">';
						str += '<div style="height:25%"><span style="float:left; color:black">'+ data[i].seat_id +'</span><span>'+ data[i].user_id +'</span></div>';
						str += '<div style="height:25%">100분</div>';
						str += '<div style="height:25%">5000</div>';
						str += '<button style="height:25%" onclick="deleteSeat(event, '+ data[i].seat_id +')">사용 종료</button>';
						str += '</div>';
						useCnt++;
					}
					else{ // 빈 좌석
						str += '<div class="un_using">'+ data[i].seat_id +'</div>';
					}
				}
				$('#useCnt').text(useCnt); // 현재 사용 중인 좌석 수 표시
				$('#seatList').html(str); // 좌석 표시
				
			} // end success
		}); // end ajax
		
		/* Main 충전 버튼 */
		$('#showAddTimeModalBtn').on('click', function () {
			var seatId = $('.selected').attr('id');
			
			if(seatId != null){
				$('#seatNum').text(seatId); // modal창의 좌석 번호 변경
				$('#addTimeModal').show();
			}
		});
		
		/* Modal 충전 버튼 */
		$('#addTimeBtn').on('click', function () {
			var addTime = $('#selectAddTime option:selected').val()*60*60;
			var userId = $('#userId').text();
			
			if(addTime == 0){
				alert('충전하실 시간을 선택하세요.');
				return;
			}
			
			$.ajax({
				url: '${pageContext.request.contextPath}/admin/updateAddTime?storeId=${storeSelectSession.store_id}&userId='+userId+'&addTime='+addTime,
				type:'get',
				
				success:function(data){
					location.reload();
				}
			});
		});

		/* 시간 충전 modal 창 닫기 버튼 클릭 시 처리 */
		$('.close').on('click', function() {
			$('#addTimeModal').hide();
		});

		/* modal 창 외 윈도우 클릭 시 처리 */
		$(window).on('click', function() {
			if (event.target == $('#addTimeModal').get(0)) {
				$('#addTimeModal').hide();
			}
		});	
		
		/* 웹페이지 닫기, 새로고침, 다른 URL로 이동 시에 발생 */
		window.onbeforeunload = function() {
			<%-- $.ajax({
				// 사용 시간 전송
				url: '<%=request.getContextPath()%>/admin/updateSaveTimeAll?useTime=' + useTime + '&storeId=' + storeId, 
				type: 'get',
				
				success:function(){
					console.log("시간 저장 완료");
				}
			}); --%>
		};
		
		
	}); // end $(document).ready(function())} 
	
	/* 사용 중인 좌석 선택 */
	function seatChoise(e ,seatId, userId){
		if($(e).hasClass('selected')){ // 선택된 상태
			$(e).css({'opacity': '', 'border': ''});
			$(e).removeAttr('id');
			$(e).removeClass('selected');
			$('#selectedUserInfo').html('<span style="color:red">* 좌석을 선택하세요.</span>');
		}
		else{ // 선택되지 않은 상태
			$('.selected').css({'opacity': '', 'border': ''});
			$('.selected').removeAttr('id');
			$('.selected').removeClass('selected');
			
			$(e).css({'opacity': '0.5', 'border': '3px solid black'});
			$(e).attr('id', seatId);
			$(e).addClass('selected');
			$('#userId').text(userId); // modal창의 숨겨진 span태그의 텍스트 변경
			
			$.ajax({ 
				url:'${pageContext.request.contextPath}/admin/getUserInfo?storeId=${storeSelectSession.store_id}&userId='+userId,
				type:'get',
				
				success:function(data){
					var str = '<span style="color:black">* 이름: ' + data.user_name + '<br>';
					str += '* 전화번호: ' + data.user_phone + '<br>';
					str += '* 생년월일: ' + data.user_birth + '</span>';
					$('#selectedUserInfo').html(str);
				} // end success 
			}); // end ajax
		}
	}
	
	/* 사용 종료 버튼 */
	function deleteSeat(e, seatId) {
		e.stopPropagation(); // 이벤트 버블링 중지		
		var deleteConfirm = confirm('정말 종료하시겠습니까?'); 
		
		if(deleteConfirm){
			$.ajax({
				url: '${pageContext.request.contextPath}/admin/deleteSeat?storeId=${storeSelectSession.store_id}&seatId='+seatId, 
				type: 'get',
				
				success:function(){
					location.reload();
				}  
			});
		}
	}
	
	/* 가격에 콤마 표시 */
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

</script>
</html>