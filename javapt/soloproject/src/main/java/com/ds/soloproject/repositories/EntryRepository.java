package com.ds.soloproject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ds.soloproject.models.Entry;

@Repository
public interface EntryRepository extends CrudRepository<Entry, Long> {

	List<Entry> findAll();
}