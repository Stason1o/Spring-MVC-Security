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
@Repository("carPieceDao")
public class CarPieceDaoImpl implements CarPieceDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void addCarPiece(CarPiece carPiece) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(carPiece);
    }

    public void updateCarPiece(CarPiece carPiece) {
        Session session = this.sessionFactory.getCurrentSession();

        session.update(carPiece);
    }

    public List<CarPiece> listCarPieces() {
        Session session = this.sessionFactory.getCurrentSession();
        List list = session.createCriteria(CarPiece.class).list();
        list.forEach(System.out::println);

        return list;
    }

    public CarPiece gerCarPieceById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        CarPiece carPiece = (CarPiece) session.get(CarPiece.class, id);

        return carPiece;
    }

    public void removeCarPiece(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        CarPiece carPiece = (CarPiece) session.load(CarPiece.class, id);
        if (carPiece != null) {
            session.delete(carPiece);
        }
    }
}
