package EmployeeData.EmployeeDataProject.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import EmployeeData.EmployeeDataProject.model.Employee;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Long>{
	public Optional<Employee> findById(Long id);
	public List<Employee> findByFirstNameContainingIgnoreCaseAndLastNameContainingIgnoreCaseAndCityContainingIgnoreCaseAndStateContainingIgnoreCaseAndJobTitleContainingIgnoreCase(String firstName, String lastName, String city, String state, String jobTitle);
}
