$(document).on('turbolinks:load', function() {

	$('#btnRight').click(function (e) {
		if ($('#user option:selected').val()=="") {
			alert("Select User Before plant assignment")
		}else if(!$('#lstBox1 option:selected').val()){
			alert("Select plant Before assignment")
		}else{
			$.ajax({
			  url: "/plants/assign_plants",
			  type: "POST",
			  data: {
			  	"plants" : $('#lstBox1 option:selected').val(),
			  	"user" : $('#user option:selected').val()
				}
			});
		}
	    e.preventDefault();
	});

	$('#btnAllRight').click(function (e) {
		if ($('#user option:selected').val()=="") {
			alert("Select User Before plant assignment")
		}else{
		var _options = $("select#lstBox1 option").map(function() {return $(this).val();}).get();
				$.ajax({
					  url: "/plants/assign_plants",
					  type: "POST",
					  data: {
					  	"plants" : _options,
					  	"user" : $('#user option:selected').val()
						}
					});
		}

	    // $('select').moveAllToListAndDelete('#lstBox1', '#lstBox2');
	    e.preventDefault();
	});

	$('#btnLeft').click(function (e) {
		if ($('#user option:selected').val()=="") {
			alert("Select User Before plant removal")
		}else if($('#lstBox2 option:selected').val()==""){
			alert("Select plant Before assignment")
		}
		else{
			$.ajax({
			  url: "/plants/remove_plants",
			  type: "POST",
			 data: {
			 			  	"plants" : $('#lstBox2 option:selected').val(),
			 			  	"user" : $('#user option:selected').val()
			 				}
			});
		}
	    // $('select').moveToListAndDelete('#lstBox2', '#lstBox1');
	    e.preventDefault();
	});

	$('#btnAllLeft').click(function (e) {
		if ($('#user option:selected').val()=="") {
			alert("Select User Before plant assignment")
		}else{
		var _options = $("select#lstBox1 option").map(function() {return $(this).val();}).get();

			$.ajax({
			  url: "/plants/remove_plants",
			  type: "POST",
			 data: {
			 			  	"plants" : _options,
			 			  	"user" : $('#user option:selected').val()
			 				}
			});
		}
	    // $('select').moveAllToListAndDelete('#lstBox2', '#lstBox1');
	    e.preventDefault();
	});


	$("#user").change(function(){
	  $.ajax({
	    url: "/plants/user_plants",
	    type: "GET",
	    data: {"user" : $('#user option:selected').val(),
	  	"region" : $('#region_select option:selected').text()
	  	}
	  })
	});1

	$('#region_select').change(function(){
		var text= $('#region_select option:selected').text()
		console.log("//$('#region_select option:selected').text()",$('#region_select option:selected').text())
	  $.ajax({
	    url: "/plants/region_plants",
	    type: "GET",
	    data: {"region" : $('#region_select option:selected').text(),
	  	"user" : $('#user option:selected').val()
	  	}
	  })
	});
})




