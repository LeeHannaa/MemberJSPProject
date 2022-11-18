<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.dao.MemberDAO, com.example.bean.MemberVO" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>free board</title>
    <style>
        #list {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }
        #list td, #list th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align:center;
        }
        #list tr:nth-child(even){background-color: #f2f2f2;}
        #list tr:hover {background-color: #ddd;}
        #list th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            background-color: #006bb3;
            color: white;
        }
    </style>
    <script>
        function delete_ok(id){
            var a = confirm("정말로 삭제하겠습니까?");
            if(a) location.href='delete_ok.jsp?id=' + id;
        }
    </script>
</head>
<body>
<h1>*회원 관리*</h1>
<%
    MemberDAO boardDAO = new MemberDAO();
    List<MemberVO> list = boardDAO.getList();
    request.setAttribute("list",list);
%>
<table id="list" width="90%">
    <tr>
        <th>No</th>
        <th>User Id</th>
        <th>Username</th>
        <th>Email</th>
        <th>Photo</th>
        <th>Detail</th>
        <th>Regdate</th>
        <th>View</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items="${list}" var="u" varStatus="status">
        <tr>
            <td>${fn:length(list)-status.index}</td>
            <td>${u.getUserid()}</td>
            <td>${u.getUsername()}</td>
            <td>${u.getEmail()}</td>
            <td>
            <c:if test = "${u.getPhoto() ne ''}"><br /><img src="${pageContext.request.contextPath}/upload/${u.getPhoto()}" width="100" height="100" calss = "photo"></c:if>
            </td>
            <td>${u.getDetail()}</td>
            <td>${u.getRegdate()}</td>
            <td><a href="view.jsp?id=${u.getSid()}">View</a></td>
            <td><a href="editform.jsp?id=${u.getSid()}">Edit</a></td>
            <td><a href="javascript:delete_ok('${u.getSid()}')">Delete</a></td>
        </tr>
    </c:forEach>
</table>
<br/><a href="addform.jsp">신규 회원 추가</a>
</body>
</html>