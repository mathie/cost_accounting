// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require modernizr/modernizr-2.0.6
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
  $("body").bind("click", function (e) {
    $('.dropdown-toggle, .menu').parent("li").removeClass("open");
  });

  $(".dropdown-toggle, .menu").click(function (e) {
    var $li = $(this).parent("li").toggleClass('open');
    return false;
  });

  $("#flash .alert-message").delay(10000).hide('slow');

  $(".alert-message a.close").click(function(e) {
    $(this).parent(".alert-message").hide('slow');
    return false;
  })
});
