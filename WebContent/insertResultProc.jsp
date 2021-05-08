<%@page import="DTO.ResultDTO"%>
<%@page import="DAO.ResultDAO"%>
<%
	request.setCharacterEncoding("UTF-8");
	ResultDAO dao = new ResultDAO();
	ResultDTO dto = new ResultDTO();
	
	dto.setNo(request.getParameter("no"));
	dto.setCode(request.getParameter("code"));
	dto.setSdate(request.getParameter("sdate"));
	dto.setStatus(request.getParameter("status"));
	dto.setLdate(request.getParameter("ldate"));
	dto.setResult(request.getParameter("result"));
	
	if(dao.insertResult(dto)) System.out.println("ok");
	else  System.out.println("no");
	
	response.sendRedirect("selectResult.jsp");
%>