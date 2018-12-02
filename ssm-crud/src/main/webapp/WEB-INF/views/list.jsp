<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工 列表</title>
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-2.1.1.min.js"></script>
<link href="${APP_PATH }/static/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-10">
				<button class="btn btn-primary">新增</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<th>#</th>
						<th>empName</th>
						<th>gender</th>
						<th>email</th>
						<th>deptName</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${pageInfo.list }" var="emp">
						<tr>
							<th>${emp.empId }</th>
							<th>${emp.empName }</th>
							<th>${emp.gender=="M"?"男":"女" }</th>
							<th>${emp.email }</th>
							<th>${emp.department.deptName }</th>
							<th>
								<button class="btn btn-primary btn-sm">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									编辑
								</button>
								<button class="btn btn-danger btn-sm">
									<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
									删除
								</button>
							</th>
					</c:forEach>

					</tr>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				当前第${pageInfo.pageNum}页，总共${pageInfo.pages}页，总共${pageInfo.total}条记录
			</div>
				<div class="col-md-6">
					<nav aria-label="Page navigation">
					<ul class="pagination">
						<li><a href="${APP_PATH }/emps?pn=1">首页</a></li>
						<c:if test="${pageInfo.hasPreviousPage }">
							<li><a href="${APP_PATH }/emps?pn=${pageInfo.pageNum-1}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:forEach items="${pageInfo.navigatepageNums }" var="page_num">
							<c:if test="${page_num == pageInfo.pageNum }">
								<li class="active"><a href="#">${page_num }</a></li>
							</c:if>
							<c:if test="${page_num != pageInfo.pageNum }">
								<li><a href="${APP_PATH}/emps?pn=${page_num}">${page_num }</a></li>
							</c:if>
						</c:forEach>
						<c:if test="${pageInfo.hasNextPage }">
							<li><a href="${APP_PATH }/emps?pn=${pageInfo.pageNum+1}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
						</c:if>
						<li><a href="${APP_PATH }/emps?pn=${pageInfo.pages}">末页</a></li>
					</ul>
			</div>
		</div>
	</div>
</body>
</html>