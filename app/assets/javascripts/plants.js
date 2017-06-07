$(document).on('turbolinks:load', function() {


	$(".listboxChange").change(function() {
		
    window.location = "/?plant=" + $(this).val();
	})

	$("#filter_matirial_requiements").click(function() {
		var date = $('#filter_date__1i').val()+'-'+$('#filter_date__2i').val()+'-'+$('#filter_date__3i').val();
		var item_type = $('.material_requirements_item_type_filter').val();
		var only_red = $('.material_requirements_only_red_filter').is(':checked');
    	window.location = "?plants=" + $('.material_requirements_plants_filter').val() + "&date="+date+'&item_type='+item_type+'&only_red='+only_red;
	})


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
	  $.ajax({
	    url: "/plants/region_plants",
	    type: "GET",
	    data: {"region" : $('#region_select option:selected').val(),
	  	"user" : $('#user option:selected').val()
	  	}
	  })
	});
})




