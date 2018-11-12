package com.joh.xhms.service;

import java.util.List;

import com.joh.xhms.domain.model.NotificationD;

public interface ReportService {

	List<NotificationD> findAdminNotifications();

	List<String> findAllChronicDisease();

}
