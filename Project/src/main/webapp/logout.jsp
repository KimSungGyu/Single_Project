<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    session.invalidate();
%>
<script type="text/javascript">
    alert('로그아웃 되었습니다.');
    window.location.href = 'view.main';
</script>