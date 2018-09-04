$(function(){
    $('.menu-list li.menu-item').click(function(){
        $('.menu-list li.menu-item').removeClass('active');
        $(this).addClass('active');
    })
});