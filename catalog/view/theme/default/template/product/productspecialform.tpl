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
            <div class="step-descr">Подготовьте аккаунт</div>
          </div>
    
          <div class="step">
            <div class="step-title"><span>3</span>Шаг</div>
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
                                    <input type="checkbox" class="option_class" name = "option[<?php echo $option['product_option_id']?>][]" value="<?php echo $val['product_option_value_id'];?>">
                                    <span class="checkmark"></span>
                                  </label>
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
                    	
                     		 <a id = "button-cart" class="button">Подготовить аккаунт</a>
                      
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
   		     $opt['val-id'] =  $option['product_option_id'];?>	
   		 	var array_current_mmr = <?php echo  str_replace(array('\u0440.','null'),array('','""'),json_encode($opt));?>;
   		 //document.getElementById('from-rank-hidden').setAttribute('name', 'option[<?php echo $option['product_option_id'];?>]');
   		 //document.getElementById('from-rank-hidden').setAttribute('value', 89);
   		     
   		     <?php }?>
  		<?php if ($option['name']=='желаемый рейтинг'){  
  		    $opt['val-id'] =  $option['product_option_id'];?>	
 		var array_preferable_mmr = <?php echo   str_replace(array('\u0440.','null'),array('','""'),json_encode($opt));?>;
 		//document.getElementById('to-rank-hidden').setAttribute('name', 'option[<?php echo $option['product_option_id'];?>]');
 		//document.getElementById('to-rank-hidden').setAttribute('value', 17);
	  <?php }?>
	<?php endforeach;?>
</script>
 

<?php echo $footer; ?>