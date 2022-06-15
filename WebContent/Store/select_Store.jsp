<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>거래처 목록</title>
</head>
<body>
<%@ include file="../Main/header.jsp" %>
<%@ include file="../Main/nav.jsp" %>
<section>
	<form name=form>
		<br>
		<h3 id="title">거래처 목록</h3>
		<br>
		<%
			Integer number=0;
			try{
				sql="select count(storeno) from store0614";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()){
					number=rs.getInt(1);
				}
				if(number==0){
		%>
		<script>
		alert("거래처 정보가 없습니다.\n거래처 등록 화면으로 이동합니다.");
		location.href="add_Store.jsp";
		</script>
		<%
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
		<label style="margin-left:10%;">총 <%=number %>개의 거래처가 있습니다.</label>
		<hr>
		<table border=1 id="tab2" style="width:80%;">
			<tr>
				<th>No</th>
				<th>거래처코드</th>
				<th>거래처 이름</th>
				<th>거래처 전화번호</th>
				<th>거래처 주소</th>
				<th style="width:15%;">구분</th>
			</tr>
			
		<%
			try{
				sql="select * from store0614";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				Integer no=0;
				while(rs.next()){
					no++;
					String storeno=rs.getString(1);
					String storename=rs.getString(2);
					String storetel=rs.getString(3);
					String storeaddress=rs.getString(4);
		%>
			<tr>
				<td><%=no %></td>
				<td><%=storeno %></td>
				<td><%=storename %></td>
				<td><%=storetel %></td>
				<td><%=storeaddress %></td>
				<td><a id="a2" href="update_Store.jsp?storeno=<%=storeno%>">수정</a>/<a id="a2" href="delete_Store.jsp?storeno=<%=storeno %>" onclick="if(!confirm('거래처 코드:<%=storeno%>\n정말 삭제하시겠습니까?'))return false;">삭제</a></td>
			</tr>
		<%
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
		</table>
		<table style="margin:0 auto;">
		<tr>
			<td>
				<input id="btn" type=button value="등록" onclick=add()>
			</td>
		</tr>
		</table>
	</form>
</section>
<%@ include file="../Main/footer.jsp" %>
</body>
<script>
function add(){
	location.href="add_Store.jsp";
}
</script>
</html>