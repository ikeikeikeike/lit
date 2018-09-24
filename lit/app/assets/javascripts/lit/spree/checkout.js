//= require jquery.payment

Spree.ready(function($) {

  $(".card-number").change(function() {
    $(this).parent().siblings(".ccType").val($.payment.cardType(this.value));
  });

  $('#accordion').on('show.bs.collapse', function(e) {
    $('input.gateway-payments').attr('checked', false);
    $(e.target).find('input.gateway-payments').attr('checked', true);
  });

});

