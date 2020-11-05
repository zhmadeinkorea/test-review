<%@include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div id="main_article">
			<div class="panel-body">
				<form role="form" action="/board/modify" method="post">
				<div class="form-group">
					<input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
					<input type="hidden" name='amount' value='<c:out value="${cri.amount }"/>'>
					<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
					<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
				<label>카테고리</label>
					<input type="radio" name="category" value="식당"> 식당
					<input type="radio" name="category" value="카페"> 카페
					<input type="radio" name="category" value="문화"> 문화
					<input type="radio" name="category" value="기타"> 기타		
				</div>
				
				<div class="form-group">
				<label>상가 이름</label>
				<input class="form-control" name='title' value='<c:out value="${store.title }"/>'>
				</div>	
							
				<div class="form-group">
				<label>리뷰내용</label> <textarea class="form-control" rows="3" name='content'><c:out value="${store.content }"/>
				</textarea>
				</div>
				
				<div class="form-group">
				<label>별점</label>
					<input type="radio" name="rating" value="★★★★★">★★★★★
					<input type="radio" name="rating" value="☆★★★★">☆★★★★
					<input type="radio" name="rating" value="☆☆★★★">☆☆★★★
					<input type="radio" name="rating" value="☆☆☆★★">☆☆☆★★
					<input type="radio" name="rating" value="☆☆☆☆★">☆☆☆☆★					
				</div>
					<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
					<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
					<button type="submit" data-oper='list' class="btn btn-info">List</button>
				</form>
				</div>
				<!--  end pannel body -->
</div>
<script type="text/javascript">
$(document).ready(function(){
	var formObj=$("form");
	$('button').on("click", function(e){
		e.preventDefault();
		var operation=$(this).data("oper");
		console.log(operation);
		if(operation === 'remove'){
			formObj.attr("action", "/board/remove");
		}else if(operation ==='list'){
			//move to list
			formObj.attr("action", "/board/list").attr("method", "get");
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			var typeTag = $("input[name='type']").clone();
			var categoryTag = $("input[name='category']").clone();
			//필요한 파라미터만 추가
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(keywordTag);
			formObj.append(typeTag);
			formObj.append(categoryTag);		
			
		}
		formObj.submit();
	});
});

</script>

<%@include file="../includes/footer.jsp"%>


