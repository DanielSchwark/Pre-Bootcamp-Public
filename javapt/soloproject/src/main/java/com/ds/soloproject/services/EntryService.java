package com.ds.soloproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ds.soloproject.models.Entry;
import com.ds.soloproject.repositories.EntryRepository;



@Service
public class EntryService {

	@Autowired
	private EntryRepository repo;
	
	public Entry findById(Long id) {
		
		Optional<Entry> result = repo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		
		return null;
	}
	

	public List<Entry> all() {
		return repo.findAll();
	}
	
	public Entry update(Entry entry) {
		return repo.save(entry);
	}
	
	public Entry create(Entry entry) {
		return repo.save(entry);
	}
	
	public void delete(Entry entry) {
		repo.delete(entry);
	}

}