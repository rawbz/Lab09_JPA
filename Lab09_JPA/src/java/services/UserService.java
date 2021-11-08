
package services;

import dataaccess.RoleDB;
import dataaccess.UserDB;
import java.util.List;
import models.Role;
import models.User;

public class UserService {
    
     public List<User> getAll() throws Exception {
        System.out.println("In the User Service - get all method");
        UserDB userDB = new UserDB();
        List<User> users = userDB.getAll();
        return users;
        
    }
      
    public void insert(String email, boolean active, String firstname, String lastname, String password, int roleId) throws Exception{
        User user = new User(email, active, firstname, lastname, password);
        RoleDB roleDB = new RoleDB();
        Role role = roleDB.get(roleId);
        user.setRole(role);
        
        UserDB userDB = new UserDB();
        userDB.insert(user);
        System.out.println("In user service - inserted new user");

    }
    
    public void delete(String email) throws Exception {
        User user = new User();
        user.setEmail(email);
        UserDB userDB = new UserDB();
        userDB.delete(user);
    }
    
    public User get(String email) throws Exception {
        UserDB userDB = new UserDB();
        User user = userDB.get(email);
        return user;
    }
    
    public void update(String email, boolean active, String firstname, String lastname, String password, int roleId) throws Exception {
        UserDB userDB = new UserDB();
        User user = userDB.get(email);
        user.setEmail(email);
        user.setActive(active);
        user.setFirstName(firstname);
        user.setLastName(lastname);
        user.setPassword(password);
        
        RoleDB roleDB = new RoleDB();
        Role role = roleDB.get(roleId);
        
        user.setRole(role);
        
        userDB.update(user);
    }


}
