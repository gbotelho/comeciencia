// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

$(function(){ $(document).foundation(); });


// $(document).ready(function(){
//   $(document).foundation('reflow');
// });

// $(document).ready(function(){
// 	var new_value = $('input#diet_carbohydrate_percentage').val();
// 	$('.range-slider').foundation('slider', 'set_value', new_value);
// 	$('#carbohydrate_percentage_input').val(new_value);
// });

// $('[data-slider]').on('change.fndtn.slider', function(){
//   	var value = $('#slider').attr('data-slider');
//     $('input#diet_carbohydrate_percentage').val(value);
// });


// $(function(){ 
// 	$(document).foundation({
// 	  slider: {
// 	    on_change: function(){
// 	        var value = $('#slider').attr('data-slider');
// 	    	$('#carbohydrate_percentage_input').val(value);
// 	    	$('#diet[carbohydrate_percentage]').val(value/100);
// 	    }
// 	  }
// 	});
// });

