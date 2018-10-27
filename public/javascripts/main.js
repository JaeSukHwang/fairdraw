// 페이지 전체에서 공통적으로 쓰이는 js

// nav_bar 넣기
var navBar = $('.nav_bar');
var navBarTitle = $('.nav_bar_title');
var main = $('.main');
var navBarButton = $('.nav_bar_button');

navBarTitle.on('click', function () {
    navBar.hide();
    main.css('width', '100%');
    navBarButton.show()
});
navBarButton.on('click', function () {
    navBar.show();
    main.css('width', '80%');
    navBarButton.hide()
});