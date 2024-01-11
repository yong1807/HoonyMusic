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
	#common_list_form{padding-left:15%;}
        #common_list_form .big_title{padding: 50px 50px;}
        #common_list_form .sub_title{padding: 20px 50px;}
        #common_list_form .list_form{position:relative;}
        #common_list_form .list_form .list_title ul{width: 100%; height: 32px;}
        #common_list_form .list_form .list_title ul li{ float: left; border-top: 1px solid #999; border-bottom: 1px solid #222; padding:5px 0 5px 10px; box-sizing: border-box;text-align:center;}
        #common_list_form .list_form .list_title ul li:first-child{width: 15%; padding-left: 50px; }
        #common_list_form .list_form .list_title ul li:nth-child(2){width: 10%;}
        #common_list_form .list_form .list_title ul li:nth-child(3){width: 15%;}
        #common_list_form .list_form .list_title ul li:nth-child(4){width: 15%;}
        #common_list_form .list_form .list_title ul li:nth-child(5){width: 15%;}
        #common_list_form .list_form .list_title ul li:nth-child(6){width: 15%;}
        #common_list_form .list_form .list_title ul li:last-child{width: 15%;}
        #common_list_form .list_form .list_content ul{width:100%; height: 30px;}
        #common_list_form .list_form .list_content ul li{float:left; padding:5px 0 5px 10px; box-sizing: border-box;text-align:center;}
        #common_list_form .list_form .list_content ul li:first-child{width: 15%; padding-left: 50px; }
        #common_list_form .list_form .list_content ul li:nth-child(2){width: 10%;}
        #common_list_form .list_form .list_content ul li:nth-child(3){width: 15%;}
        #common_list_form .list_form .list_content ul li:nth-child(4){width: 15%;}
        #common_list_form .list_form .list_content ul li:nth-child(5){width: 15%;}
        #common_list_form .list_form .list_content ul li:nth-child(6){width: 15%;}
        #common_list_form .list_form .list_content ul li:last-child{width: 15%;}
        #common_list_form .list_form .list_content ul li a:hover{text-decoration: underline;}
        #common_list_form .list_form .list_content ul:hover{background-color: #eee;}
		        
        #common_list_form .search_box{position: relative; margin: 0 0 10px 50px; border: 1px solid #fff; display: inline-block;}
        #common_list_form .search_box li{float: left;}
        #common_list_form .search_box select{width: 70px; height: 28px; border: 1px solid #ccc; border-right: none;}
        #common_list_form .search_box #search_info{width:250px; height: 28px; border: 1px solid #ccc; box-sizing: border-box; padding-left:5px;}
        #common_list_form .search_box #search_info::placeholder{color: #ccc;}
        #common_list_form .search_box .btn_box{width: 28px; height: 28px; cursor: pointer; border: 1px solid #ccc; box-sizing: border-box; border-left: none;}
        #common_list_form .search_box .btn_box .search_btn{position:relative; width: 14px; height: 14px; left: 50%; top: 50%; transform: translate(-50%, -50%);}
        #common_list_form .search_box .btn_box .search_btn img{width: 100%;}
        #common_list_form .search_box:hover select{border: 1px solid #333; border-right: none;}
        #common_list_form .search_box:hover #search_info{border-top: 1px solid #333; border-bottom: 1px solid #333;}
        #common_list_form .search_box:hover .btn_box{border: 1px solid #333; border-left: none;}
        
        .searchbox{
			width: 90%;
		    height: 6%;
		    display: flex;
		    position: relative;
		    left: 65%;
        }
    </style>
