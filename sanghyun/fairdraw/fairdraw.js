var swiper = new Swiper('.swiper-container', {
  slidesPerView: 3,
  spaceBetween: 30,
  freeMode: true,
  pagination: {
    el: '.swiper-pagination',
    clickable: true,
  },
});

var search_bar = $('.search_bar');
var search = $('.search');

search.on('click', function () {
    search.hide();
    search_bar.show(); 
});
search_bar.on('click', function () {
    search.show();
    search_bar.hide();
});