/*global $, console*/

$(function () {
    'use strict';
    
    $('.header .arrow i').click(function () {
        $('html, body').animate({
            scrollTop: $('.features').offset().top
        }, 1000);
    });
    
    $('.header .hire').click(function () {
        $('html, body').animate({
            scrollTop: $('.contact').offset().top
        }, 1000);
    });
    
    $('.header .our').click(function () {
        
        $('html, body').animate({
            
            scrollTop: $('.our-work').offset().top
            
        }, 1000);
    });
    
    $('.our-work .work').hover(function () {
        $(this).children('.over').slideDown(500);
    },
                              function () {
            $(this).children('.over').slideUp(500);
        });
//    show more
    $('.our-work .show-more').click(function () {
        $(this).siblings('.hidden').fadeToggle(1000);
    });
    
//    Custom slide carousel
    
    
 
    var rightArrow = $('.testim .fa-chevron-right'),
        leftArrow = $('.testim .fa-chevron-left');
    function checkACarou() {
        $('.testim .client:first').hasClass('active') ? leftArrow.fadeOut(0) : leftArrow.fadeIn();
        $('.testim .client:last').hasClass('active') ? rightArrow.fadeOut(0) : rightArrow.fadeIn();
    }
    
    checkACarou();
    
    $('.testim i').click(function () {
        if ($(this).hasClass('fa-chevron-right')) {
            
            $('.testim .active').fadeOut(100, function () {
                
                $(this).removeClass('active').next('.testim .client').addClass('active').fadeIn();
                
                
                checkACarou();
                
            });
            
            
            
        } else {
            
            $('.testim .active').fadeOut(100, function () {
                
                $(this).removeClass('active').prev('.testim .client').addClass('active').fadeIn();
                checkACarou();
                
            });
                
                
            
        }
    
    });
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
});