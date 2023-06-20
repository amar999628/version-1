package com.nkxgen.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nkxgen.spring.orm.model.ProjectDto;
import com.nkxgen.spring.orm.model.ProjectTask;
import com.nkxgen.spring.orm.model.ProjectTaskDTO;
import com.nkxgen.spring.orm.model.ProjectTaskInput;
import com.nkxgen.spring.orm.model.User;
import com.nkxgen.spring.orm.service.ProjectService;
import com.nkxgen.spring.orm.service.ProjectTaskService;
import com.nkxgen.spring.orm.service.ResourceService;

@Controller
public class ProjectTaskController {
    private final ProjectTaskService projectTaskService;
    private final ResourceService resourceService;
	private final ProjectService projectService;

    @Autowired
    public ProjectTaskController(ProjectTaskService projectTaskService ,ResourceService resourceService, ProjectService projectService) {
        this.projectTaskService = projectTaskService;
        this.resourceService = resourceService;
		this.projectService = projectService;
    }

	@RequestMapping(value = "/createprojecttasks", method = RequestMethod.GET)
    public ProjectTaskDTO createProjectTask(@RequestBody ProjectTaskInput request) {
        ProjectTask projectTask = request.toEntity();
        ProjectTask createdTask = projectTaskService.createProjectTask(projectTask);
        return ProjectTaskDTO.fromEntity(createdTask);
    }
	@RequestMapping(value = "/projecttasks", method = RequestMethod.GET)
	public String getAllProjectTasks(Model model) {
	
	    List<ProjectTaskDTO> projectTasks = projectTaskService.getProjectTaskDTOList();

		List<User> resources = resourceService.getAllResources();
		List<ProjectDto> projects = projectService.getAllProjects();
	 
	    model.addAttribute("resources", resources);
		model.addAttribute("projects", projects);
	   
	    model.addAttribute("projectTasks", projectTasks);
	    return "projecttasks";
	}
	@RequestMapping(value = "/addProjectTaskForm", method = RequestMethod.GET)
	public String showAddProjectTaskForm(Model model) {
	    // Add any necessary data to the model
	    
	    // For example, if you need to populate a dropdown list with projects or resources:
	    List<ProjectDto> projects = projectService.getAllProjects();
	    List<User> resources = resourceService.getAllResources();
	    model.addAttribute("projects", projects);
	    model.addAttribute("resources", resources);
	    
	    // Return the view name for the add project task form
	    return "newemp";
	}

	@RequestMapping(value = "/addprojecttask", method = RequestMethod.POST)
	public String addProjectTask(@Validated ProjectTaskInput projectTaskInput) {
		System.out.println(projectTaskInput.getAssignedUserId());
		System.out.println(projectTaskInput);
	    ProjectTask projectTask = projectTaskInput.toEntity();
	    System.out.println(projectTask.getproject().getProjectName());
	    projectTaskService.createProjectTask(projectTask);
	    return "redirect:/projecttasks";
	}



	

    // Other controller methods for updating, deleting project tasks
}
