package com.sara.java_belt.validator;

import org.springframework.validation.Validator;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import com.sara.java_belt.models.User;

@Component
public class UserValidator implements Validator {
    

    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }
    

    @Override
    public void validate(Object target, Errors errors) {
        User user = (User) target;
        
        if (!user.getPasswordConfirmation().equals(user.getPassword())) {
            errors.rejectValue("passwordConfirmation", "Match", "The Confirm Password must match Password!");
        }         
    }
}
