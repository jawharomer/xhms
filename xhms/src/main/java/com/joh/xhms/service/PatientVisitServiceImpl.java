package com.joh.xhms.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joh.xhms.dao.PatientVisitDAO;
import com.joh.xhms.model.PatientVisit;

@Service
public class PatientVisitServiceImpl implements PatientVisitService {

	@Autowired
	private PatientVisitDAO patientVisitDAO;
	

	@Override
	public PatientVisit save(PatientVisit patientVisit) {
		return patientVisitDAO.save(patientVisit);

	}

	@Override
	public List<PatientVisit> findAllByTimeBetween(Date from, Date to) {
		return patientVisitDAO.findAllByTimeBetween(from, to);

	}

	@Override
	public PatientVisit findOne(int id) {
		return patientVisitDAO.findOne(id);

	}
	
	@Override
	public void delete(int id) {
		 patientVisitDAO.delete(id);
	}

}
