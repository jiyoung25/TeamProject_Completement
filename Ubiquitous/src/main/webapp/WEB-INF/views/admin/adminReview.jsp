<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- ��Ʈ��Ʈ�� --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
<%-- vue.js --%>
<script src="https://cdn.jsdelivr.net/npm/vue@2.7.14/dist/vue.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/star.css" />
<%--����� ��ũ --%>
<link rel="icon" href="${pageContext.request.contextPath}/image/ubiquitous_favicon.png">
<title>������ Review ����</title>
</head>
<body>
	<jsp:include page="/WEB-INF/include/navbar_sessionO_admin.jsp"/>
	<jsp:include page="/WEB-INF/include/sidebar_admin.jsp"/>
	<br>
	<%-- Review ����Ʈ --%>
	<div class="container">
		<h1>������ Review ����</h1>
		<br>
		<table class="table align-middle mb-0 bg-white">
			<thead class="bg-light">
				<tr>
					<th>���̸�</th>
					<th>�ۼ���</th>
					<th>����</th>
					<th>����</th>
					<th>��ȸ��</th>
					<th>��¥</th>
					<th>����</th>
		    	</tr>
		  	</thead>
			<tbody>
				<c:forEach var="tmp" items="${adminReview }">
					<tr>
						<td>${tmp.space_name }</td>
						<td>${tmp.review_writer }</td>
						<td>
							<a href="${pageContext.request.contextPath}/review/reviewdetail?review_num=${tmp.review_num }">${tmp.review_title }</a>
						</td>
						<td>
							<%-- ���� --%>
							<span class="star">
								�ڡڡڡڡ�
								<span style="width: ${tmp.star *10 }%;">�ڡڡڡڡ�</span>
							</span>
						</td>
						<td>${tmp.viewcount }</td>
						<td>${tmp.review_regdate }</td>
						<td>
							<a href="reviewDelete?review_num=${tmp.review_num}" onClick="deleteLink(); return false;">����</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<%-- ���� ���������̼� --%>
		<nav>
			<ul class="pagination">
				<%--
					startPageNum �� 1 �� �ƴ� ��쿡�� Prev ��ũ�� �����Ѵ�. 
				--%>
				<c:if test="${startPageNum ne 1 }">
					<li class="page-item">
						<a class="page-link" href="adminReview?pageNum=${startPageNum-1 }">Prev</a>
					</li>
				</c:if>
		        <c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<li class="page-item ${pageNum eq i ? 'active' : '' }">
						<a class="page-link" href="adminReview?pageNum=${i }">${i }</a>
					</li>
		        </c:forEach>
		        <%--
		           	������ ������ ��ȣ�� ��ü �������� �������� ������ Next ��ũ�� �����Ѵ�. 
				--%>
				<c:if test="${endPageNum lt totalPageCount }">
					<li class="page-item">
						<a class="page-link" href="adminReview?pageNum=${endPageNum+1 }">Next</a>
					</li>
				</c:if>
			</ul>
		</nav>
		
		<a href="${pageContext.request.contextPath}" class="btn btn-outline-dark">�������� ����</a>
	</div>
	
	<!-- footer include -->
	<jsp:include page="/WEB-INF/include/footer.jsp" />
	
	<script>
   		const deleteLink = function(){
			confirm("�ش� ���� �����Ͻðڽ��ϱ�?")?this.submit():"";
		}
	</script>
</body>
</html>