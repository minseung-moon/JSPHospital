<%@page import="DTO.LabDTO"%>
<%@page import="DAO.LabDAO"%>
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
	padding: 15px 0;
}
</style>
</head>
<body>

	<jsp:include page="./header.jsp" />

	<div id="main">
		<h2>검사결과 조회</h2>
		<form action="insertResultProc.jsp" method="post">
			<table>
				<tr>
					<th><label for="no">환자번호</label></th>
					<td><input type="text" name="no" id="no" maxlength="4">예)1001</td>
				</tr>
				<tr>
					<th><label for="code">검사코드</label></th>
					<td><select name="code" id="code">
							<option value="">검사명</option>
							<%
								LabDAO dao = new LabDAO();
								ArrayList<LabDTO> dtos = dao.selectAllLab();
								for (LabDTO dto : dtos) {
							%>
							<option value="<%=dto.getCode()%>"><%=dto.getName()%></option>
							<%
								}
							%>
					</select></td>
				</tr>
				<tr>
					<th><label for="sdate">검사시작일자</label></th>
					<td><input type="text" name="sdate" id="sdate" maxlength="8">예)20200101</td>
				</tr>
				<tr>
					<th><label for="status">검사상태</label></th>
					<td><input type="radio" name="status" value="1" id="status">검사중
						<input type="radio" name="status" value="2">검사완료</td>
				</tr>
				<tr>
					<th><label for="ldate">검사완료일자</label></th>
					<td><input type="text" name="ldate" id="ldate" maxlength="8">예)20200101</td>
				</tr>
				<tr>
					<th><label for="result">검사결과</label></th>
					<td><input type="radio" name="result" value="X" id="result">미입력
						<input type="radio" name="result" value="P">양성 <input
						type="radio" name="result" value="N">음성</td>
				</tr>
				<tr>
					<th></th>
					<td>
						<button type="submit" onclick="return validate()">검사결과 등록</button>
						<button type="reset">다시쓰기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script>
		function validate() {
			let check = false;
			const no = document.getElementById("no");
			const code = document.getElementById("code");
			const sdate = document.getElementById("sdate");
			const status = document.getElementsByName("status");
			const ldate = document.getElementById("ldate");
			const result = document.getElementsByName("result");
			if(no.value.trim() === "" || isNaN(no.value) || no.value.length !== 4){
				alert("환자번호를 입력해주세요!");
				no.focus();
			}else if(code.value.trim() === ""){
				alert("검사코드를 선택해주세요!");
				code.focus();
			}else if(sdate.value.trim() === "" || isNaN(sdate.value) || sdate.value.length !== 8){
				alert("검사시작일자를 입력해주세요!");
				sdate.focus();
			}else if(!status[0].checked && !status[1].checked) {
				alert("검사상태를 선택해주세요!");
			}else if(ldate.value.trim() === "" || isNaN(ldate.value) || ldate.value.length !== 8){
				alert("검사완료일자를 입력해주세요!");
				ldate.focus();
			}else if(!result[0].checked && !result[1].checked && !result[2].checked) {
				alert("검사결과를 선택해주세요!");
			}else {
				check = true;
			}
			
			return check;
		}
	</script>
	<jsp:include page="./footer.jsp" />
</body>
</html>