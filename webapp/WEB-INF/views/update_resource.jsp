<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.nkxgen.spring.orm.model.Role" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Resource</title>
    <style>
        <!-- Your CSS styles here -->
    </style>
</head>
<body>
    <h1>Update Resource</h1>

    <form action="updateSuccess" method="POST">
        <label for="displayName">Display Name:</label>
        <input type="text" id="displayName" name="userDisplayName" value="${resource.userDisplayName}" readonly>

        <label for="role">Role:</label>
        <select name="userRole" id="role" required>
            <c:forEach items="${roles}" var="role">
                <option value="${role.roleId}" ${resource.userRole.roleId eq role.roleId ? 'selected' : ''}>${role.roleName}</option>
            </c:forEach>
        </select>

        <label for="status">Status:</label>
        <select name="userStatus" id="status" required>
            <option value="A" ${resource.userStatus eq 'A' ? 'selected' : ''}>Active</option>
            <option value="B" ${resource.userStatus eq 'B' ? 'selected' : ''}>Non-Active</option>
        </select>

        <input type="hidden" name="originalDisplayName" value="${resource.userDisplayName}">

        <button type="submit">Update</button>
    </form>

    <%-- Include the necessary script or link tags here --%>
</body>
</html>