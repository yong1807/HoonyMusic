<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"> </script>
<style>

		#common_list_form{padding-left:15%;}
        #common_list_form .big_title{padding: 50px 50px;}
        #common_list_form .sub_title{padding: 20px 50px;}
        #common_list_form .list_form{position:relative;}
        #common_list_form .list_form .list_title ul{width: 100%; height: 32px;}
        #common_list_form .list_form .list_title ul li{ float: left; border-top: 1px solid #999; border-bottom: 1px solid #222; padding:5px 0 5px 10px; box-sizing: border-box;}
        #common_list_form .list_form .list_title ul li:first-child{width: 10%; padding-left: 50px; }
        #common_list_form .list_form .list_title ul li:nth-child(2){width: 50%;}
        #common_list_form .list_form .list_title ul li:nth-child(3){width: 15%;}
        #common_list_form .list_form .list_title ul li:nth-child(4){width: 15%;}
        #common_list_form .list_form .list_title ul li:last-child{width: 10%;}
        #common_list_form .list_form .list_content ul{width:100%; height: 30px;}
        #common_list_form .list_form .list_content ul li{float:left; padding:5px 0 5px 10px; box-sizing: border-box;}
        #common_list_form .list_form .list_content ul li:first-child{width: 10%; padding-left: 50px; }
        #common_list_form .list_form .list_content ul li:nth-child(2){width: 50%;}
        #common_list_form .list_form .list_content ul li:nth-child(3){width: 15%;}
        #common_list_form .list_form .list_content ul li:nth-child(4){width: 15%;}
        #common_list_form .list_form .list_content ul li:last-child{width: 10%;}
        #common_list_form .list_form .list_content ul li a:hover{text-decoration: underline;}
        #common_list_form .list_form .list_content ul:hover{background-color: #eee;}


</style>
</head>
<body>
<%@ include file="/views/nav.jsp" %>
	<section id="common_list_form">
    <h2 class="big_title">공지사항</h2>
    <!-- <h3 class="sub_title">리스트 폼</h3> -->
    
    <div class="list_form">
        <form action="modifyD" method="post" enctype="multipart/form-data" onsubmit="return val()">
    		<input type="hidden" name="board_no" value="${board.board_no}" />
	    <ul>
	        <li>
	            <label for="board_title">제목</label>
	            <input type="text" id="board_title" name="board_title" value="${board.board_title}" />
	        </li>
	        <li>
	            <label for="board_content">내용</label>
	            <textarea id="board_content" name="board_content">${board.board_content}</textarea>
	            <!-- 
	            <div id="rich_deditor"></div>
				
				<input type="hidden" name="board_content" value="${board.board_content}"/>
				 -->
	        </li>
	        <li>
	            <label for="photos">사진</label>
	            <input type="file" id="photos" name="photos" />
	        </li>
	        <li>
	            <input type="button" onclick="location.href='/boardD'" value="이전" />
	            <button type="submit" onclick="location.href='/boardD'">수정</button>
	        </li>
	    </ul>
		</form>
	</div>
	</section>

</body>
<script>
var config = {}
config.toolbar = "basic"; // 이 부분이 주석 되면 모든 기능이 다 나타난다.
config.editorResizeMode = "none"; // 에디터 크기 조절 안됨
var editor = new RichTextEditor("#board_content", config);

function goBack() {
    window.history.back();
  }
  
function val(){
var board_title = $('#board_title').val();
var board_content=$('#board_content').val();
if (board_title === "" || board_content === "") {
    alert("입력하지 않은 값이 있습니다.");
    return false;
	}
	return true;
}
</script>
</html>