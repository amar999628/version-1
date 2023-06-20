<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.nkxgen.spring.orm.model.Project" %>
<%@ page import="com.nkxgen.spring.orm.model.Role" %>
<!DOCTYPE html>
<html>
<head>
    <title>Resources Page</title>
    <style>
        <!-- Your CSS styles here -->
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {
        $('#filterForm').on('submit', function(event) {
            event.preventDefault();
            var formData = $(this).serialize();
            $.ajax({
                type: 'GET',
                url: 'resources/filter',
                data: formData,
                dataType: 'json', // Specify the response data type as JSON
                success: function(response) {
                    var filteredResourcesHtml = '';
                    $.each(response, function(index, resource) {
                        filteredResourcesHtml += '<tr>' +
                            '<td>' + resource.userId + '</td>' +
                            '<td><a href="resources/details?displayName=' + resource.userDisplayName + '">' + resource.userDisplayName + '</a></td>' +
                            '<td>' + resource.userEmployeeId + '</td>' +
                            '<td>' + resource.userRole.roleName + '</td>' +
                            '<td>' +
                            '<a href="resources/update?displayName=' + resource.userDisplayName + '">Update</a> | ' +
                            '<a href="resources/tasks?userId=' + resource.userId + '">View Tasks</a>' +
                            '</td>' +
                            '</tr>';
                    });
                    $('#filteredResources table tbody').html(filteredResourcesHtml);
                },
                error: function() {
                    console.log('Error occurred during filter request.');
                }
            });
        });
    });
</script>

</head>
<body>
    <h1>Resources</h1>

    <form id="filterForm">
        <label for="project">Project:</label>
        <select name="projectFilter" id="project">
            <option value="">All</option>
            <c:forEach items="${projects}" var="project">
                <option value="${project.projectId}">${project.projectName}</option>
            </c:forEach>
        </select>

        <label for="role">Role:</label>
        <select name="roleFilter" id="role">
            <option value="">All</option>
            <c:forEach items="${roles}" var="role">
                <option value="${role.roleId}">${role.roleName}</option>
            </c:forEach>
        </select>

        <button type="submit">Filter</button>
    </form>

    <div id="filteredResources">
        <table>
            <thead>
                <tr>
                    <th>Employee ID</th>
                    <th>Display Name</th>
                    <th>Role</th>
                    <th>Action</th>
                    <th>Tasks</th>
                </tr>
            </thead>
            <tbody>
                <%-- Display filtered resources --%>
                <c:forEach items="${resources}" var="resource">
                    <tr>
                        <td>${resource.userId}</td>
                        <td><a href="resources/details?displayName=${resource.userDisplayName}">${resource.userDisplayName}</a></td>
                        <td>${resource.userEmployeeId}</td>
                        <td>${resource.userRole.roleName}</td>
                        <td>
                            <a href="resources/update?displayName=${resource.userDisplayName}">Update</a> |
                            <a href="resources/tasks?userId=${resource.userId}">View Tasks</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <a href="resources/AddResource">Add Resource</a>

    <%-- Include the necessary script or link tags here --%>
</body>
</html>