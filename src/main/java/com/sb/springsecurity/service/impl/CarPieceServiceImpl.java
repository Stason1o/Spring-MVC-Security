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
@Service("carPieceService")
@Transactional
public class CarPieceServiceImpl implements CarPieceService {

    @Autowired
    private CarPieceDao carPieceDao;

    @Override
    public void addCarPiece(CarPiece p) {
        this.carPieceDao.addCarPiece(p);
    }

    @Override
    public void updateCarPiece(CarPiece p) {
        this.carPieceDao.updateCarPiece(p);
    }

    @Override
    public List<CarPiece> listCarPieces() {
        return this.carPieceDao.listCarPieces();
    }

    @Override
    public CarPiece getCarPieceById(int id) {
        return this.carPieceDao.gerCarPieceById(id);
    }

    @Override
    public void removeCarPiece(int id) {
        this.carPieceDao.removeCarPiece(id);
    }
}
