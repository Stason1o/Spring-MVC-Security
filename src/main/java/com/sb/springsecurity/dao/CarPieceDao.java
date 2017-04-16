package com.sb.springsecurity.dao;

import com.sb.springsecurity.model.CarPiece;

import java.util.List;

/**
 * Created by sbogdanschi on 11/04/2017.
 */
public interface CarPieceDao {
    void addPerson(CarPiece p);

    void updatePerson(CarPiece p);

    List<CarPiece> listPersons();

    CarPiece getPersonById(int id);

    void removePerson(int id);
}
