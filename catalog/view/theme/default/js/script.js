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

	
	
	/* catch module_header_menu*/
	$('.dws-menu a').each(function () {
		if (this.href == window.location) {
			$(this).addClass('active');
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
        document.getElementById('from-rank-hidden').setAttribute('value', array_current_mmr[fromInput]["product_option_value_id"]);
        document.getElementById('to-rank-hidden').setAttribute('value', array_preferable_mmr[mmr]["product_option_value_id"]);
        var price = Number(preferable) + Number(current);
        $('.price > span').text(price);
    },
    onUpdate: function (data) {
        $('.add-mmr').html('+ ' + (data.from - fromInput)  + ' MMR');
        var mmr = data.from;
        console.clear();
        var preferable = array_preferable_mmr[mmr]["price"];
        var current = array_current_mmr[fromInput]["price"];
        document.getElementById('from-rank-hidden').setAttribute('value', array_current_mmr[fromInput]["product_option_value_id"]);
        document.getElementById('to-rank-hidden').setAttribute('value', array_preferable_mmr[mmr]["product_option_value_id"]);
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

$('#selectRank').ddslick({
    onSelected: function(selectedData){
    }   
});



/**
 * функция перезаписывает поведение  ссылки, в опенкарт часто необходимо передавать параметры ввиде POST
 * с помощью этой ф-ии можно переопределять поведение ссылки
 * @param url    адрес на который переходим
 * @param data   данные в виде массива,  
 * @param redirect переопределять ли стандартное поведение
 * @param meth  POST   GET
 * @returns ничего не возвращаем просто переходим на страницу
 */
function postData(url = '', data = {val1:"sdca",val2:"sadfa"},redirect = true,meth = 'POST') {
	if (!redirect){
	event.preventDefault();}
	out = function(obj) {
		var str = [];
		for (var p in obj)
		if (obj.hasOwnProperty(p)) 
		{
		  str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
		}
		  return str.join("&");
	}
	otherdata = $(event.currentTarget).closest('form').serialize();
	//parent = value.form;
	
	
		  // Значения по умолчанию обозначены знаком *
	    return fetch(url, {
	        method: meth, // *GET, POST, PUT, DELETE, etc.
	        mode: 'cors', // no-cors, cors, *same-origin
	        cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
	        credentials: 'same-origin', // include, *same-origin, omit
	        headers: {
	            //'Content-Type': 'application/json',
	             'Content-Type': 'application/x-www-form-urlencoded',
	        },
	        redirect: 'follow', // manual, *follow, error
	        referrer: 'no-referrer', // no-referrer, *client
	        body: out(data)+'&'+otherdata, // тип данных в body должен соответвовать значению заголовка "Content-Type"
	    })
	    .then(function(response) {/*window.location.href = url*/ }); // парсит JSON ответ в Javascript объект
	}

