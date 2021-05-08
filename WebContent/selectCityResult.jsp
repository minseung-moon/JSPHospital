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
					<th>지역코드</th>
					<th>지역명</th>
					<th>검사건수</th>
				</tr>
			</thead>
			<tbody>
				<%
					ResultDAO dao = new ResultDAO();
					ArrayList<ResultDTO> dtos = dao.selectCityResult();
					for(ResultDTO dto : dtos) {
				%>
				<tr>
					<td><%=dto.getCode() %></td>
					<td><%=dto.getCity() %></td>
					<td><%=dto.getResultCount() %></td>
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