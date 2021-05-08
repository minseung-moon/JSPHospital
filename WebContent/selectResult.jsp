<%@page import="DTO.ResultDTO"%>
<%@page import="DAO.ResultDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	#main h2 {
		padding : 15px 0;
	}
</style>
</head>
<body>
	
	<jsp:include page="./header.jsp"/>
	
	<div id="main">
		<h2>검사결과조회</h2>
		
		<table>
			<thead>
				<tr>
					<th>환자번호</th>
					<th>환자명</th>
					<th>검사명</th>
					<th>검사시작일</th>
					<th>검사상태</th>
					<th>검사완료일</th>
					<th>검사결과</th>
				</tr>
			</thead>
			<tbody>
				<%
					ResultDAO dao = new ResultDAO();
					ArrayList<ResultDTO> dtos = dao.selectAllResult();
					for(ResultDTO dto : dtos) {
				%>
				<tr>
					<td><%=dto.getNo() %></td>
					<td><%=dto.getP_name() %></td>
					<td><%=dto.getL_name() %></td>
					<td><%=dto.getSdate() %></td>
					<td><%=dto.getStatus() %></td>
					<td><%=dto.getLdate() %></td>
					<td><%=dto.getResult() %></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	
	<jsp:include page="./footer.jsp"/>
</body>
</html>