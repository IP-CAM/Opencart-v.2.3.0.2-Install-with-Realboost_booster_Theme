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
 
<script>
	battleCupErrorHandlerOk = function(resp){
		rrf =  resp.response;
		rrf = JSON.parse(rrf);
		if (rrf.success){
			
			//товар удачно был добавлен, запускаем оформление заказа
			
			}
		
		}
	battleCupErrorHandlerError = function(resp){
		alert("  Not Ok computer");
		}

	data =  {product_id:<?php echo $product_id;?>,fname:'confirmbattlecup'}
</script>
<div class="content">


<!-- countdown -->
<div class="container">
  <div class="countdown">
    <div class="countdown-title">Стань чемпионом Боевого <br> кубка уже через</div>

    <div class="countdown-timer">2дн. 21:08:10</div>

    <a href="#" class="button">Оформить заказ</a>
  </div>
</div>


<!-- checkout -->
<div class="checkout battle-cup-checkout">
  <div class="container">
    <div class="row">
      <div class="col-lg-6 offset-lg-3">
        <div class="checkout-box">
          <div class="checkout-title">Оформление заказа</div>

          <form>
            <div class="row">

              <div class="col-lg-3 col-md-3 col-sm-6 col-6 my-auto">
                <input type="radio" id="test1" name="radio-group1" checked>
                <label for="test1"><img src="<?php  echo $img_path; ?>icons/rang1.png" alt="icon-rang"></label>
              </div>

              <div class="col-lg-3 col-md-3 col-sm-6 col-6 my-auto">
                <input type="radio" id="test2" name="radio-group2" checked>
                <label for="test2"><img src="<?php  echo $img_path; ?>icons/rang2.png" alt="icon-rang"></label>
              </div>

              <div class="col-lg-3 col-md-3 col-sm-6 col-6 my-auto3">
                <input type="radio" id="test3" name="radio-group" checked >
                <label for="test3"><img src="<?php  echo $img_path; ?>icons/rang3.png" alt="icon-rang"></label>
              </div>

              <div class="col-lg-3 col-md-3 col-sm-6 col-6 my-auto4">
                <input type="radio" id="test4" name="radio-group" checked>
                <label for="test4">Другой</label>
              </div>




              <div class="col-lg-6 col-md-6">
                <label for="text">Вконтакте для связи</label>
                <input id="text" name="text" type="text" placeholder="https://vk.com/yourname">
              </div>

              <div class="col-lg-6 col-md-6">
                <label for="email">E-mail</label>
                <input id="email" name="email" type="email" placeholder="name@site.ru" required="">
              </div> 

            </div>

            <div class="checkout-discount"><span><?php echo $price;?></span></div>

            <button type="submit" onclick="postData('index.php?route=checkout/cart/add',data,false,'POST',battleCupErrorHandlerOk,battleCupErrorHandlerError);">Я все сделал</button>

          </form>

        </div>
      </div>
    </div>
  </div>
</div>


<!-- О Battle Cup -->
<div class="descr-bc">
  <div class="container">

    <div class="descr-bc-title">О Battle Cup</div>
    <div class="row">

      <div class="col-lg-4 col-md-6">
        <div class="descr-bc_left">
          <div class="descr-bc__title">Что это?</div>
          <div class="descr-bc__descr">
            Боевой кубок - еженедельный любительский турнир, который автоматически стартует в клиенте DotA 2. Он доступен для подписчиков Dota Plus и в течение турнирных Эвентов. Пользователи формируют команды и участвуют в турнире, который состоит из 8 команд (включая вашу). Сетка - Single Elimination.
          </div>
        </div>
      </div>

      <div class="col-lg-4 col-md-6">
        <div class="descr-bc_box">
          <div class="descr-bc__title">требования для участия</div>

          <ul>
            <li>
              Уровень профиля пользователей 
              должен быть больше 25
            </li>
            <li>
              Пользователи должны 
              быть в команде
            </li>
            <li>
              Каждая команда должна иметь 
              подписку на Dota Plus, или 5 
              Battle Cup билетов
            </li>
            <li>
              Перед стартом, команды должны 
              зарегистрироваться 
              в соответствующем регионе
            </li>
            <li>
              Команды должны быть готовы 
              к старту в течение 30 минут 
              после регистрации
            </li>
          </ul>
        </div>
      </div>

      <div class="col-lg-4 col-md-6">
        <div class="descr-bc_box">
          <div class="descr-bc__title">награды за победу</div>

          <ul>
            <li>
              Специальный Боевой кубок 
              и бэйдж в чате
            </li>
            <li>
              Престижное описание 
              в профиле, детальное описание 
              побед и стриков (На 1 неделю)
            </li>
            <li>
              7 эксклюзивных Emoji 
              (На 1 неделю)
            </li>
            <li>
              Эксклюзивная Battle Cup статуя
            </li>
            <li>
              20.000 Shards 
              (Для подписчиков Dota Plus)
            </li>
          </ul>
        </div>
      </div>

      <div class="col-lg-8 col-md-6">
        <div class="descr-bc_box bottom bottom-r">
          <div class="descr-bc__title">начисление турнирных очков</div>
          <div class="row">
            <div class="col-lg-6 col-md-12">
              <ul>
                <li>
                  Присоединение к матчу 
                  +10 очков
                </li>
                <li>
                  Проход первого раунда 
                  +20 очков
                </li>
              </ul>
            </div>
            <div class="col-lg-6 col-md-12">
              <ul>
                <li>
                  Проход в финалы 
                  +30 очков
                </li>
                <li>
                  Победа в турнире 
                  +70 очков
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>

      <div class="col-lg-4 col-md-12">
        <div class="descr-bc_box bottom">
          <div class="descr-bc__title">Время старта</div>

          <div class="descr-bc__descr">Европа - суббота, в 18:00 UTC</div>
        </div>
      </div>

    </div>
  </div>
</div>


</div>


 

<?php echo $footer; ?>
