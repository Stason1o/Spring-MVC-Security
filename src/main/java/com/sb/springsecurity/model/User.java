package com.sb.springsecurity.model;

import com.sb.springsecurity.model.enums.State;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Data
@NoArgsConstructor
@Entity
@Table(name = "APP_USER")
//@PasswordMatcher
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

//    @NotNull
//    @NotEmpty
    @Column(name = "SSO_ID", unique = true, nullable = false)
    private String ssoId;

//    @NotNull
//    @NotEmpty
    @Column(name = "PASSWORD", nullable = false)
    private String password;

//    @Transient
//    private String confirmPassword;
//
//    @NotNull
//    @NotEmpty
    @Column(name = "FIRST_NAME", nullable = false)
    private String firstName;

//    @NotNull
//    @NotEmpty
    @Column(name = "LAST_NAME", nullable = false)
    private String lastName;

//    @NotNull
//    @NotEmpty
//    @ValidEmail
    @Column(name = "EMAIL", nullable = false)
    private String email;

    @Column(name = "STATE", nullable = false)
    private String state = State.ACTIVE.getState();

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "APP_USER_USER_PROFILE",
            joinColumns = {@JoinColumn(name = "USER_ID")},
            inverseJoinColumns = {@JoinColumn(name = "USER_PROFILE_ID")})
    private Set<UserProfile> userProfiles = new HashSet<UserProfile>();
//
//    public String getConfirmPassword() {
//        return confirmPassword;
//    }
//
//    public void setConfirmPassword(String confirmPassword) {
//        this.confirmPassword = confirmPassword;
//    }
}
