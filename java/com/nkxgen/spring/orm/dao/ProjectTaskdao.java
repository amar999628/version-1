package com.nkxgen.spring.orm.dao;


import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.nkxgen.spring.orm.model.ProjectTask;
import com.nkxgen.spring.orm.model.ProjectTaskDTO;

@Component
@Transactional
public class ProjectTaskdao {
    @PersistenceContext
    private EntityManager entityManager;

    public ProjectTask save(ProjectTask projectTask) {
    	System.out.println(projectTask);
        entityManager.persist(projectTask);
        return projectTask;
    }

    public ProjectTask findById(int taskId) {
        return entityManager.find(ProjectTask.class, taskId);
    }

    public void delete(ProjectTask projectTask) {
        entityManager.remove(projectTask);
    }

    public List<ProjectTaskDTO> getProjectTaskDTOList() {
        TypedQuery<ProjectTask> query = entityManager.createQuery("SELECT pt FROM ProjectTask pt", ProjectTask.class);
        List<ProjectTask> projectTasks = query.getResultList();

        List<ProjectTaskDTO> convertedTasks = projectTasks.stream()
            .map(ProjectTaskDTO::fromEntity)
            .collect(Collectors.toList());
        
        return convertedTasks;
    }


    // Other methods for fetching, updating, and deleting project tasks
}
