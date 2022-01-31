package com.ajai.crm;

import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired
	CustomerService cs;
	
	@RequestMapping("/list-customer")
	public String listCustomer(Model m) {
		List<Customer> cList = cs.findAllCustomer();
		m.addAttribute("cList",cList);
		return "CustomerList";
	}
	
	@RequestMapping("/add-customer")
	public String addCustomer(Model m) {
		Customer c = new Customer();
		m.addAttribute("customer",c);
		return "NewCustomerForm";
	}
	
	@RequestMapping("/update-customer")
	public String updateCustomer(@RequestParam("id") int id, Model m) {
		Customer c = cs.searchCustomerServ(id);
		m.addAttribute("customer",c);
		return "NewCustomerForm";
	}	
	
	@RequestMapping("/save-customer")
	public String saveCustomer(@RequestParam("id") int id, @RequestParam("firstName") String firstName, @RequestParam("lastName") String lastName, @RequestParam("emailId") String emailId) {
		System.out.println(firstName + " " + lastName + " " + emailId);
		Customer c;
		if(id!=0) {
			c = cs.searchCustomerServ(id);
			c.setFirstName(firstName);
			c.setLastName(lastName);
			c.setEmailId(emailId);
		}else {
			c = new Customer(firstName,lastName,emailId);	
		}
		cs.saveCustomerServ(c);
		return"redirect:/customer/list-customer";
	}
	
	@RequestMapping("/delete-customer")
	public String deleteCustomer(@RequestParam("id") int id) {
		cs.deleteCustomerServ(id);
		return"redirect:/customer/list-customer";
	}
	
	@RequestMapping("/search-customer")
	public String searchCustomer(@RequestParam("firstName") String firstName, Model m) {
		
		if(firstName.trim().isEmpty()) {
			return "redirect:/customer/list-customer";
		}else {

			List<Customer> cList = cs.searchCustomerByNameCustomerServ(firstName);
			m.addAttribute("cList",cList);
			return "CustomerList";
		}
		
	}
	
}
