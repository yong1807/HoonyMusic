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
        #common_list_form .list_form .list_title ul li:first-child{width: 25%; padding-left: 50px; }
        #common_list_form .list_form .list_title ul li:nth-child(2){width: 25%;}
        #common_list_form .list_form .list_title ul li:nth-child(3){width: 25%;}
        #common_list_form .list_form .list_title ul li:last-child{width: 25%;}
        #common_list_form .list_form .list_content ul{width:100%; height: 30px;}
        #common_list_form .list_form .list_content ul li{float:left; padding:5px 0 5px 10px; box-sizing: border-box;text-align:center;}
        #common_list_form .list_form .list_content ul li:first-child{width: 25%; padding-left: 50px; }
        #common_list_form .list_form .list_content ul li:nth-child(2){width: 25%;}
        #common_list_form .list_form .list_content ul li:nth-child(3){width: 25%;}
        #common_list_form .list_form .list_content ul li:last-child{width: 25%;}
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
			width: 150%;
		    height: 6%;
		    display: flex;
		    position: relative;
		    left: 65%;
        }
    </style>
<body>
<%@ include file="/views/nav.jsp" %>
    <!-- -------------------------------------------nav start------------------------------------------ -->
    
    <!-- -------------------------------------------nav end------------------------------------------ -->
    <!-- -------------------------------------------util start------------------------------------------ -->
   
    <!-- -------------------------------------------util end------------------------------------------ -->
    <!-- -------------------------------------------list_form start------------------------------------------ -->
    <section id="common_list_form">
        <h2 class="big_title">아티스트 관리</h2>
        <ul id="list">

        </ul>
		<table style="margin-left: auto;margin-right: auto;">
			<tr>
				<td> 
				아티스트 이름 : <input type="text" id="name"/> 
				</td>
				
				<td>
				  소속사 이름 : <input type="text" id="agency" class="date"/>
				</td>
				
				<td>
				<button id="get">등록</button>
				</td>
			</tr>
		</table>
        
 		<ul class="search_box">
            <li>
                <select id="searchpath" name="searchtag">
					<option  value="an" >아티스트명</option>
					<option value="aa">소속사명</option>
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
        <h3 class="sub_title">아티스트목록</h3>
        <div class="list_form">
            <ul>
                <li class="list_title" id="list1">
                    <ul>
                        <li>no.</li>
                        <li>아티스트이름</li>
                        <li>소속사</li>
                        <li>수정</li>
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
//--------------------------------등록-------------------------------------------------

$("#get").on("click", function(){
	
	var nalen = $("#name").val().length;
	var aglen = $("#agency").val().length;
	
	if(nalen<2){
		alert("아티스트 이름을 입력해주세요.");
	}else if(aglen<2){
		alert("소속사를 입력해주세요");
	}else{
		console.log($("#name").val());
		console.log($("#agency").val());
		var name = $("#name").val();
		var agency = $("#agency").val();
		
		location.href="artistget?name="+name+"&agency="+agency;
		

		
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
        url : '/artistlist',
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

            data.list.forEach(function(item,idx){
                //content += '<a href="https://www.google.com/maps/place/'+item.address+'" target="_blank">';
                content += '<ul>';
                content += '<li id="'+item.art_no+'">'+item.art_no+'</li>';
                content += '<li id="'+item.art_name+'">'+"<a href = 'artistdetail?num="+item.art_no+"&name="+item.art_name+"&agency="+item.art_agency+"'>"+item.art_name+"</a>"+'</li>';
                content += '<li id="'+item.art_agency+'">'+item.art_agency+'</li>';
                content += '<li >'+"<a onclick='test("+item.art_no+","+item.art_name+","+item.art_agency+")'>수정</a>"+'</li>';
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
   //-------------------------------수정------------------------------------------

   


</script>
