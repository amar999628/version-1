<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Add Project Task</title>
</head>
<body>
    <h1>Add Project Task</h1>
    
    <form:form action="/projecttasks/add" method="POST" modelAttribute="projectTaskInput">
        <label for="taskId">Task ID:</label>
        <input type="number" id="taskId" name="taskId" required/><br/>
        
        <label for="assignedUserId">Assigned User:</label>
        <select id="assignedUserId" name="assignedUserId">
            <c:forEach items="${users}" var="user">
                <option value="${user.userId}">${user.userName}</option>
            </c:forEach>
        </select><br/>

        <label for="taskName">Task Name:</label>
        <input type="text" id="taskName" name="taskName" required/><br/>
        
        <label for="taskCreationDateTime">Task Creation Date & Time:</label>
        <input type="datetime-local" id="taskCreationDateTime" name="taskCreationDateTime" required/><br/>
        
        <label for="taskCategory">Task Category:</label>
        <input type="text" id="taskCategory" name="taskCategory" required/><br/>
        
        <label for="taskDescription">Task Description:</label>
        <textarea id="taskDescription" name="taskDescription" rows="4" cols="50" required></textarea><br/>
        
        <label for="taskCreatorId">Task Creator ID:</label>
        <input type="number" id="taskCreatorId" name="taskCreatorId" required/><br/>
        
        <label for="numberOfHoursRequired">Number of Hours Required:</label>
        <input type="number" id="numberOfHoursRequired" name="numberOfHoursRequired" step="0.01" required/><br/>
        
        <label for="taskExpectedDateTime">Task Expected Date & Time:</label>
        <input type="datetime-local" id="taskExpectedDateTime" name="taskExpectedDateTime" required/><br/>
        
        <label for="projectId">Project:</label>
        <select id="projectId" name="projectId">
            <c:forEach items="${projects}" var="project">
                <option value="${project.projectId}">${project.projectName}</option>
            </c:forEach>
        </select><br/>
        
        <input type="submit" value="Add Task"/>
    </form:form>
</body>
</html>
