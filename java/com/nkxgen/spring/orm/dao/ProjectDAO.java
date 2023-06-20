package com.nkxgen.spring.orm.dao;

import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Component;

import com.nkxgen.spring.orm.model.Project;
import com.nkxgen.spring.orm.model.ProjectDto;
import com.nkxgen.spring.orm.model.ProjectFilter;

@Component
public class ProjectDAO {

    @PersistenceContext
    private EntityManager entityManager;

    public List<ProjectDto> getAllProjects() {
        TypedQuery<Project> query = entityManager.createQuery("SELECT pt FROM Project pt", Project.class);
        List<Project> projects = query.getResultList();
        List<ProjectDto> convertedProjects = projects.stream().map(ProjectDto::fromEntity).collect(Collectors.toList());
        return convertedProjects;
    }

    public Project findById(short id) {
        return entityManager.find(Project.class, id);
    }

    public List<ProjectDto> getFilterProjects(ProjectFilter projectFilter) {
        String jpql = "SELECT p FROM Project p WHERE 1 = 1";
        TypedQuery<Project> query = entityManager.createQuery(jpql, Project.class);

        String projectId = projectFilter.getProjectId();
        String status = projectFilter.getStatus();

        if (projectId != null && !projectId.isEmpty()) {
            jpql += " AND p.projectId = :projectId";
            query.setParameter("projectId", projectId);
        }
        if (status != null && !status.isEmpty()) {
            jpql += " AND p.status = :status";
            query.setParameter("status", status);
        }

        List<Project> projects = query.getResultList();
        List<ProjectDto> convertedProjects = projects.stream().map(ProjectDto::fromEntity).collect(Collectors.toList());
        return convertedProjects;
    }
}
