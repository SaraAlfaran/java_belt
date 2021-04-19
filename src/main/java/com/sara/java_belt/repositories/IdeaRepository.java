package com.sara.java_belt.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.sara.java_belt.models.Idea;

@Repository
public interface IdeaRepository extends CrudRepository<Idea, Long> {
    
    Iterable<Idea> findAllByOrderByLikesAsc();
    Iterable<Idea> findAllByOrderByLikesDesc();
}
