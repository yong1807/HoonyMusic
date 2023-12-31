<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>HoonyMusic</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<style>
	<style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap');

        @font-face {
            font-family: 'GmarketSansBold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
            font-weight: 700;
            font-style: normal;
        }
        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: 500;
            font-style: normal;
        }
        @font-face {
            font-family: 'GmarketSansLight';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff');
            font-weight: 300;
            font-style: normal;
        }

        *{margin:0; padding:0;}
        li{list-style: none;}
        a{text-decoration: none;}
        img{border:none; display: block;}
        body, header, section, footer, div, ul, li, p, a, span, input, textarea{font-family: 'Noto Sans KR', sans-serif; color: #222; font-size: 14px;}
        h1, h2, h3, h4, h5, h6{font-family: 'GmarketSansMedium'; color:#222;}

        #nav{position:fixed; width:15%; height:100%; box-shadow: 0 0 3px 0.5px rgb(228, 228, 228); background-color: #fff; overflow: auto;}
        #nav .nav_inner{padding-top: 40px;}
        #nav .logo{padding: 0 0 30px 40px;}
        #nav .logo a{color:#222; font-size:20px;}
        #nav .gnb ul{display: none;}
        #nav .gnb li{padding:10px 0 10px 40px; font-size:14px; font-family: 'GmarketSansMedium', sans-serif; color:#888; letter-spacing: 0.5px; word-spacing: -2px;}
        #nav .gnb li.dep2{padding-left:50px;}
        #nav .gnb li.dep3{padding-left:60px;}
        #nav .gnb a:hover li{color:#222; background-color: #eee;}
        #nav .gnb li.active{color:#222; background-color: #eee;}
        #nav .gnb a li{position:relative;}
        #nav .gnb a li .arrow{position:absolute; right:30px; top:12px;}
        #nav .gnb a li .arrow svg{width:100%; transition:0.3s;}

        #util{position:fixed; right:0; height: 80px;}
        #util .util_inner{position:relative; top:30px; right:50px; width:195px; height: 55px;}
        #util .util_inner li{width: 55px; height: 55px; border-radius: 25px; background-color: #fff; float:left; margin-right:15px; cursor: pointer; overflow: hidden; box-shadow: 1px 1px 3px 1px #ddd;}
        #util .util_inner li:last-child{margin-right:0;}
        #util .util_inner li svg{position:relative; top:15px; left:15px;}
        #util .util_inner li img{width:100%;}

        #common_list_form{padding-left:15%;}
        #common_list_form .big_title{padding: 50px 50px;}
        #common_list_form .sub_title{padding: 20px 50px;}
        #common_list_form .list_form{position:relative; }
        #common_list_form .list_form .list_title ul{width: 100%; height: 32px;}
        #common_list_form .list_form .list_title ul li{ float: left; border-top: 1px solid #999; border-bottom: 1px solid #222; padding:5px 0 5px 10px; box-sizing: border-box;}
        #common_list_form .list_form .list_title ul li:first-child{width: 15%; padding-left: 50px; }
        #common_list_form .list_form .list_title ul li:nth-child(2){width: 10%;}
        #common_list_form .list_form .list_title ul li:nth-child(3){width: 5%;}
        #common_list_form .list_form .list_title ul li:nth-child(4){width: 50%;}
        #common_list_form .list_form .list_title ul li:nth-child(5){width: 5%;}
        #common_list_form .list_form .list_title ul li:last-child{width: 15%;}
        #common_list_form .list_form .list_content ul{width:100%; height: 30px;}
        #common_list_form .list_form .list_content ul li{float:left; padding:5px 0 5px 10px; box-sizing: border-box;}
        #common_list_form .list_form .list_content ul li:first-child{width: 15%; padding-left: 50px; }
        #common_list_form .list_form .list_content ul li:nth-child(2){width: 10%;}
        #common_list_form .list_form .list_content ul li:nth-child(3){width: 5%;}
        #common_list_form .list_form .list_content ul li:nth-child(4){width: 50%;}
        #common_list_form .list_form .list_content ul li:nth-child(5){width: 5%;}
        #common_list_form .list_form .list_content ul li:last-child{width: 15%;}
        #common_list_form .list_form .list_content ul li a:hover{text-decoration: underline;}
        #common_list_form .list_form .list_content ul:hover{background-color: #eee;}
        
        /* list form 스타일 */
        #common_list_form .list_form .first_list{width: 50%; float: left;}
        #common_list_form .list_form .first_list:last-child li{width: 100%;}
        #common_list_form .list_form .first_list li{float: left; width: 50%; border-bottom: 1px solid #333; box-sizing: border-box;}
        #common_list_form .list_form .first_list:first-child li:nth-child(2n-1){font-weight: 500; text-align: center;}

        #bottom_music{position:fixed; width:100%; height:80px; bottom:0; background-color: #eb568e;}
        
        table, th, td{
        	border: 1px solid black;
    		border-collapse: collapse;
    		padding: 5px 10px;
        }
        table{
        	width: 70%;
        	height: 55%;
        }
        
        #add_modal, #cancel_modal{
			display: none; 
			width:300px; 
			height:150px; 
			background: rgb(237, 237, 237); 
			border:1px solid gray; 
			text-align:center;
			position:absolute; 
			left:50%; 
			bottom: 50%;
		}
		
		.modalBtnNo, .modalBtnYes{
			height: 35px;
			width: 80px;
			color: white;
			border: none;
			border-radius: 10px;
			background-color: gray;
		}
    </style>
<body>
    <!-- -------------------------------------------nav start------------------------------------------ -->
    <div id="nav">
        <div class="nav_inner">
            <h1 class="logo"><a href="javascript:">Hoony Music</a></h1>
            <ul class="gnb">
                <a href="javascript:"><li class="dep1">게시판</li></a>
                <a href="javascript:"><li class="dep1" data-index="1">쪽지
                    <div class="arrow"><svg width="12" height="12" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
                    <path fill="#888" d="M338.752 104.704a64 64 0 0 0 0 90.496l316.8 316.8l-316.8 316.8a64 64 0 0 0 90.496 90.496l362.048-362.048a64 64 0 0 0 0-90.496L429.248 104.704a64 64 0 0 0-90.496 0"/>
                    </svg></div>
                </li></a>
                <ul data-index="1">
                    <a href="javascript:"><li class="dep2">쪽지 쓰기</li></a>
                    <a href="javascript:"><li class="dep2">받은 쪽지함</li></a>
                    <a href="javascript:"><li class="dep2">보낸 쪽지함</li></a>
                    <a href="javascript:"><li class="dep2">휴지통</li></a>
                </ul>
                <a href="javascript:"><li class="dep1" data-index="2">전자결재
                    <div class="arrow"><svg width="12" height="12" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
                    <path fill="#888" d="M338.752 104.704a64 64 0 0 0 0 90.496l316.8 316.8l-316.8 316.8a64 64 0 0 0 90.496 90.496l362.048-362.048a64 64 0 0 0 0-90.496L429.248 104.704a64 64 0 0 0-90.496 0"/>
                    </svg></div>
                </li></a>
                <ul data-index="2">
                    <a href="javascript:"><li class="dep2">결재 대기 문서</li></a>
                    <a href="javascript:"><li class="dep2">결재 예정 문서</li></a>
                    <a href="javascript:"><li class="dep2">참조 대기 문서</li></a>
                    <a href="javascript:"><li class="dep2" data-index="3">결재 보관함
                        <div class="arrow"><svg width="12" height="12" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
                            <path fill="#888" d="M338.752 104.704a64 64 0 0 0 0 90.496l316.8 316.8l-316.8 316.8a64 64 0 0 0 90.496 90.496l362.048-362.048a64 64 0 0 0 0-90.496L429.248 104.704a64 64 0 0 0-90.496 0"/>
                            </svg></div>
                    </li></a>
                    <ul data-index="3">
                        <a href="javascript:"><li class="dep3">삭제 문서</li></a>
                        <a href="javascript:"><li class="dep3">수정 문서</li></a>
                    </ul>
                </ul>
                <a href="javascript:"><li class="dep1" data-index="4">일정관리
                    <div class="arrow"><svg width="12" height="12" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
                        <path fill="#888" d="M338.752 104.704a64 64 0 0 0 0 90.496l316.8 316.8l-316.8 316.8a64 64 0 0 0 90.496 90.496l362.048-362.048a64 64 0 0 0 0-90.496L429.248 104.704a64 64 0 0 0-90.496 0"/>
                    </svg></div>
                </li></a>
                <ul data-index="4">
                    <a href="javascript:"><li class="dep2">전사 일정</li></a>
                    <a href="javascript:"><li class="dep2" data-index="5">부서 일정
                        <div class="arrow"><svg width="12" height="12" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
                            <path fill="#888" d="M338.752 104.704a64 64 0 0 0 0 90.496l316.8 316.8l-316.8 316.8a64 64 0 0 0 90.496 90.496l362.048-362.048a64 64 0 0 0 0-90.496L429.248 104.704a64 64 0 0 0-90.496 0"/>
                            </svg></div>
                    </li></a>
                    <ul data-index="5">
                        <a href="javascript:"><li class="dep3">일정 쓰기</li></a>
                        <a href="javascript:"><li class="dep3">일정 예약</li></a>
                    </ul>
                    <a href="javascript:"><li class="dep2" data-index="6">내 일정
                        <div class="arrow"><svg width="12" height="12" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg">
                            <path fill="#888" d="M338.752 104.704a64 64 0 0 0 0 90.496l316.8 316.8l-316.8 316.8a64 64 0 0 0 90.496 90.496l362.048-362.048a64 64 0 0 0 0-90.496L429.248 104.704a64 64 0 0 0-90.496 0"/>
                            </svg></div>
                    </li></a>
                    <ul data-index="6">
                        <a href="javascript:"><li class="dep3">일정 쓰기</li></a>
                        <a href="javascript:"><li class="dep3">일정 예약</li></a>
                    </ul>
                </ul>
                <a href="javascript:"><li class="dep1">공용자료실</li></a>
                <a href="javascript:"><li class="dep1">시설예약</li></a>
                <a href="javascript:"><li class="dep1">근태관리</li></a>
                <a href="javascript:"><li class="dep1">차량관리</li></a>
                <a href="javascript:"><li class="dep1">복지몰</li></a>
            </ul>
        </div>
    </div>
    <!-- -------------------------------------------nav end------------------------------------------ -->
    <!-- -------------------------------------------util start------------------------------------------ -->
    <div id="util">
        <ul class="util_inner">
            <li class="search">
                <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path fill="#eb568e" d="M10 18a7.952 7.952 0 0 0 4.897-1.688l4.396 4.396l1.414-1.414l-4.396-4.396A7.952 7.952 0 0 0 18 10c0-4.411-3.589-8-8-8s-8 3.589-8 8s3.589 8 8 8m0-14c3.309 0 6 2.691 6 6s-2.691 6-6 6s-6-2.691-6-6s2.691-6 6-6"/>
                </svg>
            </li>
            <li class="Notification">
                <svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path fill="#eb568e" d="M4 8a8 8 0 1 1 16 0v4.697l2 3V20h-5.611a4.502 4.502 0 0 1-8.777 0H2v-4.303l2-3zm5.708 12a2.5 2.5 0 0 0 4.584 0zM12 2a6 6 0 0 0-6 6v5.303l-2 3V18h16v-1.697l-2-3V8a6 6 0 0 0-6-6"/>
                </svg>
            </li>
            <li class="profile"><img src="./img/kang.jpg" alt="231217_강태오"></li>
        </ul>
    </div>
    <!-- -------------------------------------------util end------------------------------------------ -->
    <!-- -------------------------------------------list_form start------------------------------------------ -->
    <section id="common_list_form">
        <h2 class="big_title">음반</h2>
        <h3 class="sub_title">상세보기</h3>
        <input type="button" value="계약 취소" onclick="openCancelModal()"/>
        <input type="button" value="목록" onclick="location.href='/album'"/>
        <form action="albumFile.do" method="post" enctype="multipart/form-data">
        	<input type="file" id="file" name="files" multiple/>
        	<input type="hidden" name="alb_no" value="${albumDetail.alb_no}"/>
        	<input type="submit" value="등록">
        </form>
        <div class="list_form">
            <ul class="first_list">
                <li>음반명</li>
                <li>${albumDetail.alb_name}</li>
                <li>아티스트명</li>
                <li>${albumDetail.art_name}</li>
                <li>계약 시작일</li>
                <li>${albumDetail.alb_startdate}</li>
                <li>계약 만료일</li>
                <li>${albumDetail.alb_expiredate}</li>
                <li>계약일</li>
                <li>${albumDetail.alb_contract}</li>
                <li>제작 단가(KRW)</li>
                <li id="albpro_price"></li> <!-- 숫자 천 단위 구분 표시를 위해 js 에서 처리 -->
                <li>판매 가격(KRW)</li>
                <li id="alb_price"></li>
                <li>담당자</li>
                <li>${albumDetail.member_id}</li>
                <li>수익 분배율</li>
                <li>${albumDetail.alb_revenue}</li>
                <li>첨부 파일</li>
                <li>
					<c:forEach items="${list}" var="file">
						<p>
							${file.file_newname}
							<button onclick="location.href='albumDownload.do?newName=${file.file_newname}&oriName=${file.file_oriname}'">download</button>
						</p>
					</c:forEach>
                </li>
            </ul>
            <ul class="first_list">
                <li>생산 회차별 판매량과 재고량 <select id="option"></select></li>
                <li>
                	<div><canvas id="doughnut" style="width: 300px; height:300px;"></canvas></div>
                	<input type="button" value="추가 생산" onclick="openAddModal()"/>
                </li>
            </ul>
        </div>
       	
       	<!------ 추가 생산 모달 ------>
		<div id="add_modal">
			<div style="margin:30px 0; font-size:22px;">추가 생산을 하시겠습니까? 결재 페이지로 이동합니다.</div>
			<button id="addNo" class="modalBtnNo">아니요</button>
			<button id="addYes" class="modalBtnYes">예</button>	
		</div>
		<!------ 계약 취소 모달 ------>
		<div id="cancel_modal">
			<div style="margin:30px 0; font-size:22px;">계약을 취소 하시겠습니까?</div>
			<button id="cancelNo" class="modalBtnNo">아니요</button>
			<button id="cancelYes" class="modalBtnYes">예</button>	
		</div>
    </section>
    <!-- -------------------------------------------list_form end------------------------------------------ -->
    <!-- -------------------------------------------music start------------------------------------------ -->
    <div id="bottom_music">
        <div class="music_inner">

        </div>
    </div>
    <!-- -------------------------------------------music end------------------------------------------ -->
</body>
<script>
//-------------------------------- 숫자 천 단위 구분 표시 start ------------------------------------------
var albpro = ${albumDetail.albpro_price};
var alb = ${albumDetail.alb_price};
document.getElementById('albpro_price').textContent = albpro.toLocaleString();
document.getElementById('alb_price').textContent = alb.toLocaleString();
//-------------------------------- 숫자 천 단위 구분 표시 end ------------------------------------------


// 옵션별 데이터로 차트 초기화를 위한 전역 변수 myChart 선언
var myChart;
//-------------------------------- select 필터링 start ------------------------------------------
var selectElement = document.getElementById('option');
var initialRound = ${albumDetail.albpro_round}; // 생산 회차는 최대값으로 설정 (mapper 에서 처리)

// option 값을 initialRound에서 하나씩 빼면서 1회차까지만 나타내기
for (var i = initialRound; i > 0; i--) {
	var option = document.createElement('option');
	option.value = i;
	option.textContent = i + '회차';
	selectElement.appendChild(option);
}

// option 변경시 변경된 option 값으로 차트 데이터를 가져오는 getChartData 함수 실행
selectElement.addEventListener('change', function () {
	 var optionVal = this.value;
	 console.log('Selected Value:', optionVal);
	 getChartData(optionVal);
});
//-------------------------------- select 필터링 end ------------------------------------------


//-------------------------------- 그래프 start ------------------------------------------
document.addEventListener("DOMContentLoaded", function () {
    getChartData();
});

function getChartData(option){
	var num = ${albumDetail.alb_no};
	console.log('option :', option); // option value 찍히는지 확인
	// ajax 로 데이터 가져오기
	$.ajax({
		type:'get',
		url:'albumChartData',
		data:{"num":num, "optionVal":option},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			drawChart(data);
		},
		error:function(e){
			console.log(e);
		}
	});
}

