<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

<link href="/resources/css/custom.css" rel="stylesheet">
    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    </head>
<body>
	<div id="head">군산대 상가 리뷰
		<div id="menu_2">
			<a href="/board/list" style="font-family: 'Jua'; color: white; text-decoration:none;">리뷰 / </a> <a
				href="/board/comment" style="font-family: 'Jua'; color: white; text-decoration:none;">자유 / </a> <a
				href="/board/map" style="font-family: 'Jua'; color: white; text-decoration:none;">지도</a>
		</div>
	</div>
	<div id="article">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<div id="main_article">

	<div class='row'>
		<div class="col-lg-12">
			<div class="panel-panel-default">
				<divclass-"panel-heading"> <i
					class="fa fa-comments fa-fw"></i> Reply
				<form id="replyForm" action="commentRegister">
					<textarea name="reply" style="resize: none; width: 100%;"></textarea>
					<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New
						Reply</button>
				</form>
			</div>
			<!-- /.panel heading -->

		</div>
	</div>
	<table width="100%" style="word-break: break-all" height="auto"
		class="table table-striped table-bordered table-hover">
		<c:forEach items="${replyList}" var="reply">
			<tr>
				<td width="70" style="text-align:center;"><a class="re" value="<c:out value="${reply.rno}"/>"><c:out value="${reply.rno }" /></div></td>
				<td><c:out value="${reply.reply}" /></td>
				<td width=160><fmt:formatDate pattern="yyy-MM-dd"
						value="${reply.replyDate }" /></td>
			</tr>
		</c:forEach>
	</table>
	<!-- end table -->
</div>

<script type="text/javascript" src="/resources/js/reply.js">
	
</script>
<script type="text/javascript">
	$(document).ready(function() {
		var replyForm = $("#replyForm");

	$(".re").on("click", function(e){
		replyForm.reply.value = $(this).attr('value') + "//";
		console.log($(this).val);
	});
});
	
</script>

<%@include file="../includes/footer.jsp"%>

