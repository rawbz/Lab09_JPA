package dataaccess;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import models.Role;
import models.User;

/**
 *
 * @author mikep
 */
public class RoleDB {
    
    public List<Role> getAll() throws Exception{
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        
        try {
            List<Role> roles = em.createNamedQuery("Role.findAll", Role.class).getResultList();
            System.out.println("returned roles");
            return roles;
            
        } finally {
            em.close();
        }

        
    }

    public Role get(int roleId) throws Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
        try {
            Role role = em.find(Role.class, roleId);
            System.out.println("in RoleDB - found the role");
            System.out.println(role);
            return role;
            
        } finally {
            em.close();
        }
 
    }

}
