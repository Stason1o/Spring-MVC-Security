package com.sb.springsecurity.validators;

import com.sb.springsecurity.model.CarPiece;
import com.sb.springsecurity.service.CarPieceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Created by sbogdanschi on 18/04/2017.
 */
@Component
public class CarPieceValidator implements Validator {

    @Autowired
    private CarPieceService carPieceService;

    private static final String MANUAL = "manual";
    private static final String AUTOMATIC = "automatic";
    private static final String BENZINE = "benzine";
    private static final String DIESEL = "diesel";
    private static final String GAZ = "gaz";

    @Override
    public boolean supports(Class<?> aClass) {
        return CarPiece.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        CarPiece carPiece = (CarPiece) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "Required");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "car", "Required");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "carModel", "Required");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "carYear", "Required");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "originalNumber", "Required");

        if (!(carPiece.getTransmissionType().equals(MANUAL) ||
                carPiece.getTransmissionType().equals(AUTOMATIC) ||
                carPiece.getTransmissionType() == null)) {
            errors.rejectValue("transmissionType", "Wrong.carPieceForm.transmissionType");
        }

        if (!(carPiece.getFuelType().equals(BENZINE) ||
                carPiece.getFuelType().equals(DIESEL) ||
                carPiece.getFuelType().equals(GAZ) ||
                carPiece.getFuelType() == null)) {
            errors.rejectValue("fuelType", "Wrong.carPieceFrom.fuelType");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "inStock", "Required");
        if (carPiece.getInStock() == null) {
            errors.rejectValue("inStock", "Required");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price", "Required");
        if (carPiece.getPrice() == null) {
            errors.rejectValue("price", "Required");
        }
    }
}
