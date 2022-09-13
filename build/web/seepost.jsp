<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page import="com.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.PostDao"%>
<%@page import="com.entities.Message"%>
<%@page import="com.entities.User"%>
<%@page errorPage="errors.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    User u = (User) session.getAttribute("currentUser");
    if (u == null) {
        response.sendRedirect("LoginA.jsp");

    }
%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>See Post</title>
  </head>
  <body>
      <br>
      <br>
      <h1 class="text-center">See your Post Details</h1><br>
      <br>
      
      <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/quiz" user="root" password="root"  var="ds"></sql:setDataSource>
        <sql:query dataSource="${ds}" var="rs">select * from posts where uid=<%= u.getId()%></sql:query>
        <c:set var="i" value="0" scope="application"></c:set>
        <%! int i=1;%>
      <div class="container text-center">
          <table class="table table-success table-striped table-bordered border-primary">
              <tr>                  
                    <th>Sl. No.</th>
                    <th>Post Title</th>
                    <th>Post Content</th>
                    <th>Post Code</th>
                    <th>Post Upload Date   </th>
                    
                </tr>
                
            <c:forEach items="${rs.rows}" var="row">
                
                <tr class="table-info">
                    <td><%= i++ %></td>
                    <td><c:out value="${row.pTitle}"></c:out></td>
                    <td><c:out value="${row.pContent}"></c:out></td>
                    <td><c:out value="${row.pCOde}"></c:out></td>
                    <td><c:out value="${row.pDate}"></c:out></td>
                    
                       
                    
                </tr>
            </c:forEach>
          </table>
      </div>

   

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    
  </body>
</html>

