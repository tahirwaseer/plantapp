$(document).ready(function() {

	function select_region() {
		
	}
	$('#btnRight').click(function (e) {
			$.ajax({
			  url: "/plants/assign_plants",
			  type: "POST",
			  data: {
			  	"plants" : $('#lstBox1 option:selected').val(),
			  	"user" : $('#user option:selected').val()
				}
			});

	    // $('select').moveToListAndDelete('#lstBox1', '#lstBox2');

      

	    e.preventDefault();
	});

	$('#btnAllRight').click(function (e) {
	    $('select').moveAllToListAndDelete('#lstBox1', '#lstBox2');
	    e.preventDefault();
	});

	$('#btnLeft').click(function (e) {
			$.ajax({
			  url: "/plants/remove_plants",
			  type: "POST",
			 data: {
			 			  	"plants" : $('#lstBox2 option:selected').val(),
			 			  	"user" : $('#user option:selected').val()
			 				}
			});

	    // $('select').moveToListAndDelete('#lstBox2', '#lstBox1');
	    e.preventDefault();
	});

	$('#btnAllLeft').click(function (e) {
	    $('select').moveAllToListAndDelete('#lstBox2', '#lstBox1');
	    e.preventDefault();
	});


	$("#user").change(function(){
	  $.ajax({
	    url: "/plants/user_plants",
	    type: "GET",
	    data: {"user" : $('#user option:selected').val()}
	  })
	});1

	$('#region_select').change(function(){
		var text= $('#region_select option:selected').text()
		console.log("//$('#region_select option:selected').text()",$('#region_select option:selected').text())
	  $.ajax({
	    url: "/plants/region_plants",
	    type: "GET",
	    data: {"region" : $('#region_select option:selected').text()}
	  })
	});
})




