package com.sb.springsecurity.validators;

import com.sb.springsecurity.model.User;
import com.sb.springsecurity.validators.constraints.PasswordMatcher;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
 * Created by Stanislav Bogdanschi on 16.04.2017.
 */
public class PasswordMatchValidator implements ConstraintValidator<PasswordMatcher, Object> {

    @Override
    public void initialize(PasswordMatcher passwordMatcher) {

    }

    @Override
    public boolean isValid(Object o, ConstraintValidatorContext constraintValidatorContext) {
        User user = (User) o;
        return false; //user.getPassword().equals(user.getConfirmPassword());
    }
}
