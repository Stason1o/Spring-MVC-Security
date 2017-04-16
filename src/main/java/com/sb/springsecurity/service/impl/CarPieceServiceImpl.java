package com.sb.springsecurity.service.impl;

import com.sb.springsecurity.dao.CarPieceDao;
import com.sb.springsecurity.model.CarPiece;
import com.sb.springsecurity.service.CarPieceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by sbogdanschi on 11/04/2017.
 */
@Service("personService")
@Transactional
public class CarPieceServiceImpl implements CarPieceService {

    @Autowired
    private CarPieceDao carPieceDao;

    /*@Autowired
    public CarPieceServiceImpl(CarPieceDao carPieceDao) {
        this.carPieceDao = carPieceDao;
    }*/

    @Override
    public void addPerson(CarPiece p) {
        this.carPieceDao.addPerson(p);
    }

    @Override
    public void updatePerson(CarPiece p) {
        //System.out.println("In method CarPieceServiceImpl.updatePerson!!!!!! " + p.getName()  + " " + p.getCountry());
        this.carPieceDao.updatePerson(p);
    }

    @Override
    public List<CarPiece> listPersons() {
        return this.carPieceDao.listPersons();
    }

    @Override
    public CarPiece getPersonById(int id) {
        // System.out.println("In method CarPieceServiceImpl.getPersonById!!!!!! " + carPieceDao.getPersonById(id));
        return this.carPieceDao.getPersonById(id);
    }

    @Override
    public void removePerson(int id) {
        this.carPieceDao.removePerson(id);
    }
}
