<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title>board</title>
	
	<script type="text/javascript" src="/smarteditor2/js/HuskyEZCreator.js"charset="utf-8"></script>
	
	<link href="<c:url value='/css/insertPost.css'/>" rel="stylesheet" type="text/css">
	<script src="<c:url value='/js/postList.js'/>"></script>

		
	<script>
		$(document).on('click', '.postComplete1', function(e) {
			e.preventDefault();
			$("#form").submit();
		});
	
		$(document).on('click','#btnList',function(e) {
			e.preventDefault();
			location.href = "${pageContext.request.contextPath}/board/getBoardList";
		});

	</script>
</head>
<body>
	<!-- TOP  -->
	<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

	<br>
	<br>
	<br>
	<br>
	<div id="wrap">
		<div id="postWrap">
			<aside id="postAside">
			<div id="postImg">
				<i class="fa fa-camera fa-border fa-5x"></i><br><br>
			</div>
			<div id="loginMenu">
				<!-- 메뉴 : 로그인 하지 않은 경우  -->
				<c:if test="${empty sessionScope.sid }">
                    <p>게시글 작성을 위해서는</p>
                    <p>로그인이 필요합니다.</p> <hr>
                    <a href="<c:url value='/login'/>">로그인</a>
				</c:if>
		
				<!-- 메뉴 : 로그인 한 경우  -->	
				<c:if test="${not empty sessionScope.sid}"> 
					<a href="<c:url value='/myFeed'/>">${sessionScope.sid}</a>
				</c:if>
				<br><br>
			</div>
						
			</aside>
				<article>
					<div class="container" role="main">
					<div id="inner1"><h2 id="postMain">게시글 작성</h2><br></div>
					<div class="container2">		
						<form id="insertPostForm" method="post" action="/board/insertBoard"
							enctype="multipart/form-data" onsubmit="submitContents()">
							
							<div class="postWrite">
								<div class="mb-3">
									<input type="text"
										class="form-control1" name="comTitle" id="postTitle"
										placeholder="제목을 입력해 주세요">
									<br>
									<label for="reg_id">작성자:</label> <input type="text"
										class="form-control2" name="memNo" id="memNo"
										value="${sessionScope.No}" readonly>
									
								</div>
			
		
							</div>
								<!-- CONTENT -->
								<div class="mb-3 content">
									<textarea name="comContent" id="postContent" rows="10" cols="90"></textarea>
								</div><br><hr id="hrhr">
					
								<label for="comTag"><br>카테고리</label>
								<select class="form-control3" name="comTag" id="comTag">
									<option value="공지사항">공지사항</option>
									<option value="구매요청">구매요청</option>
									<option value="질문">질문</option>
									<option value="리뷰" selected>리뷰</option>
								</select>
								
							<hr id="hrhr">
							<div><br>
								<input type="submit" class="postComplete1" value="등록"> 
								<input type="button" class="postComplete2" value="취소" onclick="location.href='<c:url value="/board/list"/>'">
							</div>
						</form>
						</div>
					</div>
				</article>
			</div>
		</div>
	<script type="text/javascript">
		var oEditors = [];

		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "postContent",
			sSkinURI : "/smarteditor2/SmartEditor2Skin.html",/* "/package/dist/SmartEditor2Skin.html", */
			fCreator : "createSEditor2"

		});

		function submitContents(elClickedObj) {
			// 에디터의 내용이 textarea에 적용된다.
			oEditors.getById["postContent"].exec("UPDATE_CONTENTS_FIELD", []);
			// 에디터의 내용에 대한 값 검증은 이곳에서
			console.log(document.getElementById("postContent").value);
			try {
				elClickedObj.form.submit();
			} catch (e) {
			}
		}
	</script>
	<br>

</body>

</html>



