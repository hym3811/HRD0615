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
		<h3 id="title">주문 목록(상품별)</h3>
		<br>
		<table border=1 style="margin:0 auto;width:50%;text-align:center;">
			<tr>
				<th style="height:40px;">No</th>
				<th>상품코드</th>
				<th>상품명</th>
				<th>주문수량</th>
				<th>주문금액</th>
			</tr>
<%
	Integer no=0;
	String productid=null;
	String name=null;
	Integer orderqty=0;
	Integer total=0;
	Integer sumqty=0;
	Integer sumtotal=0;
	try{
		sql="select a.productid,a.name,sum(b.orderqty),sum(b.orderqty*b.unitprice) from product0614 a join order0614 b on a.productid=b.productid group by a.productid, a.name order by a.productid";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			no++;
			productid=rs.getString(1);
			name=rs.getString(2);
			orderqty=rs.getInt(3);
			total=rs.getInt(4);
			sumqty+=orderqty;
			sumtotal+=total;
%>
			<tr style="text-align:center;">
				<td style="height:40px;"><%=no %></td>
				<td><%=productid %></td>
				<td><%=name %></td>
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
				<td colspan=3>합계</td>
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