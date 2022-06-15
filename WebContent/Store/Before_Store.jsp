<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp" %>
<%
	String chk=request.getParameter("chk");
	try{
		sql="select table_name from user_tables where table_name='STORE0614'";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()){
			switch(chk){
			case "41":
%>
<script>
location.href="add_Store.jsp";
</script>
<%
				break;
			case "42":
%>
<script>
location.href="select_Store.jsp";
</script>
<%
				break;
			}
		}else{
			sql="create table store0614(storeno number(3) primary key, storename varchar2(50) not null, storetel varchar2(13),storeaddress varchar2(80))";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="insert into store0614 values(100,'서면점','051-333-1234','부산시 부산진구 부전동')";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="insert into store0614 values(101,'금정점','051-555-4321','부산시 금정구 장전동')";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="insert into store0614 values(102,'기장점','051-758-1234','부산시 기장군')";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
%>
<script>
alert("store0614 테이블 생성 완료");
</script>
<%
			switch(chk){
			case "41":
%>
<script>
location.href="add_Store.jsp";
</script>
<%
				break;
			case "42":
%>
<script>
location.href="select_Store.jsp";
</script>
<%
				break;
			}
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>