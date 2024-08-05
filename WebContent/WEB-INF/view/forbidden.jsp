<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Access Forbidden</title>
    <script>
        function goBack() {
            window.history.back();
        }
    </script>
    <link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/custom.css">
</head>
<body>
    <h1>Access Forbidden</h1>
    <p id="forbidden">You don't have permission to access this page.<a href="#" onclick="goBack()">Back to previous page.</a></p>
</body>
</html>