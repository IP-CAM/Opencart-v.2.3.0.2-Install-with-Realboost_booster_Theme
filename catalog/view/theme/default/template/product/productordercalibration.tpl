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



<!-- checkout -->
<div class="checkout calculation">
  <div class="container">
    <div class="row">
      <div class="col-lg-6 offset-lg-3">
        <div class="checkout-box">
          <div class="checkout-title">Сделай рассчет и получи скидку на калибровку Dota 2</div>

          <form>
            <div class="row">
              <div class="col-lg-6 col-md-6">
               <label>Ранг в прошлом сезоне</label><br>
               <select>
                 <option>Herald</option>
                 <option>Herald</option>
                 <option>Herald</option>
               </select> 
              </div>

              <div class="col-lg-6 col-md-6">
                <label for="text">MMR в прошлом сезоне</label>
                <input id="text" name="text" type="text" placeholder="6" required="">
              </div>
            </div>

            <div class="checkout-discount"><s>1780</s> <span>1290 руб.</span></div>

            <button type="submit">Оформить заказ</button>

          </form>

        </div>
      </div>
    </div>
  </div>
</div>


<!-- info-block -->
<div class="info-block">
  <div class="container">
    <div class="info-block__title">Как это было</div>
    <div class="row">
      <div class="col-lg-4">
        <div class="info-block__container">
          <div class="info-block__orange">8/10</div>
          <div class="info-block__descr">Среднее число побед</div>
        </div>
      </div>
      <div class="col-lg-4">
        <div class="info-block__container">
          <div class="info-block__orange">370</div>
          <div class="info-block__descr">Заказов за 2 недели</div>
        </div>
      </div>
      <div class="col-lg-4">
        <div class="info-block__container">
          <div class="info-block__orange">350</div>
          <div class="info-block__descr">Средний + ММР</div>
        </div>
      </div>
    </div>
  </div>
</div>


</div>

 
 
 
<?php echo $content_bottom; ?>
<?php echo $column_right; ?>
 
<script>
	 <?php foreach($options as $option):
		$opt = array();
		 foreach ($option['product_option_value'] as $key=>$val){
			 $opt[$val['name']]=$val;
			 $opt[$val['name']]['key'] = $key;
		 }
   		 if ($option['name']=='ваш рейтинг'){  ?>	
   		 	var array_current_mmr = <?php echo  str_replace('\u0440.','',json_encode($opt));?>;
	<?php }?>
  		<?php if ($option['name']=='желаемый рейтинг'){  ?>	
 		var array_preferable_mmr = <?php echo   str_replace('\u0440.','',json_encode($opt));?>;
	 		
	  <?php }?>
	<?php endforeach;?>
</script>
 

<?php echo $footer; ?>
