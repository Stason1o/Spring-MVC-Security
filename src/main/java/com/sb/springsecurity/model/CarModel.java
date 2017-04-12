package com.sb.springsecurity.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Stanislav Bogdanschi on 12.04.2017.
 */
@Data @NoArgsConstructor
@Entity @Table(name = "car_models")
public class CarModel implements Serializable{

    @Id @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "air_conditioner")
    private boolean hasAirConditioner;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id")
    private Year year;
}
