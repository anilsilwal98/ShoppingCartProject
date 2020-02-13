package example.shop.service;

import example.shop.entity.User;

public class AuthenticationService {
	
	// if succeed returns a user	
	public User checkLogin(UserRepository userList, String username, String password) {
		if (username == null || password == null) {
			return null;
		}
		
		for(User user: userList.getUsers()) {
			if (user.getUsername().equalsIgnoreCase(username) && user.getPassword().equalsIgnoreCase(password) ) {
				return user;
			}
		}
		return null;
	}
	
}
