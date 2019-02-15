<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>본격! 게시판 - 게시글 삭제</title>    
</head>
<%
    String idx = request.getParameter("idx");
    try {
        String driverName = "oracle.jdbc.driver.OracleDriver"; 
        String url = "jdbc:oracle:thin:@localhost:1521:XE";
        Class.forName(driverName);
        Connection con = DriverManager.getConnection(url,"board","board");
        out.println("Oracle Database Connection Success.");
        Statement stmt = con.createStatement();        
        String sql = "delete from board where idx = " + idx ;   // 삭제 쿼리입니다.
        stmt.executeQuery(sql);
        con.close();
    }catch (Exception e) {
        out.println("Oracle Database Connection Something Problem. <hr>");
        out.println(e.getMessage());
        e.printStackTrace();
    }
%>
<script>
    alert("게시글이 삭제되었습니다");  // 게시글이 삭제되었다는 경고창을 띄워주고
    location.href="index.jsp";          // 리스트페이지로 이동합니다.
</script>
<body>                                           
</body>
</html>