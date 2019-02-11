<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>게시판 메인페이지</title>
</head>

<%
request.setCharacterEncoding("utf-8");

    int idx = 1;
 
    String title = request.getParameter("title");
 
    String writer = request.getParameter("writer");
 
    String regdate = request.getParameter("regdate");
 
    int count = 10000;
 
    String content = request.getParameter("content");
 
%>
<body>
	<h1>게시글 리스트</h1>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<tr>
			<td><%=idx %></td>

			<td><%=title %></td>

			<td><%=writer %></td>

			<td><%=regdate %></td>

			<td><%=count %></td>

		</tr>

	</table>
	<a href="writer.jsp">글쓰기</a>
</body>
</html>