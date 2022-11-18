<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.dao.MemberDAO, com.example.bean.MemberVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>*회원 정보 관리*</title>
    <link rel="stylesheet" href="assets/css/member.css">
</head>
<body>
<%
    MemberDAO memberDAO = new MemberDAO();
    String id = request.getParameter("id");
    MemberVO u = memberDAO.getOne(Integer.parseInt(id));
    request.setAttribute("vo", u);
%>
<h1>회원 정보 한눈에 보기</h1>
<table id="edit">
    <tr><td>User ID</td><td>${vo.getUserid()}</td></tr>
    <tr><td>Name</td><td>${vo.getUsername()}</td></tr>
    <tr><td>Email</td><td>${vo.getEmail()}</td></tr>
    <tr><td>Phone Number</td><td>${vo.getPhone()}</td></tr>
    <tr><td>Photo</td><td>
        <c:if test = "${u.getPhoto() ne ''}"><br />
            <img src="${pageContext.request.contextPath}/upload/${vo.getPhoto()}" width="150" height="150" calss = "photo"></c:if>
    </td></tr>
    <tr><td>Bolg URL</td><td>${vo.getBlogurl()}</td></tr>
    <tr><td>Detail</td><td><${ vo.getDetail()}</td></tr>
</table>
<button type="button" onclick="history.back()">이전 페이지로 이동</button>
</body>
</html>