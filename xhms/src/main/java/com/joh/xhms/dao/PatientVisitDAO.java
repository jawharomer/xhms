package com.joh.xhms.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.joh.xhms.model.PatientVisit;

public interface PatientVisitDAO extends CrudRepository<PatientVisit, Integer> {

	List<PatientVisit> findAllByTimeBetween(Date from, Date to);

}
