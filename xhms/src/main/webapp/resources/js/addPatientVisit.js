// Angular
app = angular.module("addPatientVisit", []);

app.controller('addPatientVisit', function($scope, $http) {

	$scope.patientVisit = {};

	$scope.newRadiography = {
		name : "",
		price : ""
	};

	$scope.resetNewRadiography = angular.copy($scope.newRadiography);

	$scope.init = function() {
		console.log("init->fired");
		console.log("jsonPatientVisit=" + jsonPatientVisit);
		$scope.patientVisit = JSON.parse(jsonPatientVisit);

	};

	$scope.$watch('patientVisit.discountType', function() {
		if (!$scope.patientVisit.discountType) {
			$scope.patientVisit.discountAmount = "";
		}
	});

	$scope.getTotalPrice = function() {
		console.log("totalPrice->fired");
		var totalPrice = 0;
		for (var i = 0; i < $scope.patientVisit.radiographies.length; i++) {
			var price = $scope.patientVisit.radiographies[i].price;
			totalPrice += price;
		}
		$scope.patientVisit.totalPrice = totalPrice;
		return totalPrice;
	};

	$scope.getTotalPayment = function() {
		var totalPayment = 0;
		if ($scope.patientVisit.discountAmount
				&& $scope.patientVisit.totalPrice) {
			var x = $scope.patientVisit.discountAmount
					* $scope.patientVisit.totalPrice;
			totalPayment = $scope.patientVisit.totalPrice - x;
		} else {
			totalPayment = $scope.patientVisit.totalPrice;
		}
		$scope.patientVisit.totalPayment = totalPayment;
		return totalPayment;

	}

	// S-Examination
	$scope.addRadiography = function() {
		console.log("addRadiography->fired");

		$scope.patientVisit.radiographies.push($scope.newRadiography);
		$scope.newRadiography = angular.copy($scope.resetNewRadiography);
	}
	$scope.deleteRadiography = function(index) {
		$scope.patientVisit.radiographies.splice(index, 1);
	}

	// E-Examination

	$scope.save = function() {
		console.log("save->fired");

		console.log("$scope.patientVisit=", $scope.patientVisit);

		$http({
			method : 'POST',
			data : $scope.patientVisit,
			url : $$ContextURL + '/patientVisits/add'
		}).then(
				function(response) {
					console.log(response);
					if (response.data.status == 200) {
						$("#modal-body").html(response.data.message);
						$("#modal").modal("show");
						setTimeout(function() {
							window.location.href = $$ContextURL
									+ '/patientVisits/edit/'
									+ response.data.etc;
						}, 1000);

					}
				}, function(response) {
					$("#modal-body").html(response.data);
					$("#modal").modal("show");
				});

	}

});
