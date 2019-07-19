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

 
<script>
	battleCupErrorHandlerOk = function(resp){
			alert("ok computer");//товар удачно оформлен
			window.location = 'index.php';
		}
	battleCupErrorHandlerError = function(resp){
		alert("  Not Ok computer");
		}

	

	var getDataArr = function(){
    	ss= {
        	ffs:'',
        	fname:'confirmbattlecup',
        	product_id:<?php echo $product_id;?>,
        	'forcomment[vk]':document.querySelector('#text').value,
        	'forcomment[email]':document.querySelector('#email').value,
        	'forcomment[email1]':function(){
            	return document.querySelector('#option-306').selectedOptions[0].innerHTML;
            }(),
        	};
    	alert(ss);
    	return ss;
    	};
    	
	
</script>


<!-- Персональная тренировка -->
<div class="personal-training">
  <div class="container">
    <div class="personal-training__title">Персональная тренировка <br> c бустером 7000+ MMR!</div>
    <div class="row">
      <div class="col-lg-4">
        <div class="personal-training__descr">
          Выберите матч, который нужно проанализировать
        </div>
      </div>
      <div class="col-lg-4">
        <div class="personal-training__descr">
          Выберите формат тренировки: получить видеоанализ матча или разобрать реплей вместе с бустером и затем провести совместую игру
        </div>
      </div>
      <div class="col-lg-4">
        <div class="personal-training__descr">
          Видеоанализ будет готов в течение 2 дней, а к персональной тренировке можно приступить в ближайшее время
        </div>
      </div>
    </div>

    <a href="#" class="button">Заполнить данные</a>
  </div>
</div>


<!-- checkout -->
<div class="checkout">
  <div class="container">
    <div class="row">
      <div class="col-lg-6 offset-lg-3">
        <div class="checkout-box">
          <div class="checkout-title">Оформление заказа</div>

          <form>
          
          <?php if ($options) { ?>
          		<?php foreach ($options as $option) {?>
            		<?php if ($option['type'] == 'radio') { ?>
            		<label><?php echo $option['name'];?></label><br>
            		<script>var optval = '<?php echo 'option['.$option['product_option_id'];?>]';</script>
            			<select id = "<?php echo 'option-'.$option['product_option_id'];?>" name="option[<?php echo $option['product_option_id']; ?>]" >
                			<?php foreach ($option['product_option_value'] as $option_value) { 
                			    $val=$option['product_option_id'];?>
                			    <option value="<?php echo $option_value['product_option_value_id']; ?>" ><?php echo $option_value['name'];?></option>
                			<?php }?>
            			</select>
            		<?php }?>
            	<?php }?>
            <?php }?>
            <div class="row">
              <div class="col-lg-6 col-md-6">
                <label for="text">Вконтакте</label>
                <input id="text" name="text" type="text" placeholder="https://vk.com/yourname" required="">
              </div>

              <div class="col-lg-6 col-md-6">
                <label for="email">E-mail</label>
                <input id="email" name="email" type="email" placeholder="name@site.ru" required="">
              </div>
            </div>
			<div class="checkout-discount"><span><?php echo $price; ?></span></div>
            <button type="submit" onclick = "postData('index.php?route=checkout/cart/add',getDataArr(),false,'POST',battleCupErrorHandlerOk,battleCupErrorHandlerError);">Перейте к оплате</button>

          </form>

        </div>
      </div>
    </div>
  </div>
</div>


<div class="training-advantages">
  <div class="container">
    <div class="row">

      <div class="col-lg-6">
        <div class="training-advantages-box">

          <div class="training-advantages__title">Видеоанализ матча</div>

          <div class="training-advantages__descr">
            Наш персональный тренер детально разберет Вашу игру и проанализирует основные игровые моменты! После оформления услуги Вы получите видео ролик длительностью 30-60 минут из которого Вы узнаете:
          </div>

          <ul>
            <li>
              Рекомендации по закупке предметов 
              и прокачке способностей в различных 
              игровых ситуациях.
            </li>
            <li>
              Хитрости лайн апа, контроль крипов, ласт хит.
            </li>
            <li>
              Как нужно действовать за выбранного 
              персонажа, узнаете что бы на вашем месте 
              делал игрок с 7000 ММР.
            </li>
            <li>
              Психология игры, как взаимодействовать 
              с тимейтами и многое другое! Получите 
              полезные советы, которые помогут тебе 
              улучшить свою игру!
            </li>
          </ul>

        </div>
      </div>

      <div class="col-lg-6">
        <div class="training-advantages-box">

          <div class="training-advantages__title">Персональная тренировка</div>
          
          <div class="training-advantages__descr">
            Во время персональной тренировки Вы сможете:
          </div>

          <ul>
            <li>Лично пообщаться с бустером.</li>
            <li>Разобрать игровые моменты.</li>
            <li>Совместно поиграть.</li>
            <li>Получить массу советов от опытного игрока.</li>
          </ul>
          
        </div>
      </div>

    </div>
  </div>
</div>


</div>

 

 
 
<?php echo $content_bottom; ?>
<?php echo $column_right; ?>
 
<?php echo $footer; ?>
