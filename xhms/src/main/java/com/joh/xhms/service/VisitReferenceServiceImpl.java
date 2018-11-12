package com.joh.xhms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joh.xhms.dao.VisitReferenceDAO;
import com.joh.xhms.model.VisitReference;

@Service
public class VisitReferenceServiceImpl implements VisitReferenceService {

	@Autowired
	private VisitReferenceDAO visitReferenceDAO;

	@Override
	public Iterable<VisitReference> findAll() {
		return visitReferenceDAO.findAll();
	}
}
