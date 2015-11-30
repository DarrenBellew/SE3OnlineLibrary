package service.islarf6546.com;

import business.islarf6546.com.User;
import dao.islarf6546.com.UserDao;
import exceptions.islarf6546.com.DaoException;

public class UserService {

	UserDao dao = new UserDao();
	
	public User login(String username, String password){
		
		User u = null;
		try {			
			u = dao.findUserByUsernamePassword(username, password);
		} 
		catch (DaoException e) {
			e.printStackTrace();
		}
		return u;
		
	}
	
}