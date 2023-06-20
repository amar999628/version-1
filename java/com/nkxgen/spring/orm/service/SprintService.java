package com.nkxgen.spring.orm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.nkxgen.spring.orm.dao.SprintDAO;
import com.nkxgen.spring.orm.model.Sprints;

@Component
@Transactional

public class SprintService {

    @Autowired
    private SprintDAO sprintDAO;

    public Sprints getSprintById(int sprintId) {
        return sprintDAO.getSprintById(sprintId);
    }

    public List<Sprints> getAllSprints() {
        return sprintDAO.getAllSprints();
    }

    public void createSprint(Sprints sprint) {
        sprintDAO.createSprint(sprint);
    }

    public void updateSprint(Sprints sprint) {
        sprintDAO.updateSprint(sprint);
    }

    public void deleteSprint(int sprintId) {
        sprintDAO.deleteSprint(sprintId);
    }
}
