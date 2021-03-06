<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>본격! 게시판 - 게시글 조회</title>
</head>
<%
    String idx = request.getParameter("idx");
    try {
        String driverName = "oracle.jdbc.driver.OracleDriver"; 
        String url = "jdbc:oracle:thin:@localhost:1521:XE";
        ResultSet rs = null;
        
        Class.forName(driverName); 
        Connection con = DriverManager.getConnection(url,"board","board"); 
        out.println("Oracle Database Connection Success.");
        Statement stmt = con.createStatement();        
        String sql = "select * from board where idx = " + idx ;
        rs = stmt.executeQuery(sql);
		while(rs.next()){
%>
<body>
	<h1>게시글 조회</h1>
	<table border="1">
		<!-- border은 테두리를 표시하는 속성입니다. -->
		<tr>
			<th>번호</th>
			<td><%=rs.getString("idx")%></td>
			<th>작성자</th>
			<td><%=rs.getString("writer")%></td>
			<th>날짜</th>
			<td><%=rs.getString("regdate")%></td>
			<th>조회수</th>
			<td><%=rs.getString("count")%></td>
		</tr>
		<tr>
			<th colspan="2">제목</th>
			<!-- colspan은 행병합 속성입니다. -->
			<td colspan="6"><%= rs.getString("title")%></td>
		</tr>
		<tr>
			<th colspan="2">내용</th>
			<td colspan="6"><%= rs.getString("content")%></td>
		</tr>
	</table>
	<a href="delete.jsp?idx=<%=rs.getString("idx")%>">게시글삭제</a>
	<a href="index.jsp">목록으로</a>
	<%      
        }
        con.close(); 
    }catch (Exception e) {
        out.println("Oracle Database Connection Something Problem. <hr>");
        out.println(e.getMessage());
        e.printStackTrace();
    }
%>
</body>
</html>