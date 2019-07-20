<?php echo $header; ?>


<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
   
  </div>
</div>
 <?php echo $content_top; ?>

<script>
var getPrice = function(){return document.querySelector('.price span').innerHTML;};
var setPrice = function(val){document.querySelector('.price span').innerHTML = val};
var NormalizedPrice = {
		Price:0
}
var arrayWidth  = [
		{name:'Herald',val:150,img:'<?php  echo $img_path; ?>rank-icon/rank1_1.png'},
		{name:'Herald',val:300,img:'<?php  echo $img_path; ?>rank-icon/rank1_2.png'},
		{name:'Herald',val:450,img:'<?php  echo $img_path; ?>rank-icon/rank1_3.png'},
		{name:'Herald',val:600,img:'<?php  echo $img_path; ?>rank-icon/rank1_4.png'},
		{name:'Herald',val:750,img:'<?php  echo $img_path; ?>rank-icon/rank1_5.png'},
		{name:'Guardian',val:900,img:'<?php  echo $img_path; ?>rank-icon/rank2_1.png'},
		{name:'Guardian',val:1050,img:'<?php  echo $img_path; ?>rank-icon/rank2_2.png'},
		{name:'Guardian',val:1200,img:'<?php  echo $img_path; ?>rank-icon/rank2_3.png'},
		{name:'Guardian',val:1350,img:'<?php  echo $img_path; ?>rank-icon/rank2_4.png'},
		{name:'Guardian',val:1500,img:'<?php  echo $img_path; ?>rank-icon/rank2_5.png'},
		{name:'Crusader',val:1750,img:'<?php  echo $img_path; ?>rank-icon/rank3_1.png'},
		{name:'Crusader',val:1900,img:'<?php  echo $img_path; ?>rank-icon/rank3_2.png'},
		{name:'Crusader',val:2050,img:'<?php  echo $img_path; ?>rank-icon/rank3_3.png'},
		{name:'Crusader',val:2200,img:'<?php  echo $img_path; ?>rank-icon/rank3_4.png'},
		{name:'Crusader',val:2400,img:'<?php  echo $img_path; ?>rank-icon/rank3_5.png'},
		{name:'Archon',val:2650,img:'<?php  echo $img_path; ?>rank-icon/rank4_1.png'},
		{name:'Archon',val:2800,img:'<?php  echo $img_path; ?>rank-icon/rank4_2.png'},
		{name:'Archon',val:2950,img:'<?php  echo $img_path; ?>rank-icon/rank4_3.png'},
		{name:'Archon',val:3050,img:'<?php  echo $img_path; ?>rank-icon/rank4_4.png'},
		{name:'Archon',val:3200,img:'<?php  echo $img_path; ?>rank-icon/rank4_5.png'},
		{name:'Legend',val:3350,img:'<?php  echo $img_path; ?>rank-icon/rank5_1.png'},
		{name:'Legend',val:3550,img:'<?php  echo $img_path; ?>rank-icon/rank5_2.png'},
		{name:'Legend',val:3750,img:'<?php  echo $img_path; ?>rank-icon/rank5_3.png'},
		{name:'Legend',val:3900,img:'<?php  echo $img_path; ?>rank-icon/rank5_4.png'},
		{name:'Legend',val:4050,img:'<?php  echo $img_path; ?>rank-icon/rank5_5.png'},
		{name:'Ancient',val:4250,img:'<?php  echo $img_path; ?>rank-icon/rank6_1.png'},
		{name:'Ancient',val:4400,img:'<?php  echo $img_path; ?>rank-icon/rank6_2.png'},
		{name:'Ancient',val:4650,img:'<?php  echo $img_path; ?>rank-icon/rank6_3.png'},
		{name:'Ancient',val:4800,img:'<?php  echo $img_path; ?>rank-icon/rank6_4.png'},
		{name:'Ancient',val:4950,img:'<?php  echo $img_path; ?>rank-icon/rank6_5.png'},
		{name:'Divine',val:5100,img:'<?php  echo $img_path; ?>rank-icon/rank7_1.png'},
		{name:'Divine',val:5350,img:'<?php  echo $img_path; ?>rank-icon/rank7_2.png'},
		{name:'Divine',val:5500,img:'<?php  echo $img_path; ?>rank-icon/rank7_3.png'},
		{name:'Divine',val:5650,img:'<?php  echo $img_path; ?>rank-icon/rank7_4.png'},
		{name:'Divine',val:5800,img:'<?php  echo $img_path; ?>rank-icon/rank7_5.png'},
		{name:'SuperMan',val:10000,img:'<?php  echo $img_path; ?>rank-icon/rank8_0.png'},
			];
