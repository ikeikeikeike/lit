Spree.ready(function($) {
  $("form#update-cart").submit(function() {
    $("form#update-cart .update-button").attr("disabled", true);
  });
});
