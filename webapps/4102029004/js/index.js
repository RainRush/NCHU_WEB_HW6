/**
 * 
 */

var allow = "<span style='color:green'><i class='fa fa-check'></i>Allowed to use!</span>";
var reject = "<span style='color:red'><i class='fa fa-close'></i>Used by someone else!</span>";
var empty = "<span style='color:red'>Must have value!</span>";

$("#name").blur(function() {
	if($(this).val().length == 0) {
		$('#name').addClass('inputReject');
		$('#name').removeClass('inputAllow');
		$('#checkNameMessage').html(empty);
	} else {
		var inputName = $("#name").val();
		$.post('checkAjax.jsp',
				{name: inputName},
				function(response) {
					if(response.trim() == "1"){
						$('#name').addClass('inputReject');
						$('#name').removeClass('inputAllow');
						$('#checkNameMessage').html(reject);
					} else {
						$('#name').addClass('inputAllow');
						$('#name').removeClass('inputReject');
						$('#checkNameMessage').html(allow);
					}
					
				}
		);
		return false;
	}
});

$("#name").focus(function() {
	$('#name').removeClass('inputReject');
	$('#name').removeClass('inputAllow');
	$('#checkNameMessage').html("");
});
