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

    <form action="addSuccess" method="POST">
        <label for="id">ID:</label>
        <input type="text" id="id" name="userId" required>

        <label for="displayName">Display Name:</label>
        <input type="text" id="displayName" name="userDisplayName" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="userPassword" required>

        
        <label for="employeeId">Employee ID:</label>
        <input type="text" id="employeeId" name="userEmployeeId" required>

        <label for="status">Status:</label>
        <select name="userStatus" id="status" required>
            <option value="A">Active</option>
            <option value="B">Non-Active</option>
        </select>

    
<label for="userRole">Role:</label>
<select name="userRole" id="userRole" required>
    <c:forEach items="${roles}" var="role">
        <option value="${role.roleId}">${role.roleName}</option>
    </c:forEach>
</select>

<script>
    var selectElement = document.getElementById("userRole");
    selectElement.addEventListener("change", function() {
        var selectedRoleId = this.value;
        console.log("Selected Role ID: " + selectedRoleId);
    });
</script>



        <button type="submit">Add</button>
    </form>

    <%-- Include the necessary script or link tags here --%>
</body>
</html>