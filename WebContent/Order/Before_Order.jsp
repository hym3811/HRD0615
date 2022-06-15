<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../DBConn.jsp" %>
<%
	String chk=request.getParameter("chk");
	try{
		sql="select table_name from user_tables where table_name='ORDER0614'";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()){
			switch(chk){
			case "31":
%>
<script>
location.href="add_Order.jsp";
</script>
<%
				break;
			case "32":
%>
<script>
location.href="select_Order.jsp";
</script>
<%
				break;
			case "33":
%>
<script>
location.href="select_Order2.jsp";
</script>
<%
				break;
			case "34":
%>
<script>
location.href="select_Order3.jsp";
</script>
<%
				break;
			case "35":
				%>
				<script>
				location.href="select_Order4.jsp";
				</script>
				<%
							break;
			case "36":
				%>
				<script>
				location.href="select_Order5.jsp";
				</script>
				<%
							break;
			case "37":
				%>
				<script>
				location.href="select_Order6.jsp";
				</script>
				<%
							break;
			}
		}else{
			sql="create table order0614(orderdate date,ordername varchar2(20),productid varchar2(20) not null, unitprice number(11) not null, orderqty number(11) not null, orderaddress varchar2(45), primary key(orderdate,ordername))";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="insert into order0614 values('20220203','홍길동','P100001',1500000,5,'부산시 금정구')";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="insert into order0614 values('20220201','강감찬','P100002',15000,5,'부산시 부산진구')";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="insert into order0614 values('20220131','이순신','P100001',1500000,3,'부산시 금정구 장전동')";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="insert into order0614 values('20220203','이이','P100001',1500000,2,'부산시 동래구 수안동')";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="insert into order0614 values('20220201','이순신','P100002',15000,3,'부산시 해운대구 반여동')";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="insert into order0614 values('20220131','강감찬','P100002',15000,1,'부산시 해운대구 우동')";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="insert into order0614 values('20220131','홍길동','P100003',12000,2,'부산시 금정구 구서동')";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="insert into order0614 values('20220203','이순신','P100003',12000,3,'부산시 금정구 장전2동')";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="insert into order0614 values('20220203','강감찬','P100003',12000,2,'부산')";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			sql="insert into order0614 values('20220131','이이','P100001',1500000,1,'부산')";
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
%>
<script>
alert("order0614 테이블 생성 완료");
</script>
<%
			
			
			sql="select table_name from user_tables where table_name='PRODUCT0614'";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(!rs.next()){
				sql="create table product0614(productid varchar2(20) primary key,name varchar2(45) not null,unitprice number(11) not null,description varchar2(45),category varchar2(45),manufacturer varchar2(45),unitsinstock number(11),condition varchar2(45))";
				pstmt=conn.prepareStatement(sql);
				pstmt.executeUpdate();pstmt.close();
				sql="insert into product0614 values('P100001','computer',1500000,'cpu256 samsung','10','SAMSUNG',11,'신규제품')";
				pstmt=conn.prepareStatement(sql);
				pstmt.executeUpdate();pstmt.close();
				sql="insert into product0614 values('P100002','mouse',15000,'wireless','10','LG',20,'신규제품')";
				pstmt=conn.prepareStatement(sql);
				pstmt.executeUpdate();pstmt.close();
				sql="insert into product0614 values('P100003','머그컵',12000,'수제품','30','YourSelf',20,'신규제품')";
				pstmt=conn.prepareStatement(sql);
				pstmt.executeUpdate();pstmt.close();
%>
<script>
alert("product0614 테이블 생성 완료");
</script>
<%
				
				sql="select table_name from user_tables where table_name='CATEGORY0614'";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(!rs.next()){
					sql="create table category0614(no number(3) primary key, category varchar2(50) not null)";
					pstmt=conn.prepareStatement(sql);
					pstmt.executeUpdate();pstmt.close();
					sql="insert into category0614 values(10,'전자제품')";
					pstmt=conn.prepareStatement(sql);
					pstmt.executeUpdate();pstmt.close();
					sql="insert into category0614 values(20,'의류')";
					pstmt=conn.prepareStatement(sql);
					pstmt.executeUpdate();pstmt.close();
					sql="insert into category0614 values(30,'공산품')";
					pstmt=conn.prepareStatement(sql);
					pstmt.executeUpdate();pstmt.close();
					sql="insert into category0614 values(40,'식품')";
					pstmt=conn.prepareStatement(sql);
					pstmt.executeUpdate();pstmt.close();
					sql="insert into category0614 values(50,'유제품')";
					pstmt=conn.prepareStatement(sql);
					pstmt.executeUpdate();pstmt.close();
%>
<script>
alert("category0614 테이블 생성 완료");
</script>
<%
				}
			}
		}pstmt.close();
		switch(chk){
		case "31":
%>
<script>
location.href="add_Order.jsp";
</script>
<%
			break;
		case "32":
%>
<script>
location.href="select_Order.jsp";
</script>
<%
			break;
		case "33":
%>
<script>
location.href="select_Order2.jsp";
</script>
<%
			break;
		case "34":
%>
<script>
location.href="select_Order3.jsp";
</script>
<%
			break;
		case "35":
%>
<script>
location.href="select_Order4.jsp";
</script>
<%
			break;
		case "36":
			%>
			<script>
			location.href="select_Order5.jsp";
			</script>
			<%
						break;
		case "37":
			%>
			<script>
			location.href="select_Order6.jsp";
			</script>
			<%
						break;
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>