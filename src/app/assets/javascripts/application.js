// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

function nav_menu() {
  $(document).ready(function() {
    $('#nav-menu').toggle();
    $('#nav-mask').toggle();
  });
}

function user_menu() {
  $(document).ready(function() {
    $('#user-menu').toggle();
  });
}

function display_notice_ifany() {
  $(document).ready(function() {
    str = $('.error').text();
    if($.trim(str) === "") {
      $('.error').remove();
    } else {
      $('.error').show();
    }

    str = $('.info').text();
    if($.trim(str) === "") {
      $('.info').remove();
    } else {
      $('.info').show();
    }
  });
}