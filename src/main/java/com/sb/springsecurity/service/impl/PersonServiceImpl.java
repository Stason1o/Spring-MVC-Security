package com.sb.springsecurity.service.impl;

import com.sb.springsecurity.dao.PersonDao;
import com.sb.springsecurity.model.Person;
import com.sb.springsecurity.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by sbogdanschi on 11/04/2017.
 */
@Service("personService")
public class PersonServiceImpl implements PersonService {

    @Autowired
    private PersonDao personDao;

    /*@Autowired
    public PersonServiceImpl(PersonDao personDao) {
        this.personDao = personDao;
    }*/

    @Override
    @Transactional
    public void addPerson(Person p) {
        this.personDao.addPerson(p);
    }

    @Override
    @Transactional
    public void updatePerson(Person p) {
        System.out.println("In method PersonServiceImpl.updatePerson!!!!!! " + p.getName()  + " " + p.getCountry());
        this.personDao.updatePerson(p);
    }

    @Override
    @Transactional
    public List<Person> listPersons() {
        return this.personDao.listPersons();
    }

    @Override
    @Transactional
    public Person getPersonById(int id) {
       // System.out.println("In method PersonServiceImpl.getPersonById!!!!!! " + personDao.getPersonById(id));
        return this.personDao.getPersonById(id);
    }

    @Override
    @Transactional
    public void removePerson(int id) {
        this.personDao.removePerson(id);
    }
}
