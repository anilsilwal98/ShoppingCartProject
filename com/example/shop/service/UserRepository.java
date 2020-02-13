package example.shop.service;

import java.util.ArrayList;
import java.util.List;
import example.shop.entity.User;

public class UserRepository {
	private List<User> userList;

	public void add(int id, String name, String username, String password) {
		
		for (User user: this.userList ){
			if (user.getUsername().equalsIgnoreCase(username)) {
				System.out.println("Already Used Username!!");
			}
		}
		User user = new User();
		user.setId(id);
		user.setName(name);
		user.setUsername(username);
		user.setPassword(password);
		this.userList.add(user);
	}

	public  UserRepository() {
		this.userList = new ArrayList<>();
		this.add(1, "Rajesh Bhuju", "rajesh", "rajesh@123");
		this.add(2, "Anil Silwal",  "silwal", "silwal@123");
	}
	
	public List<User> getUsers(){
		return this.userList;
	}

}
