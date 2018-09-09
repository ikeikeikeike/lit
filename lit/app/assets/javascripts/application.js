// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
///// require turbolinks
//= require_tree .


Spree.ready(function($) {
  var carousel = $('.product-carousel');
  var select = $('select#product-section');
  var selectedOption = $(
    'select#product-section[selected="selected"]'
  );

  if (select.length > 0 && selectedOption.length > 0) {
    Spree.showVariantImages(selectedOption.attr("value"));
    Spree.updateVariantPrice(selectedOption);
  }

  select.change(function(event) {
    var selected = $(this).find(':selected');
    Spree.showVariantImages(this.value);
    Spree.updateVariantPrice(selected);
    location.href = selected.data('href');
  });
});
