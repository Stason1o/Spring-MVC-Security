package com.sb.springsecurity.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by Stanislav Bogdanschi on 12.04.2017.
 */
@Data @NoArgsConstructor
@Entity @Table(name = "years")
public class Year implements Serializable {

    @Id @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "year")
    private int year;

    @OneToOne(mappedBy = "year")
    private CarModel carModel;
}
