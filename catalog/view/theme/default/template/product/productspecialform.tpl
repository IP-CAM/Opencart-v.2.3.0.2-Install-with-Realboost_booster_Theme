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
