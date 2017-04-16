package com.sb.springsecurity.dao.impl;

import com.sb.springsecurity.dao.AbstractDao;
import com.sb.springsecurity.dao.UserDao;
import com.sb.springsecurity.model.User;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository("userDao")
public class UserDaoImpl extends AbstractDao<Integer, User> implements UserDao {

    public User findById(int id) {
        return getByKey(id);
    }

    public User findByUsername(String username) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("username", username));
        System.out.println(criteria.uniqueResult() + "------------------------------------------------------USER_DAO_IMPL");
        return (User) criteria.uniqueResult();
    }

    @Override
    public void save(User user) {
        persist(user);
    }

    @Override
    public User findByEmail(String email) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("email", email));
        return (User) criteria.uniqueResult();
    }
}
