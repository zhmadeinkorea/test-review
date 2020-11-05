<%@include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div id="main_article"style="text-align:center;">
		<label>비밀번호를 입력해주세요</label>
		<form action="/board/get?sno=<c:out value="${store.sno }"/>" method="get">
			<input type="text" name="password" id="password">
			<input type="hidden" name="sno" value="<c:out value="${store.sno }"/>">
			<input type="hidden" id="result" value="<c:out value="${store.password}"/>">
			
			<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
			<button type="submit" data-oper='list' class="btn btn-default">List</button>
		</form>
		
				<form id='operForm' action="/board/get" method="get">
					<input type='hidden' id='sno' name='sno' value='<c:out value="${store.sno }"/>'>
					<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum} "/>'>
					<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
					<input type="hidden" name="category" value="<c:out value="${store.category }"/>">
					<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
					<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
				</form>
</div>

<script type="text/javascript">
$(document).ready(function(){
	var formObj=$("form");
	const result = $("#result").val();
	var operForm = $("#operForm"); //전송 폼
	var href = document.referrer; //이전 url
	console.log(href);
	
	$('button').on("click", function(e){
		e.preventDefault();
		var operation=$(this).data("oper");
		if(operation === 'modify'){
		const pw = $("#password").val();
			if(result == pw){
				console.log("성공");
				formObj.submit();
				
				
			}else if(result != pw){
				alert('비밀번호 오류');
				console.log("비밀번호 오류");
			}
		}
		
		
		else if(operation ==='list'){
			formObj.attr("action", "/board/list").attr("method", "get");
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var categoryTag = $("input[name='category']").clone();
			var keywordTag =  $("input[name='keyword']").clone();
			var TypeTag =  $("input[name='type']").clone();
			
			if(href.indexOf('list2') != -1){ //이전 url이 list2면 list2로 돌아가게
				formObj.attr("action", "/board/list2").attr("method", "get");
				operForm.append("<input type='hidden' name='order' value='2'>");
				
			}
			if(href.indexOf('list3') != -1){
				formObj.attr("action", "/board/list3").attr("method", "get");
			}
			if(href.indexOf('list4') != -1){
				formObj.attr("action", "/board/list4").attr("method", "get");
			}
			
			
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(categoryTag);
			formObj.append(keywordTag);
			formObj.append(TypeTag);
			formObj.submit();
			
			}

		

	});
});

</script>


<%@include file="../includes/footer.jsp"%>