var imgDecorator = function(
		classUnderStr,//класс  над которым   рисуем
		classWithPriceStr, // класс с ценой, на который вешается наблюдатель, с помощью которого отслеживается цена
		timeForShow,//время,   сколько времени показывать
		table//опорный массив с данными
		 
		){
	let elementStyle = 'position: absolute;top: 50px;right: 0px;';
	let classUnderNode = document.querySelector(classUnderStr);
	let classWithPriceNode = document.querySelector(classWithPriceStr);
	//let price = classWithPriceNode.innerHTML;
	let anElement = '';
	let config = { attributes: true, childList: true, subtree: true };
	
	
	let handler = function(mutationsList, observer){
		for(var mutation of mutationsList) {
	        if (mutation.type == 'childList') {
	        	
	        }
	        else if (mutation.type == 'attributes') {
	        	
	        	let theSpan = document.createElement("span"); 
	        	let price = classWithPriceNode.innerText.replace(/\W+/g, '');
	        	if (price==""){
	        	price = classWithPriceNode.textContent.replace(/\W+/g, '');
		        };
				theSpan.innerText = price
				let found = table.find((val)=>{return val['val']>price;});
				theSpan.innerHTML= '<img width="80px"  src = "'+found['img']+'"></img>';
				theSpan.style = elementStyle;
				classUnderNode.appendChild(theSpan);
				
	        }
	    }
			
			
		}
	var observer = new MutationObserver(handler);
	observer.observe(classWithPriceNode, config);
		
};
window.onload = function(){ 
imgDecorator('.irs-single','.irs-single',100,arrayWidth);}




</script>

 <div class="content">
    
    <!-- Шаги -->
    <div class="steps">
      <div class="container">
    
        <div class="def-title steps-title">Бустим рейтинг на ваших глазах!</div>
    
        <div class="steps-points">
    
          <div class="step active">
            <div class="step-title"><span>1</span>Шаг</div>
            <div class="step-descr">Рассчитайте стоимость</div>
          </div>
    
          
    
          <div class="step">
            <div class="step-title"><span>2</span>Шаг</div>
            <div class="step-descr">Введите данные</div>
          </div>
    
        </div>
    
      </div>
    </div>
    
    
    <!-- calculator -->
    <div class="container">
      <div class="boost-calculator">
        <div class="boost-calculator-title">Калькулятор</div>
        <form id="product">
              <div class="row">
        		<div class="offset-lg-3 col-lg-2 offset-md-0 col-md-3">
                  <label for="from-rank" class="calculator-subtitle">Текущий ММР</label>
                  <input type="number"  id="from-rank" value="0" min="0" max="7000" step="100" required="">
                  <input type="hidden" name="option[array_current_mmr_id]"  id="from-rank-hidden" value="" />
                </div>
        
                <div class="col-lg-2 col-md-6">
                  <div class="add-mmr">+ 0 MMR</div>
                  <input type="text" id="boost-rank-slider" name="my_range" value="" />
                  
                </div>
        
                <div class="col-lg-2 col-md-3">
                  <div class="calculator-subtitle">Конечный ММР</div>
                  <input type="number" id="to-rank" value="0" min="0" max="7000" step="100" required="">
                  <input type="hidden" name="option[array_current_mmr_id]"  id="to-rank-hidden" value="" />
                </div>
              </div>
        
                <div class="boost-calculator-bottom">
             <div class="row">
                    
                        <div class="offset-lg-2 col-lg-6">
                        <?php foreach($options as $option): 
                            if ($option['name']=='boost_opt'):
                            foreach($option['product_option_value']as $val):?>
                        		 <label class="container"><?php echo $val['name'];?>
                        			 <span class="percent"> (<?php echo str_replace('р.',$val['price_prefix'], $val['price']);?>)</span>
                                    	<input type="checkbox" class="option-<?php echo $val['option_value_id'];?>" name = "option[<?php echo $option['product_option_id']?>][]" value="<?php echo $val['product_option_value_id'];?>">
                        			  <span class="checkmark"></span>
                                  </label>
                               <script>
                               
                        			document.querySelector('.option-<?php echo $val['option_value_id'];?>').onchange = function(){
                            			let isset  = document.querySelector('.option-<?php echo $val['option_value_id'];?>').checked;
                            			let type = '<?php echo $val['price_prefix'];?>';
                            			let amount  = <?php echo str_replace('р.','', $val['price']);?>;
                            			switch (type) {
                            			  case '+':
                            				  if (isset){
                              				  	setPrice(Number(getPrice())+Number(amount));}
                                  			  else {
                                  				setPrice(Number(getPrice())-Number(amount));}
                            			    break;
                            			  case '%':
                                			  if (isset){
                            				  	setPrice(Number(getPrice())+Number(NormalizedPrice.Price*amount/100));}
                                			  else {
                                				  setPrice(Number(getPrice())-Number(NormalizedPrice.Price*amount/100));}
                                			  break;
                            			  default:
                            			    //alert('нет-нет, выполнится вариант выше')
                            			}
                            			
                            		};
                        			console.log(`<?php echo serialize($val);?>`);
                        		</script>
                              <?php endforeach; 
                        	 endif;
            			 endforeach;?>
                          
                      </div>
            
                    
                    <div class="col-lg-4">
                      <div class="price"><span>100</span> руб.</div>
                      <div class="term">Сроки <span>2-3</span> дня</div>
                    </div>
            
                    <div class="col-lg-12">
                    	<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                    	
                     	<a id = "button-cart" class="button"  >Подготовить аккаунт</a>
                      
                    </div>
        
                </div>
    
    
        </form>
      </div>
    </div>
    
    
    <!-- why-boost -->
    <div class="whyBoost">
      <div class="container">
    
        <div class="def-title whyBoost-title">Зачем нужен <br> буст рейтинга в Dota 2</div>
        <div class="row">
    
          <div class="col-lg-4 col-md-6">
            <div class="infoBoost">
              <div class="infoBoost-title">Это поможет тебе</div>
    
              <ul>
                <li>Играть с адекватными союзниками</li>
                <li>Повысить статистику аккаунта</li>
                <li>Получать удовольствие от игры</li>
              </ul>
            </div>
          </div>
    
          <div class="col-lg-4 col-md-6">
            <div class="infoBoost">
              <div class="infoBoost-title">Это безопасно</div>
    
              <ul>
                <li>Все бустеры прошли проверку</li>
                <li>Работаем анонимно</li>
                <li>Бан невозможен, используем VPN</li>
              </ul>
            </div>
          </div>
    
          <div class="col-lg-4 col-md-12">
            <div class="infoBoost">
              <div class="infoBoost-title">Почему мы</div>
    
              <ul>
                <li>Работаем с 2015 года</li>
                <li>Команда ТОП-500 Бустеров</li>
                <li>Онлайн контроль и чат на заказе</li>
              </ul>
            </div>
          </div>
    
        </div>
      </div>
    </div>
    
    
    <!-- security -->
    <div class="security">
      <div class="container">
        <div class="def-title">Ваш аккаунт в безопасности!</div>
        <div class="row">
    
          <div class="col-lg-6 col-md-12">
            <div class="security-block">
    
              <div class="security-block_left">
                <img src="<?php  echo $img_path; ?>icons/people.png" alt="people">
              </div>
    
              <div class="security-block_right">
                <div class="security-block_title">Семейный просмотр</div>
                <div class="security-block_descr">
                  Обеспечивает основную безопасность
                  аккаунта. Не имея пин кода и доступа к
                  почте, никто не сможет получить доступ к
                  изменению данных Вашего аккаунта.
                </div>
              </div>
    
            </div>
          </div>
    
          <div class="col-lg-6 col-md-12">
            <div class="security-block">
    
              <div class="security-block_left">
                <img src="<?php  echo $img_path; ?>/icons/eye.png" alt="eye">
              </div>
    
              <div class="security-block_right">
                <div class="security-block_title">Лента активности</div>
                <div class="security-block_descr">
                  Позволяет смотреть за всеми событиями на
                  аккаунте в режиме онлайн. Вы можете посмотреть
                  победы, поражения. Это возможно благодря тому,
                  что мы используем CRM систему для работы бустеров.
                </div>
              </div>
    
            </div>
          </div>
    
        </div>
      </div>
    </div>

 
