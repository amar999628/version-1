package com.nkxgen.spring.orm.dao;
import java.util.List;

import com.nkxgen.spring.orm.model.Sprints;

public interface SprintDAO {
    Sprints getSprintById(int sprintId);
    List<Sprints> getAllSprints();
    void createSprint(Sprints sprint);
    void updateSprint(Sprints sprint);
    void deleteSprint(int sprintId);
}
