var button = $('.button');
var level = $('.level');
var animation = $('.enhance');
var blackBlock = $('.black_block');
var nextLevel = $('.next_level');
var resultLevel = $('#result_level');
var home = $('.home');
var enhanceResult = $('.enhance_result');

button.on('click', function () {
    // 클릭 버튼 일시적으로 안 보이게
    button.hide();
    home.hide();
    // 효과 나타나게
    level.addClass('enhance');
    nextLevel.show();

    // 겉에 화면 검게 하기
    setTimeout(function(){
        blackBlock.fadeIn(2000);
        level.fadeOut(2000);
    }, 4000);
    setTimeout(function(){
        blackBlock.fadeOut(1000);
        resultLevel.fadeIn(1000);
        enhanceResult.fadeIn(1000);
        home.show();
    }, 6200);
});
