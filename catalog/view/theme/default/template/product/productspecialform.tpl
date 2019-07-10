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
 <?php echo $content_bottom; ?>
 <?php echo $column_right; ?>
 
 
 
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
    <form>
      <div class="row">
		<script>
		 <?php foreach($options as $option):
    		 if ($option['name']=='ваш рейтинг'){  ?>	
    		 	var array_current_mmr = <?php echo  json_encode($option['product_option_value']);?>;
    		<?php }?>
    		<?php if ($option['name']=='желаемый рейтинг'){  ?>	
		 		var array_preferable_mmr = <?php echo  json_encode($option['product_option_value']);?>;
		 		
		  <?php }?>
		<?php endforeach;?>
		</script>
		<script>
		console.log('dddd');
		</script>
        <div class="offset-lg-3 col-lg-2 offset-md-0 col-md-3">
          <label for="from-rank" class="calculator-subtitle">Текущий ММР</label>
          <input type="number" id="from-rank" value="0" min="0" max="7500" step="100" required="">
        </div>

        <div class="col-lg-2 col-md-6">
          <div class="add-mmr">+ 0 MMR</div>
          <input type="text" id="boost-rank-slider" name="my_range" value="" />
        </div>

        <div class="col-lg-2 col-md-3">
          <div class="calculator-subtitle">Конечный ММР</div>
          <input type="number" id="to-rank" value="0" min="0" max="7500" step="100" required="">
        </div>
      </div>

        <div class="boost-calculator-bottom">
          <div class="row">
            <div class="offset-lg-2 col-lg-6">
            <?php foreach($options as $option): 
                if ($option['name']=='boost_opt'):
                foreach($option['product_option_value']as $val):?>
            	
                      <label class="container"><?php echo $val['name'];?><span class="percent"> (<?php echo str_replace('р.',$val['price_prefix'], $val['price']);?>)</span>
                        <input type="checkbox" class="party-mmr">
                        <span class="checkmark"></span>
                      </label>
                  <?php endforeach; 
            	 endif;
			 endforeach;?>
              

            <div class="col-lg-4">
              <div class="price"><span>100</span> руб.</div>
              <div class="term">Сроки <span>2-3</span> дня</div>
            </div>

            <div class="col-lg-12">
              <a href="#" class="button">Подготовить аккаунт</a>
            </div>
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
            <img src="img/icons/people.png" alt="people">
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
            <img src="img/icons/eye.png" alt="eye">
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
 
 

<?php echo $footer; ?>
