<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.nkxgen.spring.orm.model.Task" %>
<%@ page import="com.nkxgen.spring.orm.model.User,com.nkxgen.spring.orm.model.Project" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Tasks</title>
    <style>
        <!-- Your CSS styles here -->
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#filterForm').on('submit', function (event) {
                event.preventDefault();
                var formData = {};
                $(this).serializeArray().forEach(function (item) {
                    formData[item.name] = item.value;
                });
                console.log(formData);

                var projectFilter = formData['projectFilter'];
                var statusFilter = formData['statusFilter'];
                var categoryFilter = formData['categoryFilter'];

                $.ajax({
                    type: 'GET',
                    url: 'tasks/filter',
                    data: {
                        projectFilter: projectFilter,
                        statusFilter: statusFilter,
                        categoryFilter: categoryFilter,
                        userId: '${userId}' // Use the userId from JSP
                    },
                    dataType: 'json',
                    success: function (response) {
                        var filteredTasksHtml = '';
                        $.each(response, function (index, task) {
                            filteredTasksHtml += '<tr>' +
                                '<td>' + task.taskName + '</td>' +
                                '<td>' + task.taskDescription + '</td>' +
                                '<td>' + task.taskCategory + '</td>' +
                                '<td>' + task.taskCreator.userDisplayName + '</td>' +
                                '<td>' + task.taskSupervisor.userDisplayName + '</td>' +
                                '<td>' + task.taskStatus + '</td>' +
                                '</tr>';
                        });
                        $('#filteredTasks tbody').html(filteredTasksHtml);
                    },
                    error: function () {
                        console.log('Error occurred during filter request.');
                    }
                });
            });
        });
    </script>
</head>
<body>
    <h1>Tasks for User</h1>

    <form id="filterForm">
        <label for="project">Project:</label>
        <select name="projectFilter" id="project">
            <option value="">All</option>
            <c:forEach items="${projects}" var="project">
                <option value="${project.projectId}">${project.projectName}</option>
            </c:forEach>
        </select>

        <label for="taskStatus">Status:</label>
        <select name="statusFilter" id="taskStatus">
            <option value="">All</option>
            <option value="Pending">Pending</option>
            <option value="In Progress">In Progress</option>
            <option value="Completed">Completed</option>
        </select>

        <label for="category">Category:</label>
        <select name="categoryFilter" id="category">
            <option value="">All</option>
            <option value="Category 1">Category 1</option>
            <option value="Category 2">Category 2</option>
            <option value="Category 3">Category 3</option>
        </select>

        <script>
            console.log("Select element loaded.");
        </script>

        <input type="hidden" name="userId" value="${userId}"> <!-- Add the userId as a hidden input field -->

        <button type="submit">Filter</button>
    </form>

    <table id="filteredTasks">
        <thead>
            <tr>
                <th>Task Name</th>
                <th>Task Description</th>
                <th>Task Category</th>
                <th>Task Creator</th>
                <th>Task Supervisor</th>
                <th>Task Status</th>
                <!-- Add more task properties as needed -->
            </tr>
        </thead>
        <tbody>
            <%-- Display filtered tasks --%>
            <c:forEach items="${tasks}" var="task">
                <tr>
                    <td>${task.taskName}</td>
                    <td>${task.taskDescription}</td>
                    <td>${task.taskCategory}</td>
                    <td>${task.taskCreator.userDisplayName}</td>
                    <td>${task.taskSupervisor.userDisplayName}</td>
                    <td>${task.taskStatus}</td>
                    <!-- Add more task properties as needed -->
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <%-- Include the necessary script or link tags here --%>
</body>
</html>
