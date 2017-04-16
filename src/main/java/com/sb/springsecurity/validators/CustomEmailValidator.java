package com.sb.springsecurity.validators;

import com.sb.springsecurity.validators.constraints.ValidEmail;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Stanislav Bogdanschi on 16.04.2017.
 */
public class CustomEmailValidator implements ConstraintValidator<ValidEmail, String> {

    private Pattern pattern;
    private Matcher matcher;
    private static final String EMAIL_REGEX = "^[_A-Za-z0-9-+]+ (.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(.[A-Za-z0-9]+)*(.[A-Za-z]{2,})$";
    @Override
    public void initialize(ValidEmail validEmail) {
    }

    @Override
    public boolean isValid(String email, ConstraintValidatorContext constraintValidatorContext) {
        return (validateEmail(email));
    }

    private boolean validateEmail(String email){
        pattern = Pattern.compile(EMAIL_REGEX);
        matcher = pattern.matcher(email);
        return matcher.matches();
    }
}
