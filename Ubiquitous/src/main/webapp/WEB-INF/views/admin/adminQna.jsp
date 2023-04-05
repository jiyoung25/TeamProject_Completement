<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- vue.js --%>
<script src="https://cdn.jsdelivr.net/npm/vue@2.7.14/dist/vue.min.js"></script>
<%-- ��Ʈ��Ʈ�� --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/star.css" />
<%--����� ��ũ --%>
<link rel="icon" href="${pageContext.request.contextPath}/image/ubiquitous_favicon.png">
<title>������ Q&A ���� :Ubiquitous</title>
</head>
<body>
	<jsp:include page="/WEB-INF/include/navbar_sessionO_admin.jsp"/>
	<jsp:include page="/WEB-INF/include/sidebar_admin.jsp"/>
	<br>
	<%-- Q&A ����Ʈ --%>
	<div class="container">
		<h1>������ Q&A ����</h1>
		<br>
		<table class="table align-middle mb-0 bg-white">
			<thead class="bg-light">
				<tr>
					<th>���̸�</th>
					<th>����</th>
					<th>��ȸ��</th>
					<th>��¥</th>
					<th>����</th>
		    	</tr>
		  	</thead>
			<tbody>
				<c:forEach var="tmp" items="${adminQna }">
					<tr>
						<td>${tmp.space_name }</td>
						<td>
							<a href="${pageContext.request.contextPath}/qna/qnadetail?num=${tmp.num }">${tmp.title }</a>
						</td>
						<td>${tmp.viewCount }</td>
						<td>${tmp.regdate }</td>
						<td>
							<a href="qnaDelete?num=${tmp.num}" onClick="deleteLink(); return false;">����</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<%-- Q&A ���������̼� --%>
		<nav>
			<ul class="pagination">
				<%--
		        	qnaStartPageNum �� 1 �� �ƴ� ��쿡�� Prev ��ũ�� �����Ѵ�. 
		        --%>
		        <c:if test="${qnaStartPageNum ne 1 }">
					<li class="page-item">
						<a class="page-link" href="adminQna?qnaPageNum=${qnaStartPageNum-1 }">Prev</a>
					</li>
		        </c:if>
		        <c:forEach var="i" begin="${qnaStartPageNum }" end="${qnaEndPageNum }">
					<li class="page-item ${qnaPageNum eq i ? 'active' : '' }">
						<a class="page-link" href="adminQna?qnaPageNum=${i }">${i }</a>
					</li>
		        </c:forEach>
		        <%--
		        	������ ������ ��ȣ�� ��ü �������� �������� ������ Next ��ũ�� �����Ѵ�. 
		        --%>
		        <c:if test="${qnaEndPageNum lt qnatotalPageCount }">
					<li class="page-item">
						<a class="page-link" href="adminQna?qnaPageNum=${qnaEndPageNum+1 }">Next</a>
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