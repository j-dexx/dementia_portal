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
//= require vendor/jquery-ui.js
//= require_tree ./vendor/foundation/libraries
//= require vendor/foundation/foundation.js
//= require vendor/foundation/foundation.equalizer.js
//= require_tree .

$(document).foundation({
  equalizer : {
    // Specify if Equalizer should make elements equal height once they become stacked.
    equalize_on_stack: false,
    // Allow equalizer to resize hidden elements
    act_on_hidden_el: false
  }
});

$(document).ready(function () {
  $("#faq-accordion").accordion({
    collapsible: true
  });

  $(".faq-accordion").accordion({
    active: false,
    autoHeight: false,
    navigation: true,
    collapsible: true,
    create: function(event, ui) { $("#accordion").show(); }
  });
});

function selectAllSubCategories(category_id) {
  $(".checkbox .category-" + category_id).prop("checked", true);
}

function selectNoSubCategories(category_id) {
  $(".checkbox .category-" + category_id).prop("checked", false);
}
