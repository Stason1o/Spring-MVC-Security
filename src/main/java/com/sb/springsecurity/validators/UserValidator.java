package com.sb.springsecurity.validators;

import com.sb.springsecurity.model.User;
import com.sb.springsecurity.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


/**
 * Created by Stanislav Bogdanschi on 16.04.2017.
 */
@Component
public class UserValidator implements Validator {

    private static final String EMAIL_REGEX = "^(?!\\.)(([^\\r\\\\]|\\\\[\\r\\\\])*|([-a-z0-9!#$%&'*+/=?^_`{|}~]|(?<!\\.)\\.)*)(?<!\\.)@[a-z0-9][\\w.-]*[a-z0-9]\\.[a-z][a-z.]*[a-z]$";

    @Autowired
    private UserService userService;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "Required");
        if(user.getFirstName().length() < 2 || user.getFirstName().length() > 32){
            errors.rejectValue("firstName", "Size.userForm.firstName");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "Required");
        if(user.getLastName().length() < 2 || user.getLastName().length() > 32){
            errors.rejectValue("lastName", "Size.userForm.lastName");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "Required");
        if(userService.findByEmail(user.getEmail()) != null){
            errors.rejectValue("email", "Duplicate.userForm.email");
        }

        if(!user.getEmail().matches(EMAIL_REGEX)){
            errors.rejectValue("email", "Wrong.userFrom.email");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "Required");
        if(user.getUsername().length() < 8 || user.getUsername().length() > 32) {
            errors.rejectValue("username", "Size.userFrom.username");
        }

        if(userService.findByUsername(user.getUsername()) != null){
            errors.rejectValue("username", "Duplicate.userForm.username");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "Required");
        if(user.getPassword().length() < 8 || user.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.userForm.password");
        }

        if(!user.getConfirmPassword().equals(user.getPassword())) {
            errors.rejectValue("confirmPassword", "Different.userForm.password");
        }
    }
}
