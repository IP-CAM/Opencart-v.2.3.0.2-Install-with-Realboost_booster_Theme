$(document).ready(function() {


	$('.popup-with-form').magnificPopup({
		type: 'inline',
		preloader: false,
		focus: '#text',

		// When elemened is focused, some mobile browsers in some cases zoom in
		// It looks not nice, so we disable it:
		callbacks: {
			beforeOpen: function() {
				if($(window).width() < 700) {
					this.st.focus = false;
				} else {
					this.st.focus = '#text';
				}
			}
		}
	});


$(".header-menu").click(function(e){
			e.preventDefault();
			$("#menu").toggleClass("show");
		});
		$("#menu a").click(function(event){
			if($(this).next('ul').length){
				$(this).next().toggle('fast');
				$(this).children('i:last-child').toggleClass('fa-caret-down fa-caret-left');
			}
});

$(document).on('click','.milk-shadow',function(){
	$(".header-menu").click();
});


$('.banner').slick({
  autoplay: true,
  autoplaySpeed: 10000,
  dots: true,
  infinite: true,
  speed: 500,
  fade: true,
  cssEase: 'linear',
  prevArrow: $('.prev'),
		nextArrow: $('.next')
});


$('.review-slider').slick({
  dots: true,
  infinite: true,
  speed: 500,
  slidesToShow: 3,
  slidesToScroll: 1,
  prevArrow: $('.review-prev'),
		nextArrow: $('.review-next'),
  responsive: [
    {
      breakpoint: 992,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 1,
        infinite: true,
        dots: true
      }
    },
    {
      breakpoint: 768,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1
      }
    },
    {
      breakpoint: 480,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1
      }
    }

  ]
});

});


$("#calculator-slider").ionRangeSlider({
    skin: "round",
    type: "double",
    grid: true,
    min: 0,
    max: 7000,
    from: 2000,
    to: 3500,
    step: 100,
    grid_num: 6,
    onChange: function (data) {
        $('#from-rank').val(data.from);
        $('#to-rank').val(data.to);
    }
});

var fromInput = $('#from-rank').val();
var toInput = $('#to-rank').val();

var $d5 = $("#boost-rank-slider");
var mmr = 0;
var price = 0;
$d5.ionRangeSlider({
    skin: "round",
    min: 0,
    max: 7000,
    from: 0,
    step: 100,
    postfix: " ММР",
    onChange: function (data) {
        $('.add-mmr').html('+ ' + (data.from - fromInput)  + ' MMR');
        $('#to-rank').val(data.from);
        var mmr = data.from;
        console.clear();
        var preferable = array_preferable_mmr[mmr]["price"];
        var current = array_current_mmr[fromInput]["price"];
        var price = Number(preferable) + Number(current);
        $('.price > span').text(price);
    },
    onUpdate: function (data) {
        $('.add-mmr').html('+ ' + (data.from - fromInput)  + ' MMR');
        var mmr = data.from;
        console.clear();
        var preferable = array_preferable_mmr[mmr]["price"];
        var current = array_current_mmr[fromInput]["price"];
        var price = Number(preferable) + Number(current);
        $('.price > span').text(price);
    }
});

var d5_instance = $d5.data("ionRangeSlider");

$('#from-rank').bind('input', function() { 
    fromInput = $(this).val();
    var min = fromInput;
    var from = fromInput;
    $('#to-rank').attr({
       "min" : from    
    });
    var preferable = array_preferable_mmr[mmr]["price"];
    var current = array_current_mmr[fromInput]["price"];
    var price = Number(preferable) + Number(current);
    $('.price > span').text(price);

    d5_instance.update({
        min: min
    });
});

$('#to-rank').bind('input', function() { 
    toInput = $(this).val();
    var from = toInput;
    var preferable = array_preferable_mmr[mmr]["price"];
    var current = array_current_mmr[fromInput]["price"];
    var price = Number(preferable) + Number(current);

    $('.price > span').text(price);

    d5_instance.update({
        from: from
    });
});