<%@include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div id="main_article">
			<div class="panel-body">
				<div class="form-group">
				<label>카테고리</label> <input class="form-control" name='category' value='<c:out value="${store.category }"/>' readonly="readonly">
				</div>
				<div class="form-group">
				<label>상가 이름</label> <input class="form-control" name='title' value='<c:out value="${store.title }"/>' readonly="readonly">
				</div>
				<div class="form-group">
				<label>리뷰 내용</label> <textarea class="form-control" rows="3" name='content' readonly="readonly"><c:out value="${store.content }"/>
				</textarea>
				</div>
				<div class="form-group">
				<label>별점</label> <input class="form-control" name='rating' value='<c:out value="${store.rating }"/>' readonly="readonly">
				</div>
				<button data-oper='modify' class="btn btn-default" onclick="location.href='/board/modify?sno=<c:out value="${store.sno}"/>'">Modify</button>
				<button data-oper='list' class="btn btn-default" onclick="location.href='/board/list'">List</button>
				</div>
				
				<form id='operForm' action="/board/modify" method="get">
					<input type='hidden' id='sno' name='sno' value='<c:out value="${store.sno }"/>'>
					<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum} "/>'>
					<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
					<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
					<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
					<input type='hidden' name='category' value='<c:out value="${store.category }"/>'>
				</form>
				<!--  end panel body -->
</div>
		
<script type="text/javascript">
		
		$(document).ready(function(){
		var operForm = $("#operForm");
		$("button[data-oper='modify']").on("click", function(e){
			operForm.attr("action","/board/modify").submit();
		});
		
		$("button[data-oper='list']").on("click", function(e){
			operForm.find("#sno").remove();
			operForm.attr("action","/board/list")
			var categoryTag = $("input[name='category']").clone();
			operForm.submit();
		});
	});
</script>
<%@include file="../includes/footer.jsp"%>


