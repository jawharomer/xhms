package com.joh.xhms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joh.xhms.dao.ReportDAO;
import com.joh.xhms.domain.model.NotificationD;

@Service
public class ReportServiceImpl implements ReportService {
	@Autowired
	private ReportDAO reportDAO;

	@Override
	public List<NotificationD> findAdminNotifications() {
		return reportDAO.findAdminNotifications();
	}

	@Override
	public List<String> findAllChronicDisease() {
		return reportDAO.findAllChronicDisease();
	}

}
