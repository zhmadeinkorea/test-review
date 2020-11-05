<%@include file="../includes/header2.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div id="main_article">
	<div id="order" style="text-align:right; color:black;">
		<a style="color:black;" href="/board/list">정렬취소 </a>
	</div>
	
	<table width="100%" style="word-break:break-all" height="auto"
		class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th>분류</th>
				<th>이름</th>
				<th>리뷰</th>
				<th>별점</th>
				<th>등록일</th>
			</tr>
		</thead>
		<c:forEach items="${rating}" var="store">
			<tr>
				<td width=80><c:out value="${store.category}" /></td>
				
				<td width=125><a class='move' style="color:black;" href='<c:out value="${store.sno }"/>'>
				<c:out value="${store.title}" /></a></td>
				
				<td width=772><a class='move' style="color:black;" href='<c:out value="${store.sno }"/>'>
				<c:out value="${store.content}" /></a></td>
				
				<td width=160><c:out value="${store.rating}" /></td>
				<td width=160><fmt:formatDate pattern="yyy-MM-dd" value="${store.regdate }"/></td>
				</tr>
		</c:forEach>
	</table>
	<!-- end table -->
	
	<!-- searchForm -->
	<div class='row'>
		<div class="col-log-12">
			<form id='searchForm' action="/board/list4" method='get'>
				<select name='type'>
					<option value=""
						<c:out value="${pageMaker.cri.type==null?'selected':'' }"/>>--</option>
					<option value="T"
					<c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>상가명</option>
					<option value="C"
					<c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>리뷰</option>					
				</select>
				<input type='text' name='keyword'
				value = '<c:out value="${pageMaker.cri.keyword}"/>'/>
				<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum }"/>'/>				
				<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount }"/>'/>	
				<input type='hidden' name='category' value='<%= request.getParameter("category") %>'>
				<button class='btn btn-default'>search</button>
			</form>
		</div>
	</div>
	<!-- end SearchForm -->
	
	<!-- paging -->
	<div class='pull-right'>
	<ul class="pagination">
		<c:if test="${pageMaker.prev}">
		<li class="paginate_button previous"><a href="${pageMaker.startPage-1 }">Previous</a>
		</li>
		</c:if>
		
		<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
			<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
			<a href="${num}">${num}</a>
		</c:forEach>
		
		<c:if test="${pageMaker.next }">
		<li class="paginate_button next"><a href="${pageMaker.endPage+1 }">Next</a></li>
		</c:if>
	</ul>
	</div>

	<form id='actionForm' action="/board/list4" method='get'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
		<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type }"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword }"/>'>
		<input type='hidden' name='category' value='<%= request.getParameter("category") %>'>
	</form>
		<!-- end paging -->
	
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
										aria-labelledby="myModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">&times;</button>
													<h4 class="modal-title" id="myModalLabel">Modal title</h4>
												</div>
												<div class="modal-body">처리가 완료되었습니다.</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default"
														data-dismiss="modal">Close</button>
													<button type="button" class="btn btn-primary">Save
														changes</button>
												</div>
											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal-dialog -->
									</div>
									<!-- /.modal -->
</div>

<%@include file="../includes/footer.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		var result = '<c:out value="${result}"/>';
		checkModal(result);
		history.replaceState({},null,null);
		function checkModal(result) {
			if(result===''){
				return;
			}
			if (parseInt(result) > 0) {
				$(".modal-body").html("리뷰가 등록되었습니다.");
			}
			$("#myModal").modal("show");
		}
		
		var actionForm = $("#actionForm");
		$(".paginate_button a").on("click", function(e){
			e.preventDefault();
			console.log('click');
			
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
			
		});
		
		$(".move").on("click", function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='sno' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/board/check");
			actionForm.submit();
		});
		
		var searchForm = $("#searchForm");
		
		$("#searchForm button").on("click", function(e){
			
			if(!searchForm.find("option:selected").val()){
				alert("검색 종류를 선택하세요");
				return false;
			}
			
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요");
				return false;
				
			}
			searchForm.find("input[name='pageNum']").val("1");
		
			e.preventDefault();
			searchForm.submit();
			
			
		});
		
	});
		
</script>

