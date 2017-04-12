package com.sb.springsecurity.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Stanislav Bogdanschi on 12.04.2017.
 */
@Data @NoArgsConstructor
@Entity @Table(name = "car_engines")
public class CarEngine implements Serializable {

    @Id @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @NonNull @Column(name = "name")
    private String name;

    @NonNull @Column(name = "volume")
    private String volume;

    //TODO OneToOne connection
}
