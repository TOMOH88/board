<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SQL 입력창</title>

<%
request.setCharacterEncoding("utf-8");
String title = request.getParameter("title");
String writer = request.getParameter("writer");
String regdate = request.getParameter("regdate"); 
int count = 0;
String content = request.getParameter("content");
if(title == "" ||title == null) out.println("title이 null입니다.");
if(writer == "" ||writer == null)
    out.println("writer가 null입니다.");   
else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer))
    out.println("이메일 형식이 아닙니다."); 
if(regdate == "" ||regdate == null)
    out.println("regdate가 null입니다.");
else if(!Pattern.matches("^[0-9]*$", regdate))
    out.println("숫자형식이 아닙니다."); 
if(content == "" ||content == null) out.println("content가 null입니다.");
try {
     String driverName = "oracle.jdbc.driver.OracleDriver"; 
     String url = "jdbc:oracle:thin:@localhost:1521:XE";          
     Class.forName(driverName);
     Connection con = DriverManager.getConnection(url,"board","board");  
     out.println("Oracle 데이터베이스 db에 성공적으로 접속했습니다");
    
     Statement stmt = con.createStatement();          
     String sql = "INSERT INTO BOARD "+
						"(IDX, TITLE, WRITER, REGDATE, COUNT, CONTENT) "+
						"VALUES (boardNo_seq.nextval, '"+title+"', '"+writer+"', '"+regdate+"', '1', '"+content+"')";
     stmt.executeUpdate(sql);   
     con.close();
} catch (Exception e) {
     out.println("Oracle 데이터베이스 db 접속에 문제가 있습니다. <hr>");
     out.println(e.getMessage());
     e.printStackTrace();
}finally{	 
    out.print("<script>location.href='index.jsp';</script>");
}
%>
</head>
<body>
</body>
</html>