<body>
<%@ include file="/views/nav.jsp" %>
    <!-- -------------------------------------------nav start------------------------------------------ -->
    
    <!-- -------------------------------------------util end------------------------------------------ -->
    <!-- -------------------------------------------list_form start------------------------------------------ -->
    <section id="common_list_form">
        <h2 class="big_title">저작권 실적관리</h2>
        <ul id="list">

        </ul>
		<table style="margin-left: auto;margin-right: auto;">
			<tr>
				<td> 
				저작권번호 : <input type="text" id="no"/>
				</td>
				
				<td>
				사용날짜 : <input type="date" id="date" class="date"/>
				</td>
				
				<td>
				사용료 : <input type="text" id="price"/>
				</td>
				
				<td>
				저작권이름 : <input type="text" id="namae"/>
				</td>	
				
				<td>
				<button id="get">등록</button>
				</td>
			</tr>
		</table>
        
 		<ul class="search_box">
            <li>
                <select id="searchpath" name="searchtag">
					<option  value="cr" >저작권번호</option>
                </select>
            </li>
            <li>
                <input type="text" class="search_info" placeholder="검색" id="searchbar"/>
            </li>
            <li class="btn_box">
                <div class="search_btn">
                    <img src="./img/search.png" alt="검색 버튼" id="search">
                </div>
            </li>
        </ul>
        <h3 class="sub_title">저작권 실적목록</h3>
        <div class="list_form">
            <ul>
                <li class="list_title" id="list1">
                    <ul>
                        <li>no.</li>
                        <li>저작권명</li>
                        <li>담당자</li>
                        <li>저작권사용료</li>
                        <li>취소하기</li>
                    </ul>
                </li>
				<li class="list_content" id="list_1">
				
				</li>

             </ul>
             

        </div>
		<div id="paging" class="pagingBox">
			<!-- 	플러그인 사용	(twbsPagination)	- 이렇게 사용하라고 tutorial 에서 제공함-->
			<div class="container">
				<nav aria-label="Page navigation" style="text-align: center">
					<ul class="pagination" id="getpagination"></ul>
				</nav>
			</div>
		</div>
		
		<div >
		
		<h2 id="all" ></h2>
		
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
//--------------------------------등록-------------------------------------------------

$("#get").on("click", function(){
	
	var nolen = $("#no").val().length;
	var datelen = $("#date").val().length;
	var pricelen = $("#price").val().length;
	var nalen = $("#namae").val().length;
	
	if(nolen<2){
		alert("저작권 번호를 입력해주세요.");
	}else if(datelen<2){
		alert("사용날짜를 입력해주세요")
	}else if(pricelen<2){
		alert("사용료를 입력해주세요")
	}else if(nalen<2){
		alert("저작권명을 입력해주세요")
	}
	else{
		
		var no = $("#no").val();
		var date = $("#date").val();
		var price = $("#price").val();
		var namae = $("#namae").val();
		
		location.href="resourceCopyrightregister?no="+no+"&date="+date+"&price="+price+"&namae="+namae;
		

		
	}
	
	
});

//-------------------------------search---------------------------------------------

var search = "";
var showPage=1;//페이징을 위한 변수
var searchtag ="";

$("#search").on("click", function(){
	
	search = $("#searchbar").val();
	
	var storyLength = $("#searchbar").val().length;
	if(storyLength < 2 ){
		alert("2자 이상 입력해주세요");
	    $("#searchbar").focus();
	}else{
	//searchbox = $('#search').val();
	console.log($('#searchpath option:selected').val());
	searchtag = $('#searchpath option:selected').val();
	call(showPage);
	}
	
	console.log(search);
	
});

//--------------------------------ajax list------------------------------------------



call(showPage);

function call(showPage){
   $.ajax({
        type : 'POST',
        url : '/resourcecopyrightgetlist',
        data:{
        	
        	'pagePerNum':5
        	,'page':showPage
        	,'search':search
        	,'searchtag':searchtag
        	
        },
        dataType:'json',
        success:function(data){
        	//alert("성공");
        	
        	paging(data);
        	
            console.log(data);
            var content ='';
            var all = 0;

            data.list.forEach(function(item,idx){
                //content += '<a href="https://www.google.com/maps/place/'+item.address+'" target="_blank">';
                content += '<ul>';
                content += '<li >'+item.cr_no+'</li>';
                content += '<li >'+item.cr_namae+'</li>';
                content += '<li >'+item.per_member+'</li>';
                content += '<li >'+item.per_price+'</li>';
                content += '<li>'+'<a href="resourceCopyrightdelete?cr_no='+item.cr_no+"&per_price="+item.per_price+'">취소</a>'+'</li>';
                content += '</ul>';
                all = all+item.per_price;
            });
            $('#list_1').empty();
            $('#list_1').append(content);
			document.getElementById('all').innerHTML="총 실적 : "+all+" 원";

        },error:function(e){
            console.log(e);
            alert("실패");
        }
    });

}   
   

   function paging(list){
	   console.log("list : ", list);
		$('#getpagination').twbsPagination({
			startPage:list.currPage,//보여줄 페이지
			totalPages:list.pages,//총페이지수(총갯수/페이지당 보여줄 게시물수) : 서버에서 계산해서 가져와야 한다.
			visiblePages:5,//[1][2][3][4][5]
			onPageClick:function(e,page){//번호 클릭시 실행할 내용
			
					
					if(showPage!=page){
						

						console.log("con1 : "+page);
						showPage = page;//클릭해서 다른 페이지를 보여주게 되면 현재 보고있는 페이지 번호도 변경해준다.
						call(page);
						
			}

			}
			
		});
   }
   //-------------------------------저작권 검색------------------------------------------


</script>
