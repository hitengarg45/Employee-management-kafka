package EmployeeData.EmployeeDataProject.listener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

import EmployeeData.EmployeeDataProject.model.Employee;
import EmployeeData.EmployeeDataProject.service.EmployeeService;

@Service
public class EmployeeConsumer {
	@Autowired
	private EmployeeService employeeService;
	
	@KafkaListener(topics = "Employees_Data", groupId = "group_consumer", containerFactory = "employeeKafkaListenerFactory")
	public void consumeJson(Employee employee) {
		System.out.println("Consumed Message: " + employee.toString());
		employeeService.addEmployee(employee);
	}
}