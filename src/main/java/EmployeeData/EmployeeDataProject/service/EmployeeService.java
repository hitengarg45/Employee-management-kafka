package EmployeeData.EmployeeDataProject.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;

import EmployeeData.EmployeeDataProject.model.Employee;
import EmployeeData.EmployeeDataProject.repository.EmployeeRepository;

class The_Comparator implements Comparator<Employee>{
	public int compare(Employee e1, Employee e2) {
		int result = (int) (e2.getId() - e1.getId());
		return result;
	}
}

@Service
public class EmployeeService {
	@Autowired 
	private EmployeeRepository employeeRepository;
	
	public List<Employee> getAllEmployees(){
		List<Employee> employees = new ArrayList<Employee>();
		employeeRepository.findAll().forEach(employees::add);
		Collections.sort(employees, new The_Comparator());
		return employees;
	}
	
	public Employee getEmployeeById(Long id) {
		return employeeRepository.findById(id).orElse(null);
	}
	
	public List<Employee> searchEmployees(String firstName, String lastName, String city, String state, String jobTitle) {
		List<Employee> employees = new ArrayList<Employee>();
		employeeRepository.findByFirstNameContainingIgnoreCaseAndLastNameContainingIgnoreCaseAndCityContainingIgnoreCaseAndStateContainingIgnoreCaseAndJobTitleContainingIgnoreCase(firstName, lastName, city, state, jobTitle).forEach(employees::add);
		return employees;
	}
	
	public void addEmployee(Employee employee) {
		employeeRepository.save(employee);
		return;
	}
}
