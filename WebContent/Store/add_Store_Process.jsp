<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp" %>
<%
	String storeno=request.getParameter("storeno");
	String storename=request.getParameter("storename");
	String phone1=request.getParameter("phone1");
	String phone2=request.getParameter("phone2");
	String phone3=request.getParameter("phone3");
	String storetel=phone1+"-"+phone2+"-"+phone3;
	String storeaddress=request.getParameter("storeaddress");
	try{
		sql="insert into store0614 values(?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, storeno);
		pstmt.setString(2, storename);
		pstmt.setString(3, storetel);
		pstmt.setString(4, storeaddress);
		pstmt.executeUpdate();
%>
<script>
alert("거래처코드:<%=storeno%>\n거래처 이름:<%=storename%>\n정보 등록 완료");
location.href="add_Store.jsp";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>