<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp"%>
<%
	String storeno=request.getParameter("storeno");
	try{
		sql="delete from store0614 where storeno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, storeno);
		pstmt.executeUpdate();
%>
<script>
alert("거래처 코드: <%=storeno%>\n삭제 완료");
location.href="select_Store.jsp";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>