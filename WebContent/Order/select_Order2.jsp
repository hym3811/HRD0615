<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문 목록(주문일자별 수량 및 금액 합계)</title>
</head>
<body>
<%@ include file="../Main/header.jsp" %>
<%@ include file="../Main/nav.jsp" %>
<section>
	<form name=form>
		<br>
		<h3 id="title">주문 목록(주문일자별 수량 및 금액 합계)</h3>
		<br>
		<table border=1 style="margin:0 auto;width:50%;text-align:center;">
			<tr>
				<th style="height:40px;">No</th>
				<th>주문일자</th>
				<th>주문수량</th>
				<th>주문금액</th>
			</tr>
<%
	Integer no=0;
	java.util.Date orderdate=null;
	Integer orderqty=0;
	Integer total=0;
	Integer sumqty=0;
	Integer sumtotal=0;
	try{
		sql="select orderdate,sum(orderqty),sum(orderqty*unitprice) from order0614 group by orderdate order by orderdate";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			no++;
			orderdate=rs.getDate(1);
			orderqty=rs.getInt(2);
			total=rs.getInt(3);
			sumqty+=orderqty;
			sumtotal+=total;
%>
			<tr style="text-align:center;">
				<td style="height:40px;"><%=no %></td>
				<td><%=orderdate %></td>
				<td><%=df.format(orderqty) %></td>
				<div>
				<td style="text-align:right;"><%=df.format(total) %></td>
				</div>
			</tr>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
			<tr id="btntr">
				<td colspan=2>합계</td>
				<td><%=df.format(sumqty) %></td>
				<div>
				<td style="text-align:right;"><%=df.format(sumtotal) %></td>
				</div>
			</tr>
		</table>
		<table style="margin:0 auto;"><tr><td>
			<input type=button id="btn" value="등록" onclick="location.href='add_Order.jsp'">
		</td></tr></table>
	</form>
</section>
<%@ include file="../Main/footer.jsp" %>
</body>
</html>