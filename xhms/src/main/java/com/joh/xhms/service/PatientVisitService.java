package com.joh.xhms.service;

import java.util.Date;
import java.util.List;

import com.joh.xhms.model.PatientVisit;

public interface PatientVisitService {

	PatientVisit save(PatientVisit patientVisit);


	PatientVisit findOne(int id);

	List<PatientVisit> findAllByTimeBetween(Date from, Date to);


	void delete(int id);

}
