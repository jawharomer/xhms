<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<div>
	<div class="py-2">
		<h3>Patient Visits</h3>
	</div>

	<div>
		<form action="<c:url value="/patientVisits"/>">
			<table>
				<tr>
					<td class="text-left">From</td>
					<td><input readonly="readonly" class="form-control" id="from"
						name="from"
						value="<fmt:formatDate pattern = "yyyy-MM-dd"  
         value = "${from}" />" /></td>
				</tr>

				<tr>
					<td class="text-left">To</td>
					<td><input readonly="readonly" class="form-control" id="to"
						name="to"
						value="<fmt:formatDate pattern = "yyyy-MM-dd"  
         value = "${to}" />" /></td>
				</tr>
				<tr>
					<td><input class="btn btn-outline-info" type="submit"
						value="View" /></td>
				</tr>
			</table>
		</form>
	</div>

	<hr>


	<table id="patient-visits-table" class="display nowrap">
		<thead>
			<tr>
				<th>VID</th>
				<th>PID</th>
				<th>Full Name</th>
				<th>Phone</th>
				<th>Total Price</th>
				<th>Discount Type</th>
				<th>Discount Amount</th>
				<th>Total Payment</th>
				<th class="cus-not-export">F</th>
			</tr>
		</thead>
		<tbody>

			<c:set var="sumTotalPayment" value="${0}" />
			<c:forEach items="${patientVisits}" var="item">
				<tr>
					<td>${item.id }</td>
					<td>${item.patient.id}</td>
					<td>${item.patient.fullName}</td>
					<td>${item.patient.phone}</td>
					<td>${item.totalPrice}</td>
					<td>${item.discountType}</td>
					<td>${item.discountAmount}</td>
					<td><fmt:formatNumber value="${item.totalPayment}"
							maxFractionDigits="3" /></td>
					<td>
						<button class="btn btn-sm btn-danger"
							onclick="deletePatientVisit(${item.id})">
							<i class="fa fa-times"></i>
						</button> <a href="<c:url value="/patientVisits/edit/"/>${item.id}"
						class="btn btn-sm btn-warning"> <i class="fa fa-edit"></i>
					</a>

					</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<th>VID</th>
				<th>PID</th>
				<th>Full Name</th>
				<th>Phone</th>
				<th>Total Price</th>
				<th>Discount Type</th>
				<th>Discount Amount</th>
				<th>Total Payment</th>
				<th class="cus-not-search">&nbsp;</th>
			</tr>
		</tfoot>
	</table>

	<div class="p-2 border-top">
		Sum Total Price=
		<fmt:formatNumber value="${sumTotalPrice}" maxFractionDigits="3" />
	</div>

</div>