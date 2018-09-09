Spree.ready(function($) {
  var carousel  = $('.product-carousel');
  var select    = $('select#product-section');
  var selectOpt = $('select#product-section option[selected]');

  if (location.hash) {
    var hashOpt = select.find('option').filter(function(idx, elm) {
      return $(elm).data('href') == location.hash
    });

    if (hashOpt.length > 0) {
      hashOpt.attr('selected', 'selected');
      selectOpt.removeAttr('selected');

      selectOpt = hashOpt;
    }
  }

  if (select.length > 0 && selectOpt.length > 0) {
    Spree.showVariantImages(selectOpt.attr("value"));
    Spree.updateVariantPrice(selectOpt);
    location.href = selectOpt.data('href');
  }

  select.change(function(event) {
    var opt = $(this).find(':selected');
    Spree.showVariantImages(this.value);
    Spree.updateVariantPrice(opt);
    location.href = opt.data('href');
  });
});
