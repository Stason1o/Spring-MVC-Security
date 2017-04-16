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

    public User findBySSO(String sso) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("ssoId", sso));
        return (User) criteria.uniqueResult();
    }

    @Override
    public void save(User user) {
        persist(user);
    }

    @Override
    public boolean isEmailInDatabase(String email) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("email", email));
        return criteria.uniqueResult() != null;
    }
}
