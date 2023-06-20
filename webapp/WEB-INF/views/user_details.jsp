<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.nkxgen.spring.orm.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Details</title>
    <style>
        <!-- Your CSS styles here -->
    </style>
</head>
<body>
    <h1>User Details</h1>

    <table>
        <tr>
            <th>Display Name:</th>
            <td>${resource.userDisplayName}</td>
        </tr>
        <tr>
            <th>Employee ID:</th>
            <td>${resource.userEmployeeId}</td>
        </tr>
        <tr>
            <th>Role:</th>
            <td>${resource.userRole.roleName}</td>
        </tr>
        
        <!-- Add more details here -->
        <tr>
            <th>Status:</th>
            <td>${resource.userStatus}</td>
        </tr>
        <tr>
            <th>Creation Date:</th>
            <td>${resource.userCreationDate}</td>
        </tr>
        <tr>
            <th>Last Updated Date:</th>
            <td>${resource.userLastUpdatedDate}</td>
        </tr>
    </table>

    <%-- Include the necessary script or link tags here --%>
</body>
</html>