function drawChart(data){
	// 새로운 데이터로 차트를 갱신하기 위해 기존 차트 파괴
    if (myChart) {
        myChart.destroy();
    }
	
	data.list.forEach(function(item,idx){
		console.log(item.albsold_amount);
		console.log(item.albsold_stock);
		const hasAmount = item.albsold_amount !== 0;
		const hasStock = item.albsold_stock !== 0;
		
	    const chartData = {
	            labels: ['판매량', '재고량'],
	            datasets: [{
	                data: [hasAmount ? item.albsold_amount : 0, hasStock ? item.albsold_stock : 0],
	                backgroundColor: ['rgb(255, 99, 132)', 'rgb(54, 162, 235)'],
	            }],
	        };
		
		const config = {
				  type: 'doughnut',
				  data: chartData,
				  options: {
					    responsive: false,
					    maintainAspectRatio: false, // 가로 세로 비율 유지하지 않음
					    width: 300, 
					    height: 300, 
						}
		};
		
		// 전역으로 선언된 myChart 변수 갱신 (위에 선언된 const myChart;)
		myChart = new Chart(document.getElementById('doughnut'), config);
	});
}
//-------------------------------- 그래프 end ------------------------------------------


//-------------------------------- 모달 창 start ------------------------------------------
function openAddModal(){
	var modal = document.getElementById('add_modal');
	var yesBtn = document.getElementById('addYes');
	var noBtn = document.getElementById('addNo');
	modal.style.display = 'block';
	
	noBtn.onclick = function() {
        modal.style.display = "none";
    }
	
	yesBtn.onclick = function(){
		location.href = "./결재 페이지"; 
	}
}

