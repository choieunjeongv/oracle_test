<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn = null;
	Statement statement = null;
	ResultSet ret = null;//쿼리의 실행 결과를 받아주는 자료구조
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String uid = "scott";
	String upw = "tiger";
	String query = "select * from member";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오라클DB 연결 테스트</title>
</head>
<body>
	<%
	

	  try{
	         Class.forName(driver);
	         conn = DriverManager.getConnection(url, uid, upw);
	         statement = conn.createStatement();
	         ret = statement.executeQuery(query);
	         
	         while(ret.next()){
	        	 String id = ret.getString("id");
	        	 String pw = ret.getString("pw");
	        	 String name = ret.getString("name");
	        	 String phone = ret.getString("phone");
	        	 
	        	 out.println("아이디 : " + id + ", 비밀번호 : " + pw + ", 이름 : " + name + ", 전화번호 : " + phone + "<br>");
	        	 
	        			 
	         }
	         
	         //out.println(conn);
	      } catch(Exception e){ 
				e.printStackTrace();
	      } finally {
	      		try{
		      		if(ret != null){
		      			ret.close();
		      		}
		      		if(statement != null){
		      			statement.close();
		      		}
		      		if(conn != null){
		      			conn.close();
		      		
		      		}
	      		
	      	}catch(Exception e){
	      		e.printStackTrace();
	      	}
	         
	      }
	
	%>
</body>
</html>