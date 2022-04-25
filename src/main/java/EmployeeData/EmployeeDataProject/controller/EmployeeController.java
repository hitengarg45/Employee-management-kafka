package EmployeeData.EmployeeDataProject.controller;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.SendResult;
import org.springframework.stereotype.Controller;
import org.springframework.util.concurrent.ListenableFuture;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import EmployeeData.EmployeeDataProject.service.EmployeeService;
import EmployeeData.EmployeeDataProject.model.Employee;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	KafkaTemplate<String, Employee> kafkaTemplate;
	
	private static final String TOPIC = "Employees_Data";
	
	@GetMapping("")
	public ModelAndView homePage() {
		return new ModelAndView("Home");
	}
	
	//==================================================================================================================
	@GetMapping("/employees")
	public ModelAndView getAllEmployees(){
		List<Employee> employees = employeeService.getAllEmployees();
		ModelAndView model = new ModelAndView("Employees");
		model.addObject("Employees", employees);
		return model;
	}
	
	@GetMapping("/employees/search")
	public ModelAndView searchEmployeesForm() {
		return new ModelAndView("Search");
	}
	
	@PostMapping("/employees/search")
	public ModelAndView searchEmployees(@RequestParam String firstName, @RequestParam String lastName, 
			@RequestParam(name="city", required=false) String city, @RequestParam(name="state", required=false) String state, @RequestParam String jobTitle) {
		if(state == null) state = "";
		if(city == null) city = "";
		List<Employee> employees = employeeService.searchEmployees(firstName, lastName, city, state, jobTitle);
		ModelAndView model = new ModelAndView("Employees");
		model.addObject("Employees", employees);
		return model;
	}
	
	//==================================================================================================================
	@GetMapping("/employees/add")
	public ModelAndView addEmployeeForm() {
		return new ModelAndView("Add", "employee", new Employee());
	}
	
	@PostMapping("/employees/add")
	public ModelAndView addEmployee(@ModelAttribute("employee") Employee employee) {
		ListenableFuture<SendResult<String, Employee>> future = kafkaTemplate.send(TOPIC, employee);
		return new ModelAndView("redirect:/employees");
	}
	
	//==================================================================================================================
	@GetMapping("/employees/{id}/update")
	public ModelAndView updateEmployeeForm(@PathVariable(value = "id") Long employeeId) {
		Employee employee = employeeService.getEmployeeById(employeeId);
		ModelAndView model = new ModelAndView("Update", "employee", new Employee());
		model.addObject("Employee", employee);
		return model;
	}
	
	@PostMapping("/employees/{id}/update")
	public ModelAndView updateEmployee(@ModelAttribute("employee") Employee employee) {
		kafkaTemplate.send(TOPIC, employee);
		return new ModelAndView("redirect:/employees");
	}
	
	//====================================================================================================================
	@GetMapping("/employees/{id}/delete")
	public ModelAndView deleteEmployee(@PathVariable(value = "id") Long employeeId) {
		Employee employee = employeeService.getEmployeeById(employeeId);
		employee.setStatus("inactive");
		kafkaTemplate.send(TOPIC, employee);
		return new ModelAndView("redirect:/employees");
	}
	
	//Get all employees
	//Get employee by id
	//Post employee
	//Update employee
	//Delete Employee
}
