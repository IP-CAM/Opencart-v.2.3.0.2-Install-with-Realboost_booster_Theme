
<!-- bread-Banner -->
<div class="bread-banner">
  <div class="container">

    <h1><?php echo $title; ?></h1>
	
    	
	<?php if ($breadcrumbs){ ?>
    <!-- Хлебные крошки -->
    
    <div class="bread-crumbs">
      <ul>
      	<?php foreach ($breadcrumbs as $crumb){?>
        <li><a href="<?php echo $crumb['href'] ?>"><?php  echo $crumb['text'];?></a></li>
        <?php }?>
        
      </ul>
    </div>
	
	<?php  } ?>
  
  </div>
</div>