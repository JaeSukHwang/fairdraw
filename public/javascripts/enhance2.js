var button = $('.button');
var level = $('.level');
var animation = $('.enhance');
var blackBlock = $('.black_block');
var result = $('.result');
var resultLevel = $('#result_level');
 button.on('click', function () {
    // 클릭 버튼 일시적으로 안 보이게
    button.hide();
    // 효과 나타나고 효과 서서히 빨라지게(아래 함수 참고)
    level.addClass('enhance');
     // 겉에 화면 검게 하기
    setTimeout(function(){
        blackBlock.fadeIn(2000);
        level.fadeOut(2000);
    }, 4000);
    setTimeout(function(){
        blackBlock.fadeOut(1000);
        result.fadeIn(1000);
        resultLevel.fadeIn(1000);
    }, 6200);
});