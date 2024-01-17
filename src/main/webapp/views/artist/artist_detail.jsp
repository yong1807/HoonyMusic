<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
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
        li{list-style: none; width: 1000px;}
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
        #common_list_form .list_form{position:relative;}
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

        #bottom_music{position:fixed; width:100%; height:80px; bottom:0; background-color: #eb568e;}
        
        
        
                
        /* =============검색====================== css */
        
        #common_list_form .search_box{position: relative; margin: 50 0 10px 800px; border: 1px solid #fff; display: inline-block;}
        #common_list_form .search_box li{float: left;}
        #common_list_form .search_box select{width: 100px; height: 28px; border: 1px solid #ccc; border-right: none;}
        #common_list_form .search_box .search_info{width:250px; height: 28px; border: 1px solid #ccc; box-sizing: border-box; padding-left:5px;}
        #common_list_form .search_box .search_info::placeholder{color: #ccc;}
        #common_list_form .search_box .btn_box{width: 28px; height: 28px; cursor: pointer; border: 1px solid #ccc; box-sizing: border-box; border-left: none;}
        #common_list_form .search_box .btn_box .search_btn{position:relative; width: 14px; height: 14px; left: 50%; top: 50%; transform: translate(-50%, -50%);}
        #common_list_form .search_box .btn_box .search_btn img{width: 100%;}
        #common_list_form .search_box:hover select{border: 1px solid #333; border-right: none;}
        #common_list_form .search_box:hover #search_info{border-top: 1px solid #333; border-bottom: 1px solid #333;}
        #common_list_form .search_box:hover .btn_box{border: 1px solid #333; border-left: none;}
        
        
        /*  */
        
                #common_list_form .list_form .list_title1 ul{width: 100%; height: 32px;}
        #common_list_form .list_form .list_title1 ul li{ float: left; border-top: 1px solid #999; border-bottom: 1px solid #222; padding:5px 0 5px 10px; box-sizing: border-box;}
        #common_list_form .list_form .list_title1 ul li:first-child{width: 15%; padding-left: 50px; }
        #common_list_form .list_form .list_title1 ul li:nth-child(2){width: 10%;}
        #common_list_form .list_form .list_title1 ul li:nth-child(3){width: 5%;}
        #common_list_form .list_form .list_title1 ul li:nth-child(4){width: 50%;}
        #common_list_form .list_form .list_title1 ul li:nth-child(5){width: 5%;}
        #common_list_form .list_form .list_title1 ul li:last-child{width: 15%;}
        
                #common_list_form .list_form .list_title2 ul{width: 100%; height: 32px;}
        #common_list_form .list_form .list_title2 ul li{ float: left; border-top: 1px solid #999; border-bottom: 1px solid #222; padding:5px 0 5px 10px; box-sizing: border-box;}
        #common_list_form .list_form .list_title2 ul li:first-child{width: 15%; padding-left: 50px; }
        #common_list_form .list_form .list_title2 ul li:nth-child(2){width: 10%;}
        #common_list_form .list_form .list_title2 ul li:nth-child(3){width: 5%;}
        #common_list_form .list_form .list_title2 ul li:nth-child(4){width: 50%;}
        #common_list_form .list_form .list_title2 ul li:nth-child(5){width: 5%;}
        #common_list_form .list_form .list_title2 ul li:last-child{width: 15%;}
        
                #common_list_form .list_form .list_title3 ul{width: 100%; height: 32px;}
        #common_list_form .list_form .list_title3 ul li{ float: left; border-top: 1px solid #999; border-bottom: 1px solid #222; padding:5px 0 5px 10px; box-sizing: border-box;}
        #common_list_form .list_form .list_title3 ul li:first-child{width: 15%; padding-left: 50px; }
        #common_list_form .list_form .list_title3 ul li:nth-child(2){width: 10%;}
        #common_list_form .list_form .list_title3 ul li:nth-child(3){width: 5%;}
        #common_list_form .list_form .list_title3 ul li:nth-child(4){width: 50%;}
        #common_list_form .list_form .list_title3 ul li:nth-child(5){width: 5%;}
        #common_list_form .list_form .list_title3 ul li:last-child{width: 15%;}
    </style>
