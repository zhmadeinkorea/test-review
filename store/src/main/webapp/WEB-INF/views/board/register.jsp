<%@include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div id="main_article">
				<form role="form" action="/board/register" method="post">
				<div class="form-group">
				<label>카테고리</label>
					<input type="radio" name="category" value="식당"> 식당
					<input type="radio" name="category" value="카페"> 카페
					<input type="radio" name="category" value="문화"> 문화
					<input type="radio" name="category" value="기타"> 기타		
				</div>
				<div class="form-gorup">
					<label>상가명</label> <input class="form-control" name='title'>
				</div>
				
				<div class="form-group">
					<label>리뷰내용</label>
					<textarea class="form-control" rows="3" name='content'></textarea>
				</div>
				
				<div class="form-group">
				<label>별점</label>
					<input type="radio" name="rating" value="★★★★★">★★★★★
					<input type="radio" name="rating" value="☆★★★★">☆★★★★
					<input type="radio" name="rating" value="☆☆★★★">☆☆★★★
					<input type="radio" name="rating" value="☆☆☆★★">☆☆☆★★
					<input type="radio" name="rating" value="☆☆☆☆★">☆☆☆☆★					
				</div>
				
				<div class="form-group">
					<label>Password</label>
					<input type="text" name="password">
				</div>
					<button type="submit" class="btn btn-default">Submit Button</button>
					<button type="reset" class="btn btn-default">Reset Button</button>
			</form>		
</div>

<%@include file="../includes/footer.jsp"%>


