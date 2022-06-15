<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>거래처 수정 화면</title>
</head>
<body>
<%@ include file="../Main/header.jsp" %>
<%@ include file="../Main/nav.jsp" %>
<section>
	<form name=form>
		<br>
		<h3 id="title">거래처 수정 화면</h3>
		<br>
		<hr>
		<table border=1 id="tab1" style="width:70%;">
		<%
			String storeno=request.getParameter("storeno");
			String storename=request.getParameter("storename");
			String[] storetel=new String[3];
			String phone1=request.getParameter("phone1");
			String phone2=request.getParameter("phone2");
			String phone3=request.getParameter("phone3");
			String storeaddress=request.getParameter("storeaddress");
			try{
				sql="select * from store0614 where storeno=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, storeno);
				rs=pstmt.executeQuery();
				if(rs.next()){
					if(storename==null||storename==""){
						storename=rs.getString(2);
					}
					if(phone1==null&&phone2==null&&phone3==null){
						storetel=rs.getString(3).split("-");
						phone1=storetel[0];
						phone2=storetel[1];
						phone3=storetel[2];
					}
					if(storeaddress==null||storeaddress==""){
						storeaddress=rs.getString(4);
					}
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
			<tr>
				<th>거래처코드</th>
				<td><input type=number name=storeno readonly value="<%=storeno%>" style="width:100%;"></td>
			</tr>
			<tr>
				<th>거래처 이름</th>
				<td><input type=text name=storename style="width:100%;" value="<%=storename==null||storename=="" ? "" : storename%>"></td>
			</tr>
			<tr>
				<th>거래처 전화번호</th>
				<td><div style="width:100%;">
					<select name=phone1 style="width:26%;">
						<option value="0">지역선택</option>
						<%
						String num=null;
						String areaname=null;
						try{
							sql="select * from areanumber";
							pstmt=conn.prepareStatement(sql);
							rs=pstmt.executeQuery();
							while(rs.next()){
								if(rs.getInt(1)<10){
									num="0"+rs.getString(1);
								}else if(rs.getInt(1)<100){
									num="0"+rs.getString(1);
								}else{
									num=rs.getString(1);
								}
								areaname=rs.getString(2);
						%>
						<option value="<%=num %>" <%=phone1.equals(num) ? "selected" : "" %>>[ <%=num %> ] <%=areaname %></option>
						<%
							}
						}catch(Exception e){
							e.printStackTrace();
						}
						%>
					</select>
					-
					<input type="number" name=phone2 style="width:34%;" value="<%=phone2==null||phone2=="" ? "" : phone2%>">
					-
					<input type="number" name=phone3 style="width:34%;" value="<%=phone3==null||phone3=="" ? "" : phone3%>">
				</div></td>
			</tr>
			<tr>
				<th>거래처주소</th>
				<td><input type=text name=storeaddress style="width:100%;" value="<%=storeaddress==null||storeaddress=="" ? "" : storeaddress%>"></td>
			</tr>
			<tr id="btntr">
				<td colspan=2>
					<input id="btn" type=button value="등록" onclick=add()>
					<input id="btn" type=button value="취소" onclick=first()>
				</td>
			</tr>
		</table>
	</form>
</section>
<%@ include file="../Main/footer.jsp" %>
</body>
<script>
function first(){
	location.href="update_Store.jsp?storeno=<%=storeno%>"
}
function add(){
	var doc=document.form;
	if(doc.storename.value==""){
		alert("[거래처 이름]\n거래처 이름을 입력하세요.");
		doc.storename.focus();
	}else if(doc.phone1.value=="0"){
		alert("[거래처전화번호]\n지역번호를 선택하세요.");
		doc.phone1.focus();
	}else if(doc.phone2.value==""){
		alert("[거래처전화번호]\n거래처 전화번호를 입력하세요.");
		doc.phone2.focus();
	}else if(doc.phone3.value==""){
		alert("[거래처전화번호]\n거래처 전화번호를 입력하세요.");
		doc.phone3.focus();
	}else if(doc.storeaddress.value==""){
		alert("[거래처주소]\n거래처 주소를 입력하세요.");
		doc.storeaddress.focus();
	}else{
		doc.action="update_Store_Process.jsp";
		doc.submit();
	}
}
</script>
</html>