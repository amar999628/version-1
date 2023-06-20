package com.nkxgen.spring.orm.service;

import java.util.List;

import com.nkxgen.spring.orm.model.ResTaskFilter;
import com.nkxgen.spring.orm.model.Task;

public interface TaskService {
	List<Task> getTasksByUserId(int userId);

	List<Task> filterTasks(ResTaskFilter  resTaskFilter);

	// Other task-related methods...
}