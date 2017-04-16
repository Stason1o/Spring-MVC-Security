package com.sb.springsecurity.validators.constraints;

import com.sb.springsecurity.validators.PasswordMatchValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

/**
 * Created by Stanislav Bogdanschi on 16.04.2017.
 */
@Target({ElementType.ANNOTATION_TYPE, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = PasswordMatchValidator.class)
@Documented
public @interface PasswordMatcher {
    String message() default "Password don't match";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
