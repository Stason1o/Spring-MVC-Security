package com.sb.springsecurity.validators.constraints;

import com.sb.springsecurity.validators.CustomEmailValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.RetentionPolicy.RUNTIME;

/**
 * Created by Stanislav Bogdanschi on 16.04.2017.
 */
@Target({ElementType.TYPE, ElementType.FIELD, ElementType.ANNOTATION_TYPE})
@Retention(RUNTIME)
@Constraint(validatedBy = CustomEmailValidator.class)
@Documented
public @interface ValidEmail {
    String message() default "Ivalid email";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
