<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.example.dao.MemberDAO, com.example.bean.MemberVO"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Form</title>
    <link rel="stylesheet" href="assets/css/member.css">
</head>
<body>

<%
    MemberDAO memberDAO = new MemberDAO();
    String id=request.getParameter("id");
    MemberVO u=memberDAO.getOne(Integer.parseInt(id));
    request.setAttribute("vo", u);
%>

<h1>*회원 정보 수정*</h1>
<form action="edit_ok.jsp" method="post" enctype="multipart/form-data">
    <input type="hidden" name="sid" value="<%=u.getSid() %>"/>
    <table id ="edit">
        <tr><td>User ID</td><td><input type="text" name="userid" value="${vo.getUserid()}" disabled /></td></tr>
        <tr><td>Name</td><td><input type="text" name="username" value="${vo.getUsername()}"/></td></tr>
        <tr><td>Phone Number</td><td><input type="text" name="phone" value="${vo.getPhone()}"/></td></tr>
        <tr><td>Photo</td><td><input type="file" name="photo" value="${vo.getPhoto()}"/>
            <c:if test = "${u.getPhoto() ne ''}"><br /><img src="${pageContext.request.contextPath}/upload/${vo.getPhoto()}" calss = "photo"></c:if>
        </td></tr>
        <tr><td>Email</td><td><input type="text" name="email" value="${vo.getEmail()}"/></td></tr>
        <tr><td>Detail</td><td><textarea cols="50" rows="5" name="detail">${ vo.getDetail()}</textarea></td></tr>
    </table>
    <button type="button" onclick="history.back()">이전 페이지로 이동</button>
    <button type="submit"> 회원 정보 수정 </button>
</form>

</body>
</html>