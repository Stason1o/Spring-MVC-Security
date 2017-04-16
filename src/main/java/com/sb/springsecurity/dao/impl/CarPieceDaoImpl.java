package com.sb.springsecurity.dao.impl;

import com.sb.springsecurity.dao.CarPieceDao;
import com.sb.springsecurity.model.CarPiece;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by sbogdanschi on 11/04/2017.
 */
@Repository("personDao")
public class CarPieceDaoImpl implements CarPieceDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void addPerson(CarPiece p) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(p);
    }

    public void updatePerson(CarPiece p) {
        Session session = this.sessionFactory.getCurrentSession();

        session.update(p);
    }

    public List<CarPiece> listPersons() {
        Session session = this.sessionFactory.getCurrentSession();
        List list = session.createCriteria(CarPiece.class).list();
        list.forEach(System.out::println);

        return list;
    }

    public CarPiece getPersonById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        CarPiece person = (CarPiece) session.get(CarPiece.class, id);

        return person;
    }

    public void removePerson(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        CarPiece person = (CarPiece) session.load(CarPiece.class, id);
        if (person != null) {
            session.delete(person);
        }
    }
}
