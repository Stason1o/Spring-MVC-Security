package com.sb.springsecurity.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.io.Serializable;

/**
 * Created by Stanislav Bogdanschi on 12.04.2017.
 */
@Data @NoArgsConstructor
@Entity @Table(name = "car_pieces")
public class CarPiece implements Serializable {

    @Id @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "price")
    private double price;

    @Column(name = "instock")
    private int inStock;

    @Column(name = "height")
    private int height;

    @Column(name = "width")
    private int width;

    @Column(name = "thickness")
    private int thickness;

    @NonNull @Column(name = "identity_number")
    private String identityNumber;

    @Column(name = "description")
    @Size(min = 20, max = 200)
    private String description;

    //TODO OneToOne connection

    //TODO Create or no class PieceDetails?
}
