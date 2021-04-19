package com.sara.java_belt.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.sara.java_belt.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {

    User findByEmail(String email);
}
