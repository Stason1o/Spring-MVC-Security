package com.sb.springsecurity.dao;

import com.sb.springsecurity.model.Person;

import java.util.List;

/**
 * Created by sbogdanschi on 11/04/2017.
 */
public interface PersonDao {
    void addPerson(Person p);
    void updatePerson(Person p);
    List<Person> listPersons();
    Person getPersonById(int id);
    void removePerson(int id);
}