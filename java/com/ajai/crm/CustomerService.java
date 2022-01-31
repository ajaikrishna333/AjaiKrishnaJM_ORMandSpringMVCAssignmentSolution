package com.ajai.crm;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface CustomerService {
	
	public List<Customer> findAllCustomer();
	
	public void saveCustomerServ(Customer c);
	
	public Customer searchCustomerServ(int id);
	
	public void deleteCustomerServ (int id);
	
	public List<Customer> searchCustomerByNameCustomerServ (String firstName);
}
