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
		window.location="index.php";
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

                <?php if ($options) { ?>
                	 <?php foreach ($options as $option) {?>
                	 	 <?php if ($option['type'] == 'radio') { ?>
                	 	 
                	 	 	 <?php foreach ($option['product_option_value'] as $option_value) { 
                	 	 	     $val=$option['product_option_id'];?>
                	 	 	 
                	 	 	 	 <option value="<?php echo $option_value['product_option_value_id']; ?>" name="option[<?php echo $option['product_option_id']; ?>]"  data-imagesrc="<?php echo $option_value['image'];?>"><?php echo $option_value['name'];?></option> 
                	 	 	 <?php }?>
                	 	 <?php }?>
                	 <?php }?>
                	
                
                <?php }?>

               </select> 
				
              </div>

              <div class="col-lg-6 col-md-6">
                <label for="text">MMR в прошлом сезоне</label>
                <input id="text" name="text" type="text" placeholder="6" required="">
              </div>
            </div>
	
            <div class="checkout-discount"><s><?php echo $price;?></s> <span><?php echo $price;?></span></div>
			<script>
				var ffs1 = function(){
                	var element = document.querySelector('.dd-selected-value');
                	element.setAttribute('name', 'option[<?php echo $val; ?>]');}
                	 		
            </script>
            <button  type="submit" onclick = "ffs1();postData('index.php?route=checkout/cart/add',{ffs:'',fname:'confirmbattlecup',product_id:<?php echo $product_id;?>},false,'POST',battleCupErrorHandlerOk,battleCupErrorHandlerError);" >Оформить заказ</button>

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
 


<?php echo $footer; ?>
