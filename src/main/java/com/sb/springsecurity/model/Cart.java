package com.sb.springsecurity.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by sbogdanschi on 23/05/2017.
 */
@Entity
@Data
@Table(name = "cart")
@NoArgsConstructor
public class Cart implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "is_approved")
    private boolean isApproved;

    @OneToOne
    @JoinColumn(name = "piece_id")
    private CarPiece product;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;
}