<body>
    <!-- -------------------------------------------nav start------------------------------------------ -->
    <%@ include file="/views/nav.jsp" %>
    <!-- -------------------------------------------nav end------------------------------------------ -->
    <!-- -------------------------------------------util start------------------------------------------ -->
    
    <!-- -------------------------------------------util end------------------------------------------ -->
    <!-- -------------------------------------------list_form start------------------------------------------ -->
    <section id="common_list_form">
        <h2 class="big_title">아티스트 상세보기</h2>
	<!-- 아티스트 이름 소속사 명 -->
		<div>
		<table>
			<tr>
				<td>
				
				
				<input type="text" value="${name}" id="name"/>
				
				</td>
			</tr>
			<tr>
				<td>
				
				
				<input type="text" value="${agency}" id="agency"/>
				
				</td>
			</tr>
		</table>
		
		
		
		</div>
		<!-- 아티스트 관련 목록들 -->
		<div>
		
		
			<table>
			<tr>
				<td>
				
		<h3 class="sub_title">음반실적</h3>
         <div class="list_form">
            <ul>
                <li class="list_title1" id="list1">
                    <ul>
                        <li>no.</li>
                        <li>음반명</li>
                        <li>계약금</li>
                    </ul>
                </li>
				
				<li class="list_title" id="list_1">
				
				</li>

             </ul>
             

        </div>
		<div id="paging" class="pagingBox">
			<!-- 	플러그인 사용	(twbsPagination)	- 이렇게 사용하라고 tutorial 에서 제공함-->
			<div class="container">
				<nav aria-label="Page navigation" style="text-align: center">
					<ul class="pagination" id="getpagination1"></ul>
				</nav>
			</div>
			
		</div>
				
				</td>
			</tr>
			<tr>
				<td>
				
		<h3 class="sub_title">음원실적</h3>
         <div class="list_form">
            <ul>
                <li class="list_title2" id="list2">
                    <ul>
                        <li>no.</li>
                        <li>음원명</li>
                        <li>계약금</li>
                    </ul>
                </li>
				
				<li class="list_title" id="list_2">
				
				</li>

             </ul>
             

        </div>
		<div id="paging" class="pagingBox">
			<!-- 	플러그인 사용	(twbsPagination)	- 이렇게 사용하라고 tutorial 에서 제공함-->
			<div class="container">
				<nav aria-label="Page navigation" style="text-align: center">
					<ul class="pagination" id="getpagination2"></ul>
				</nav>
			</div>
		</div>
				
				</td>
			</tr>
			</table>
		</div>

    </section>
    <!-- -------------------------------------------list_form end------------------------------------------ -->
    <!-- -------------------------------------------music start------------------------------------------ -->

    <!-- -------------------------------------------music end------------------------------------------ -->
</body>
<script>

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


//-------------------------------search---------------------------------------------

var search = "";
var showPage=1;//페이징을 위한 변수
var searchtag ="";

var name = $("#name").val();
var num = ${num};

//--------------------------------ajax list1------------------------------------------



call1(showPage);
call2(showPage);

function call1(showPage){
   $.ajax({
        type : 'POST',
        url : '/artistdetail_1',
        data:{
        	
        	'pagePerNum':5
        	,'page':showPage
        	,'num' : num
        	
        },
        dataType:'json',
        success:function(data){
        	//alert("성공");
        	
        	paging(data);
        	
            console.log(data);
            var content ='';

            data.list.forEach(function(item,idx){
                //content += '<a href="https://www.google.com/maps/place/'+item.address+'" target="_blank">';
                content += '<ul>';
                content += '<li id="'+item.alb_no+'">'+item.alb_no+'</li>';
                content += '<li id="'+item.alb_name+'">'+"<a href = 'albumDetail?alb_no="+item.alb_no+"'>"+item.alb_name+"</a>"+'</li>';
                content += '<li id="'+item.alb_price+'">'+item.alb_price+'</li>';
                content += '</ul>';
            });
            $('#list_1').empty();
            $('#list_1').append(content);


        },error:function(e){
            console.log(e);
            alert("실패");
        }
    });

}   
   

   function paging(list){
	   console.log("list : ", list);
		$('#getpagination1').twbsPagination({
			startPage:list.currPage,//보여줄 페이지
			totalPages:list.pages,//총페이지수(총갯수/페이지당 보여줄 게시물수) : 서버에서 계산해서 가져와야 한다.
			visiblePages:5,//[1][2][3][4][5]
			onPageClick:function(e,page){//번호 클릭시 실행할 내용
			
					
					if(showPage!=page){
						

						console.log("con1 : "+page);
						showPage = page;//클릭해서 다른 페이지를 보여주게 되면 현재 보고있는 페이지 번호도 변경해준다.
						
						call1(page);
						
			}

			}
			
		});
   }
   
   //-------------------------------ajax.list2------------------------------------------

   function call2(showPage){
   $.ajax({
        type : 'POST',
        url : '/artistdetail_2',
        data:{
        	
        	'pagePerNum':5
        	,'page':showPage
        	,'num' : num
        	
        },
        dataType:'json',
        success:function(data){
        	//alert("성공");
        	
        	paging2(data);
        	
            console.log(data);
            var content ='';

            data.list.forEach(function(item,idx){
                //content += '<a href="https://www.google.com/maps/place/'+item.address+'" target="_blank">';
                content += '<ul>';
                content += '<li id="'+item.perSong_no+'">'+item.perSong_no+'</li>';
                content += '<li id="'+item.song_name+'">'+"<a href = '/song/list/detail?song_no="+item.song_no+"'>"+item.song_name+"</a>"+'</li>';
                content += '<li id="'+item.allSong_profit+'">'+item.allSong_profit+'</li>';
                content += '</ul>';
            });
            $('#list_2').empty();
            $('#list_2').append(content);


        },error:function(e){
            console.log(e);
            alert("실패");
        }
    });

}   
   

   function paging2(list){
	   console.log("list : ", list);
		$('#getpagination2').twbsPagination({
			startPage:list.currPage,//보여줄 페이지
			totalPages:list.pages,//총페이지수(총갯수/페이지당 보여줄 게시물수) : 서버에서 계산해서 가져와야 한다.
			visiblePages:5,//[1][2][3][4][5]
			onPageClick:function(e,page){//번호 클릭시 실행할 내용
			
					
					if(showPage!=page){
						

						console.log("con1 : "+page);
						showPage = page;//클릭해서 다른 페이지를 보여주게 되면 현재 보고있는 페이지 번호도 변경해준다.
						
						call2(page);
						
			}

			}
			
		});
   }

</script>
