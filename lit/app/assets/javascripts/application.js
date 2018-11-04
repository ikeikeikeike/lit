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
///// require rails-ujs

//= require activestorage

///// require turbolinks
///// require_tree .

// Spree.ready(function($) { console.log(222222) });
$(function() {
  var randomChoice = function(list) {
    return list[Math.floor(Math.random() * list.length)];
  }

  var $imgswitchers = $('[data-imgswitchers]');

  $imgswitchers
    .mouseover(function(e) {
      $(this).addClass('mouseover');
    })
    .mouseout(function(e) {
      $(this).removeClass('mouseover');
    });

  $imgswitchers.each(function(i, img) {
    var $img = $(img);
    if ($img.data('imgswitchers').length <= 0) {
      return;
    }

    var switcher = (function($img) {
      return function() {
        if ($img.hasClass('mouseover')) {
          return;
        }

        $img.attr('src', randomChoice($img.data('imgswitchers')));
      };
    })($img);

    setInterval(switcher, randomChoice([5000, 6000, 7000, 8000]));
  });

});


$(function () {
  $('.widget .list-group-item').on('click', function() {
    var $c = $(this).find('.custom-control-input');
    $c.prop('checked') ? $c.prop('checked', false) : $c.prop('checked', true);
  })

  $('.widget .custom-control.custom-checkbox').on('click', function() {
    var $c = $(this).find('.custom-control-input');
    $c.prop('checked') ? $c.prop('checked', false) : $c.prop('checked', true);

    $('#sidebar_products_search').trigger('submit');
  })

  $('#modalShopFiltersSubmit').on('click', function() {
    $('#mb_sidebar_products_search').trigger('submit');
  });

  $('#ShopFilters').on('click', function() {
    $('#sidebar_products_search').trigger('submit');
  });

});
