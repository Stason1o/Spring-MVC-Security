package com.sb.springsecurity.dao.impl;

import com.sb.springsecurity.dao.CarPieceDao;
import com.sb.springsecurity.model.CarPiece;
import org.hibernate.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by sbogdanschi on 11/04/2017.
 */
@Repository("carPieceDao")
public class CarPieceDaoImpl implements CarPieceDao {

    private static final int PAGE_SIZE = 10;

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

        return list;
    }

    public CarPiece gerCarPieceById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        return (CarPiece) session.get(CarPiece.class, id);
    }

    public void removeCarPiece(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        CarPiece carPiece = (CarPiece) session.load(CarPiece.class, id);
        if (carPiece != null) {
            session.delete(carPiece);
        }
    }

    @Override
    public List<CarPiece> listTopTenCarPieces() {
        Session session = this.sessionFactory.getCurrentSession();
        String hql = "FROM CarPiece cp order by cp.name";
        Query query = session.createQuery(hql);

        ScrollableResults scrollableResults = query.scroll(ScrollMode.FORWARD_ONLY);
        scrollableResults.first();
        scrollableResults.scroll(0);
        List<CarPiece> carPieces = new ArrayList<>();
        int i = 0;
        while (PAGE_SIZE > i++){
            carPieces.add((CarPiece) scrollableResults.get(0));
            if(!scrollableResults.next())
                break;
        }
//        Criteria criteria = session.createCriteria(CarPiece.class);
//        criteria.setFirstResult(0);
//        criteria.setMaxResults(PAGE_SIZE);
//        List carPieces = criteria.list();
        return carPieces;
    }
}
