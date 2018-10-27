var button = $('.button');
var remainCard = $('.remain_card');
var card = $('.card');
var blackBlock = $('.black_block');

button.on('click', function () {
    if (remainCard.text() >= 1) {
        // 클릭 버튼 일시적으로 안 보이게
        button.hide();
        // 150번 회전, 6초간 천천히 가다가 빠르게
        remainCard.text(remainCard.text() - 1);
        // 150번 회전, 6초간 천천히 가다가 빠르게
        card.css('-webkit-transform', 'rotateY(5400deg)');
        card.css('-webkit-transition', 'all 6s cubic-bezier(0.895, 0.03, 0.685, 0.22)');
        // 겉에 화면 하얗게 하기
        setTimeout(function(){
            blackBlock.fadeIn(2000);
        }, 4000);
        setTimeout(function(){
            blackBlock.fadeOut(1000);
        }, 6200);
        setTimeout(function(){
            button.fadeIn(500);
        }, 7000);
    }
    // 7초 후에 다시 리셋
    setTimeout(function(){
        card.css('-webkit-transform', 'none');
        card.css('-webkit-transition', 'none');
    }, 7000);
});

