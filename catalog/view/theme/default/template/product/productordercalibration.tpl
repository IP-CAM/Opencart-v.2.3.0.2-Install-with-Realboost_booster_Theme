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
		rrf =  resp.response;
		rrf = JSON.parse(rrf);
		if (rrf.success){
			
			alert("ok computer");//товар удачно оформлен
			
			
			}
		
		}
	battleCupErrorHandlerError = function(resp){
		alert("  Not Ok computer");
		}

	data =  {product_id:<?php echo $product_id;?>,fname:'confirmbattlecup'}
</script>


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

               <select id="selectRank">

                 <option value="0" data-imagesrc="<?php echo $img_path; ?>rank-icon/rank1_0.png">Herald[0]</option>
                 <option value="0" data-imagesrc="<?php echo $img_path; ?>rank-icon/rank1_1.png">Herald[1]</option>
                 <option value="0" data-imagesrc="<?php echo $img_path; ?>rank-icon/rank1_2.png">Herald[2]</option>
                 <option value="0" data-imagesrc="<?php echo $img_path; ?>rank-icon/rank1_3.png">Herald[3]</option>
                 <option value="0" data-imagesrc="<?php echo $img_path; ?>rank-icon/rank1_4.png">Herald[4]</option>
                 <option value="0" data-imagesrc="<?php echo $img_path; ?>rank-icon/rank1_5.png">Herald[5]</option>
                 <option value="0" data-imagesrc="<?php echo $img_path; ?>rank-icon/rank2_0.png">Guardian[0]</option>
                 <option value="0" data-imagesrc="<?php echo $img_path; ?>rank-icon/rank2_1.png">Guardian[1]</option>

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
