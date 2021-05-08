<%@page import="DTO.PatientDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.PatientDAO"%>
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
		<h2>환자 조회</h2>
		
		<table>
			<thead>
				<tr>
					<th>환자번호</th>
					<th>환자성명</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>전화번호</th>
					<th>지역</th>
				</tr>
			</thead>
			<tbody>
				<%
					PatientDAO dao = new PatientDAO();
					ArrayList<PatientDTO> dtos = dao.selectAllPatient();
					for(PatientDTO dto : dtos) {
				%>
				<tr>
					<td><%=dto.getNo() %></td>
					<td><%=dto.getName() %></td>
					<td><%=dto.getBirth() %></td>
					<td><%=dto.getGender() %></td>
					<td><%=dto.getTel1()+"-"+dto.getTel2()+"-"+dto.getTel3() %></td>
					<td><%=dto.getCity() %></td>
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