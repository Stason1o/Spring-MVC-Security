package com.sb.springsecurity.service;

import com.sb.springsecurity.model.CarPiece;

import java.util.List;

/**
 * Created by sbogdanschi on 11/04/2017.
 */
public interface CarPieceService {
    void addCarPiece(CarPiece p);

    void updateCarPiece(CarPiece p);

    List<CarPiece> listCarPieces();

    CarPiece getCarPieceById(int id);

    void removeCarPiece(int id);
}
