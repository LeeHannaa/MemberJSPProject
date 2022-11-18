<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.example.dao.MemberDAO"%>
<%@page import="com.example.common.FileUpload" %>
<%@ page import="com.example.bean.MemberVO" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="u" class="com.example.bean.MemberVO" />
<jsp:setProperty property="*" name="u"/>

<%
    MemberDAO memberDAO = new MemberDAO();
    FileUpload upload = new FileUpload();
    MemberVO w = upload.uploadPhoto(request);

    int i = memberDAO.updateMember(w);
    String msg = "데이터 수정 성공!";
    if(i == 0) msg = "[에러] 데이터 수정 실패";
%>

<script>
    alert('<%=msg%>');
    location.href='list.jsp';
</script>