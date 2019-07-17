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
    <?php if ($cartisnotempty) {?> 
        <!-- Шаги -->
        <div class="steps">
          <div class="container">
        
            <div class="def-title steps-title">Бустим рейтинг на ваших глазах!</div>
        
            <div class="steps-points">
        
              <div class="step">
                <div class="step-title"><span>1</span>Шаг</div>
                <div class="step-descr">Рассчитайте стоимость</div>
              </div>
        
                    
              <div class="step active">
                <div class="step-title"><span>2</span>Шаг</div>
                <div class="step-descr">Введите данные</div>
              </div>
        
            </div>
        
          </div>
        </div>
        
        
        <!-- checkout -->
        <div class="checkout boost-rating-checkout">
          <div class="container">
            <div class="row">
              <div class="col-lg-6 offset-lg-3">
                <div class="checkout-box">
                  <div class="checkout-title">Введите данные</div>
        
                  <form>
                    <div class="row">
                      <div class="col-lg-6 col-md-6">
                      
                        <input id="email" <?php echo ($registerr['login'])?'readonly value = "jvkfhdb"':'';?>  name="email" type="email" placeholder="E-mail" required="">
                      </div>
        
                      <div class="col-lg-6 col-md-6">
                        <input id="text" name="telephone" type="text" placeholder="Телефон" required="">
                      </div>
        			  
        			  <div class="col-lg-6 col-md-6">
                        <label for="log">Логин от аккаунта Steam</label>
                        <input id="log" name="stlog" type="text"  required="">
                      </div>
        
                      <div class="col-lg-6 col-md-6">
                        <label for="password">Пароль от аккаунта Steam</label>
                        <input id="password" name="stpwd" type="password"  required="">
                      </div>
        
                      <div class="col-lg-12 col-md-12">
                        <label for="text">Вконтакте для быстрой связи</label>
                        <input id="text" name="vkpath" type="text">
                      </div>
        
                      <div class="col-lg-12 col-md-12">
                        <textarea name="comment" placeholder="Пожелания для бустера"></textarea>
                      </div>
        
                      <div class="col-lg-6 col-md-6 checkbox-auth">
                        <input type="checkbox" id="checkbox" name = "agreement"  required="">
                        <label for="checkbox">Я согласен с условиями пользовательского соглашения</label>
                      </div>
        
                      <div class="col-lg-6 col-md-6">
                        <button type="submit" onclick="postData('index.php?route=checkout/confirm',{ffs:'confirm'},false,'POST',function(ddd){alert('ok Computer');window.location = 'index.php';});">Я все сделал</button>
                      </div>
        
                    </div>
        
        
                  </form>
        
                </div>
              </div>
            </div>
          </div>
        </div>
 <?php }?>   
    
    <?php echo $content_bottom; ?>
 </div>

<?php echo $column_right; ?>
  

<?php echo $footer; ?>