function openCancelModal(){
	var modal = document.getElementById('cancel_modal');
	var yesBtn = document.getElementById('cancelYes');
	var noBtn = document.getElementById('cancelNo');
	modal.style.display = 'block';
	
	noBtn.onclick = function() {
        modal.style.display = "none";
    }
	
	yesBtn.onclick = function(){
		location.href = "./결재 페이지"; 
	}
}
//-------------------------------- 모달 창 end ------------------------------------------


// -------------------------------- toggle start ------------------------------------------
document.addEventListener('DOMContentLoaded', function () {
    var dep1Items = document.querySelectorAll('.gnb .dep1[data-index]');
    var dep2Items = document.querySelectorAll('.gnb .dep2[data-index]');

    dep1Items.forEach(function (item) {
      item.addEventListener('click', function () {
        var dataIndex = item.getAttribute('data-index');
        var targetUl = document.querySelector('.gnb ul[data-index="' + dataIndex + '"]');
        var isActive = targetUl.classList.contains('active');

        if (!isActive) {
            $(targetUl).stop().slideDown(300);
            $(targetUl).addClass('active');
            $(targetUl).siblings('ul').removeClass('active').slideUp(300);
            $(this).addClass('active');
            $(this).find('.arrow>svg').css('transform','rotate(90deg)');
            if($(this).parents('a').siblings().find('li .arrow svg').css('transform','rotate(90deg)')){
                $(this).parents('a').siblings().find('li .arrow svg').css('transform','rotate(0deg)');
                $(this).parents('a').siblings().find('li.active').removeClass('active');
            }
        } else {
            $(targetUl).stop().slideUp(300);
            $(targetUl).removeClass('active');
            $(this).find('.arrow>svg').css('transform','rotate(0deg)');
            $(this).removeClass('active');
        }
      });
    });

    dep2Items.forEach(function (item) {
      item.addEventListener('click', function (e) {
        var dataIndex = item.getAttribute('data-index');
        var targetUl = document.querySelector('.gnb ul ul[data-index="' + dataIndex + '"]');
        var isActive = targetUl.classList.contains('active');

        if (!isActive) {
            $(targetUl).stop().slideDown(300);
            $(targetUl).addClass('active');
            $(targetUl).siblings('ul').removeClass('active').slideUp(300);
            $(this).addClass('active');
            $(this).find('.arrow>svg').css('transform','rotate(90deg)');
            if($(this).parents('a').siblings().find('li .arrow svg').css('transform','rotate(90deg)')){
                $(this).parents('a').siblings().find('li .arrow svg').css('transform','rotate(0deg)');
                $(this).parents('a').siblings().find('li.active').removeClass('active');
            }
        } else {
            $(targetUl).stop().slideUp(300);
            $(targetUl).removeClass('active');
            $(this).find('.arrow>svg').css('transform','rotate(0deg)');
            $(this).removeClass('active');
        }
      });
    });
  });
//-------------------------------- toggle end ------------------------------------------
</script>
</html>