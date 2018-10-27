var button = $('.button');
var card = $('#card');
var blackBlock = $('.black_block');
var selectedCard = $('#selected_card');

button.on('click', function () {
    // 클릭 버튼 일시적으로 안 보이게
    button.hide();
    // 150번 회전, 6초간 천천히 가다가 빠르게
    card.css('-webkit-transform', 'rotateY(5400deg)');
    card.css('-webkit-transition', 'all 6s cubic-bezier(0.895, 0.03, 0.685, 0.22)');
    // 겉에 화면 하얗게 하기
    setTimeout(function(){
        blackBlock.fadeIn(2000);
    }, 4500);
    setTimeout(function(){
        blackBlock.fadeOut(500);
        card.hide();
        selectedCard.fadeIn(700)
    }, 6200);
    // 7초 후에 다시 리셋
    setTimeout(function(){
        card.css('-webkit-transform', 'none');
        card.css('-webkit-transition', 'none');
    }, 7000);
});

