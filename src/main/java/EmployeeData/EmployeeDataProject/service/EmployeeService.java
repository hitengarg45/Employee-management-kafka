package EmployeeData.EmployeeDataProject.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import EmployeeData.EmployeeDataProject.model.Employee;
import EmployeeData.EmployeeDataProject.repository.EmployeeRepository;

@Service
public class EmployeeService {
	@Autowired 
	private EmployeeRepository employeeRepository;
	
	public List<Employee> getAllEmployees(){
		List<Employee> employees = new ArrayList<Employee>();
		employeeRepository.findAll().forEach(employees::add);
		return employees;
	}
	
	public Employee getEmployeeById(Long id) {
		return employeeRepository.findById(id).orElse(null);
	}
	
	public void addEmployee(Employee employee) {
		employeeRepository.save(employee);
		return;
	}
}
