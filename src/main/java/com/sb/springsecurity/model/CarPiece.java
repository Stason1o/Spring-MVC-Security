package com.sb.springsecurity.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/**
 * Created by sbogdanschi on 11/04/2017.
 */
@Data
@NoArgsConstructor
@Entity
@Table(name = "car_pieces")
public class CarPiece {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "car")
    private String car;

    @Column(name = "car_model")
    private String carModel;

    @Column(name = "car_year")
    private Integer carYear;

    @Column(name = "height")
    private Integer height;

    @Column(name = "width")
    private Integer width;

    @Column(name = "thickness")
    private Integer thickness;

    @Column(name = "identity_number")
    private String originalNumber;

    @Column(name = "air_conditioner")
    private Boolean airConditioner;

    @Column(name = "engine_name")
    private String engineName;

    @Column(name = "engine_volume")
    private String engineVolume;

    @Column(name = "transmission_type")
    private String transmissionType;

    @Column(name = "fuel_type")
    private String fuelType;

    @Column(name = "instock")
    private Integer inStock;

    @Column(name = "price")
    private Double price;

    @Column(name = "photo")
    private String photo;

}