</div>
<script>
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked,  #product input[type=\'number\'], #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
			console.log( this.data );
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			window.location.href = 'checkout/checkout';
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
//--></script>
<?php echo $content_bottom; ?>
<?php echo $column_right; ?>
 
<script>
	 <?php foreach($options as $option):
		$opt = array();
		 foreach ($option['product_option_value'] as $key=>$val){
			 $opt[$val['name']]=$val;
			 $opt[$val['name']]['key'] = $key;
		 }
   		 if ($option['name']=='ваш рейтинг'){  
   		   //  $opt['val-id'] =  $option['product_option_id'];?>	
   		 	var array_current_mmr = <?php echo  str_replace('\u0440.','',json_encode($opt));?>;
   		 	document.getElementById('from-rank-hidden').setAttribute('name', 'option[<?php echo $option['product_option_id'];?>]');
   		 document.getElementById('from-rank-hidden').setAttribute('value', 89);
   		     
   		     <?php }?>
  		<?php if ($option['name']=='желаемый рейтинг'){  
  		    $opt['val-id'] =  $option['product_option_id'];?>	
 		var array_preferable_mmr = <?php echo   str_replace('\u0440.','',json_encode($opt));?>;
 		document.getElementById('to-rank-hidden').setAttribute('name', 'option[<?php echo $option['product_option_id'];?>]');
 		document.getElementById('to-rank-hidden').setAttribute('value', 17);
	  <?php }?>
	<?php endforeach;?>
</script>
 

<?php echo $footer; ?>