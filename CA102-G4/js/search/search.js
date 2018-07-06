  $(document).ready(function () {
      var appendNumber = 4;
      var prependNumber = 1;
      var swiper = new Swiper('.swiper-container', {
          slidesPerView: 3,
          centeredSlides: false,
          spaceBetween: 30,
          pagination: {
              el: '.swiper-pagination',
              clickable: true,
          },
          navigation: {
              nextEl: '.fas.fa-chevron-right',
              prevEl: '.fas.fa-chevron-left',
          },
      });
  });
