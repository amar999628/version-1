package com.nkxgen.spring.orm.model;

import java.math.BigDecimal;
import java.util.Date;

public class ProjectTaskDTO {
    private int taskId;
    private int assignedUserId;
    private String taskName;
    private Date taskCreationDateTime;
    private String taskCategory;
    private String taskDescription;
    private int taskCreatorId;
    private BigDecimal numberOfHoursRequired;
    private Date taskExpectedDateTime;
    private BigDecimal actualHours;
    
    // Getters and setters
    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public int getAssignedUserId() {
        return assignedUserId;
    }

    public void setAssignedUserId(int assignedUserId) {
        this.assignedUserId = assignedUserId;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public Date getTaskCreationDateTime() {
        return taskCreationDateTime;
    }

    public void setTaskCreationDateTime(Date date) {
        this.taskCreationDateTime = date;
    }

    public String getTaskCategory() {
        return taskCategory;
    }

    public void setTaskCategory(String taskCategory) {
        this.taskCategory = taskCategory;
    }

    public String getTaskDescription() {
        return taskDescription;
    }

    public void setTaskDescription(String taskDescription) {
        this.taskDescription = taskDescription;
    }

    public int getTaskCreatorId() {
        return taskCreatorId;
    }

    public void setTaskCreatorId(int taskCreatorId) {
        this.taskCreatorId = taskCreatorId;
    }

    public BigDecimal getNumberOfHoursRequired() {
        return numberOfHoursRequired;
    }

    public void setNumberOfHoursRequired(BigDecimal numberOfHoursRequired) {
        this.numberOfHoursRequired = numberOfHoursRequired;
    }

    public Date getTaskExpectedDateTime() {
        return taskExpectedDateTime;
    }

    public void setTaskExpectedDateTime(Date date) {
        this.taskExpectedDateTime = date;
    }

    public BigDecimal getActualHours() {
        return actualHours;
    }

    public void setActualHours(BigDecimal actualHours) {
        this.actualHours = actualHours;
    }

    // Constructors

    public ProjectTaskDTO() {
    }

    public static ProjectTaskDTO fromEntity(ProjectTask projectTask) {
        ProjectTaskDTO dto = new ProjectTaskDTO();
        dto.setTaskId(projectTask.getTaskId());
      
        
        if (projectTask.getAssignedUser() != null) {
            dto.setAssignedUserId(projectTask.getAssignedUser().getUserId());
        }
        dto.setTaskName(projectTask.getTaskName());
        dto.setTaskCreationDateTime(projectTask.getTaskCreationDateTime());
        dto.setTaskCategory(projectTask.getTaskCategory());
        dto.setTaskDescription(projectTask.getTaskDescription());
        if (projectTask.getTaskCreator() != null) {
            dto.setTaskCreatorId(projectTask.getTaskCreator().getUserId());
        }
        dto.setNumberOfHoursRequired(projectTask.getNumberOfHoursRequired());
        dto.setTaskExpectedDateTime(projectTask.getTaskExpectedDateTime());
        dto.setActualHours(projectTask.getActualHours());
        return dto;
    }

}
