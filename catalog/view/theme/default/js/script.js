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
    max: 7500,
    from: 2000,
    to: 3500,
    step: 25,
    grid_num: 6,
    onChange: function (data) {
        $('#from-rank').val(data.from);
        $('#to-rank').val(data.to);
    }
});

var fromInput = $('#from-rank').val();
var toInput = $('#to-rank').val();

var $d5 = $("#boost-rank-slider");

$d5.ionRangeSlider({
    skin: "round",
    min: 0,
    max: 7500,
    from: 0,
    step: 100,
    postfix: " ММР",
    onChange: function (data) {
        $('.add-mmr').html('+ ' + (data.from - fromInput)  + ' MMR');
        $('#to-rank').val(data.from);
        var mmr = data.from;
        console.clear();
        console.log(mmr);
    },
    onUpdate: function (data) {
        $('.add-mmr').html('+ ' + (data.from - fromInput)  + ' MMR');

        var mmr = data.from;
        console.clear();
        console.log(mmr);
    }
});

var d5_instance = $d5.data("ionRangeSlider");

$('#from-rank').bind('input', function() { 
    fromInput = $(this).val();
    var min = fromInput;
    var from = fromInput;

    d5_instance.update({
        min: min,
        from: from
    });
});

$('#to-rank').bind('input', function() { 
    toInput = $(this).val();
    var from = toInput;

    d5_instance.update({
        from: from
    });
});

/*var 100 = 175
var 200 = 350
var 300 = 525
var 400 = 700
var 500 = 825
var 600 = 1005
var 700 = 1185
var 800 = 1365
var 900 = 1545
var 1000 = 1725
var 1100 = 1910
var 1200 = 2095
var 1300 = 2280
var 1400 = 2465
var 1500 = 2650
var 1600 = 2845
var 1700 = 3040
var 1800 = 3235
var 1900 = 3430
var 2000 = 3625
var 2100 = 3850
var 2200  4075
var 2300  4300
var 2400  4525
var 2500  4750
var 2600  5025
var 2700  5300
var 2800  5575
var 2900  5850
var 3000  6125
var 3200  6415
var 3300  6705
var 3400  6995
var 3500  7285
var 3600  7650
var 3700  8015
var 3800  8380
var 3900  8745
var 4000  9110
var 4100  9590
var 4200  10070
var 4300  10550
var 4400  11030
var 4500  11510
var 4600  12085
var 4700  12660
var 4800  13235
var 4900  13810
var 5000  14385
var 5100  15195
var 5200  16170
var 5300  17330
var 5400  18490
var 5500  20000
var 5600  21825
var 5700  23775
var 5800  26025
var 5900  28475
var 6000  31225
var 6100  34275
var 6200  37625
var 6300  41275
var 6400  45575
var 6500  50525
var 6600  60025
var 6700  69525
var 6800  79025
var 6900  88525
var 7000  98025*/
/*
if (mmr == 2500) {
  var minus = (mmr - fromInput);

  var price = 4750;
  console.log()
}*/