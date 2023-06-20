<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.nkxgen.spring.orm.model.Project" %>
<%@ page import="com.nkxgen.spring.orm.model.Role" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Resource</title>
    <style>
        <!-- Your CSS styles here -->
    </style>
</head>
<body>
    <h1>Add Resource</h1>

    <form action="hi" method="GET">
        <label for="id">ID:</label>
        <input type="text" id="id" name="userId" required>

        <label for="displayName">Display Name:</label>
        <input type="text" id="displayName" name="userDisplayName" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="userPassword" required>

        <input type="hidden" id="creationDate" name="userCreationDate" value="<%= new java.util.Date() %>" readonly>

        <label for="employeeId">Employee ID:</label>
        <input type="text" id="employeeId" name="userEmployeeId" required>

        <label for="status">Status:</label>
        <select name="userStatus" id="status" required>
            <option value="A">Active</option>
            <option value="B">Non-Active</option>
        </select>
        <% 
		System.out.println(" after status "); %>
      <%  // <input type="hidden" id="lastUpdatedDate" name="userLastUpdatedDate" value="<%= new java.util.Date() // " readonly>    %>

        <label for="role">Role:</label>
        <select name="roleId" id="role" required>
            <c:forEach items="${roles}" var="role">
                <option value="${role.roleId}">${role.roleName}</option>
            </c:forEach>
        </select>

        <% 
		System.out.println(" before button "); %>
        <button type="submit">Add</button>
    </form>

    <%-- Include the necessary script or link tags here --%>
</body>
</html>