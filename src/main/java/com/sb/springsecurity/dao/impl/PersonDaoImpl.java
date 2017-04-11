package com.sb.springsecurity.dao.impl;

import com.sb.springsecurity.dao.PersonDao;
import com.sb.springsecurity.model.Person;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by sbogdanschi on 11/04/2017.
 */
@Repository("personDao")
public class PersonDaoImpl implements PersonDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void addPerson(Person p) {
        System.out.println(p.getName());
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(p);

    }

    public void updatePerson(Person p) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(p);
    }

    public List<Person> listPersons() {
        Session session = this.sessionFactory.getCurrentSession();
        List list = session.createCriteria(Person.class).list();
        list.forEach(System.out::println);

        return list;
    }

    public Person getPersonById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        return (Person) session.load(Person.class, id);
    }

    public void removePerson(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Person person = (Person) session.load(Person.class, id);
        if(person != null){
            session.delete(person);
        }
    }
}
