<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<script type="text/javascript">
	var jsonPatientVisit = '${jsonPatientVisit}';
	var jsonExaminations = '<spring:escapeBody  javaScriptEscape="true">${jsonExaminations}</spring:escapeBody>';
</script>

<div id="add-patient-visit-contaner" ng-app="addPatientVisit"
	ng-controller="addPatientVisit" ng-init="init()">
	<h3 class="text-success">Add Patient Visit</h3>
	<table>
		<tr>
			<td>Patient</td>
			<td>{{patientVisit.patient.fullName}} <a
				href="<c:url value="/patients/edit/"/>{{patientVisit.patient.id}} "
				class="btn btn-sm btn-warning"> <i class="fa fa-edit"></i>
			</a>
			</td>
		</tr>
	</table>

	<table id="add-patient-visit-table" class="table table-bordered"
		ng-form name="form">
		<tr>
		<tr>
			<td>Discount Type</td>
			<td><select name="discountType"
				class="form-control form-control-sm"
				ng-model="patientVisit.discountType">
					<option value="">Choose</option>
					<option value="User">User</option>
					<option value="Admin">Admin</option>
			</select></td>
		</tr>

		<tr>
			<td>Discount Amount</td>
			<td><input ng-disabled="!patientVisit.discountType"
				type="number" min="0" max="1" class="form-control form-control-sm"
				name="discountAmount" ng-model="patientVisit.discountAmount"></td>
		</tr>

		<tr>
			<td>Total Price</td>
			<td><input required="required" readonly="readonly"
				class="form-control form-control-sm" name="totalPrice"
				ng-value="getTotalPrice()"></td>
		</tr>

		<tr>
			<td>Total Payment</td>
			<td><input readonly="readonly"
				class="form-control form-control-sm" ng-value="getTotalPayment()"></td>
		</tr>


		<tr>
			<td>Note</td>
			<td><input class="form-control form-control-sm"
				ng-model="patientVisit.note"></td>
		</tr>


	</table>


	<div>
		<h5 class="text-info">Radiography Test</h5>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Name</th>
					<th>Price</th>
					<th>F</th>
				</tr>
				<tr ng-form name="radiographyForm">
					<th><input id="radiography-name"
						ng-model="newRadiography.name" required name="name"
						class="form-control form-control-sm"></th>
					<th><input min="0" type="number"
						ng-model="newRadiography.price" required name="price"
						class="form-control form-control-sm"></th>
					<th>
						<button ng-disabled="radiographyForm.$invalid"
							class="btn btn-sm btn-success rounded-circle"
							ng-click="addRadiography()">
							<i class="fa fa-plus"></i>
						</button>
					</th>
				</tr>

			</thead>
			<tbody>
				<tr ng-repeat="item in patientVisit.radiographies">
					<td>{{item.name}}</td>
					<td>{{item.price}}</td>
					<td>
						<button class="btn btn-sm btn-danger rounded-circle"
							ng-click="deleteRadiography(item.id)">
							<i class="fa fa-times"></i>
						</button>
					</td>
				</tr>
			</tbody>
		</table>

	</div>

	<button class="btn btn-success" ng-click="save()"
		ng-disabled="form.$invalid">
		<i class="fa fa-save"></i>
	</button>

</div>
