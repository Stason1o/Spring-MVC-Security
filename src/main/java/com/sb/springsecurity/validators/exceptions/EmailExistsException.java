package com.sb.springsecurity.validators.exceptions;

/**
 * Created by Stanislav Bogdanschi on 16.04.2017.
 */
@SuppressWarnings("serial")
public class EmailExistsException extends Throwable {

    public EmailExistsException(final String string){
        super(string);
    }
}
