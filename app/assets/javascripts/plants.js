$(document).on('turbolinks:load', function() {
	$.ajaxSetup({
	    headers: {
	        'X-CSRF-Token': $('meta[name="_token"]').attr('content')
	    }
	});

	$(".listboxChange").change(function() {
		
    window.location = "/?plant=" + $(this).val();
	})

	$("#filter_matirial_requiements").click(function() {
		var date = $('#filter_date__1i').val()+'-'+$('#filter_date__2i').val()+'-'+$('#filter_date__3i').val();
		var item_type = $('.material_requirements_item_type_filter').val();
		var only_red = $('.material_requirements_only_red_filter').is(':checked');
		window.location = "?plants=" + $('.material_requirements_plants_filter').val() + "&date="+date+'&item_type='+item_type+'&only_red='+only_red;
	});
	$('.datepicker').datepicker({format: 'yyyy-mm-dd'});
	// On change of any input field in matirial requirements page filter automatically
	$('.material_requirements_plants_filter').SumoSelect({placeholder: 'Select', selectAll: true});
	$('.selectbox').SumoSelect({placeholder: 'Select'});
	$('.sumo_plants .options li').bind('click.check', function(event) {
	    filterRequirements();
	})
	$('.mr-date-filter').on('change',function(e){
		filterRequirements();
	});
	$('.material_requirements_item_type_filter').on('change', function(event){
		filterRequirements();
	});
	$('.material_requirements_only_red_filter').on('change', function(event){
		filterRequirements();
	});

	$('#btnRight').click(function (e) {
		if ($('#user option:selected').val()=="") {
			alert("Select User Before plant assignment")
		}else if(!$('#lstBox1 option:selected').val()){
			alert("Select plant Before assignment")
		}else{
			var _options = $("select#lstBox1 option:selected").map(function() {return $(this).val();}).get();
			$.ajax({
			  url: "/plants/assign_plants",
			  type: "POST",
			  data: {
			  	"plants" : _options,
			  	"user" : $('#user option:selected').val(),
			  	"region": $('#region_select option:selected').val()
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
			if (_options!='') {
				$.ajax({
					  url: "/plants/assign_plants",
					  type: "POST",
					  data: {
					  	"plants" : _options,
					  	"user" : $('#user option:selected').val(),
					  	"region": $('#region_select option:selected').val()
						}
					});
			}else{
				alert('Nothing selected!');
			}
		}

	    // $('select').moveAllToListAndDelete('#lstBox1', '#lstBox2');
	    e.preventDefault();
	});

	$('#btnLeft').click(function (e) {
		if ($('#user option:selected').val()=="") {
			alert("Select User Before plant removal")
		}else if(!$('#lstBox2 option:selected').val()){
			alert("Select plant Before plant removal")
		}else{
			var selected_plants = $('#lstBox2 option:selected').map(function() {return $(this).val();}).get();
			$.ajax({
			  url: "/plants/remove_plants",
			  type: "POST",
			 data: {
			 			  	"plants" : selected_plants,
			 			  	"user" : $('#user option:selected').val(),
			 			  	"region": $('#region_select option:selected').val()
			 				}
			});
		}
	    e.preventDefault();
	});

	$('#btnAllLeft').click(function (e) {
		if ($('#user option:selected').val()=="") {
			alert("Select User Before plant assignment")
		}else{
			var _options = $("select#lstBox2 option").map(function() {return $(this).val();}).get();

			if (_options!='') {
				$.ajax({
				  url: "/plants/remove_plants",
				  type: "POST",
				 data: {
				 			  	"plants" : _options,
				 			  	"user" : $('#user option:selected').val(),
				 			  	"region": $('#region_select option:selected').val()
				 				}
				});
			}else{
				alert('Nothing selected!');
			}
		}
	    // $('select').moveAllToListAndDelete('#lstBox2', '#lstBox1');
	    e.preventDefault();
	});

	// Preload plants based on current selections
	$.ajax({
	    url: "/plants/region_plants",
	    type: "GET",
	    data: {"region" : $('#region_select option:selected').val(),
	  	"user" : $('#user option:selected').val()
	  	}
	  });
	$("#user").change(function(){
	  $.ajax({
	    url: "/plants/user_plants",
	    type: "GET",
	    data: {"user" : $('#user option:selected').val(),
	  	"region" : $('#region_select option:selected').val()
	  	}
	  })
	});

	$('#region_select').change(function(){
	  $.ajax({
	    url: "/plants/region_plants",
	    type: "GET",
	    data: {"region" : $('#region_select option:selected').val(),
	  	"user" : $('#user option:selected').val()
	  	}
	  })
	});
});

function filterRequirements() {
	var date = $('.mr-date-filter').val();
	var item_type = $('.material_requirements_item_type_filter').val();
	var only_red = $('.material_requirements_only_red_filter').is(':checked');
	window.location = "?plants=" + $('.material_requirements_plants_filter').val() + "&date="+date+'&item_type='+item_type+'&only_red='+only_red;
}




