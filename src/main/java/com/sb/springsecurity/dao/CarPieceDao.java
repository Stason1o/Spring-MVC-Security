package com.sb.springsecurity.dao;

import com.sb.springsecurity.model.CarPiece;

import java.util.List;

/**
 * Created by sbogdanschi on 11/04/2017.
 */
public interface CarPieceDao {
    void addCarPiece(CarPiece p);

    void updateCarPiece(CarPiece p);

    List listCarPieces();

    CarPiece gerCarPieceById(int id);

    void removeCarPiece(int id);

    List<CarPiece> listTopTenCarPieces();
}
