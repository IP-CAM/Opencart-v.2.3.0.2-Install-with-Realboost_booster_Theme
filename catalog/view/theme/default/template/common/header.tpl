<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>

<!-- template scripts -->
<link rel="stylesheet" href="<?php echo $css_path; ?>bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<?php echo $css_path; ?>style.css">
<link rel="stylesheet" type="text/css" href="<?php echo $css_path; ?>common-style.css">
<link rel="stylesheet" href="<?php echo $css_path; ?>media.css">
<link rel="stylesheet" href="<?php echo $css_path; ?>animate.css">

<script src="<?php echo $js_path; ?>jquery.min.js"></script>
<script src="<?php echo $js_path; ?>bootstrap.min.js"></script>

<link rel="stylesheet" href="<?php echo $css_path; ?>magnific-popup.css">
<script src="<?php echo $js_path; ?>js/jquery.magnific-popup.js"></script>
<script src="<?php echo $js_path; ?>wow.min.js"></script>
<script>
    new WOW().init();
</script>
<link rel="stylesheet" href="<?php echo $css_path; ?>slick.css">
<link rel="stylesheet" href="<?php echo $css_path; ?>slick-theme.css">
<script src="<?php echo $js_path; ?>slick.min.js"></script>

<link rel="stylesheet" href="<?php echo $css_path; ?>ion.rangeSlider.css">
<script src="<?php echo $js_path; ?>ion.rangeSlider.min.js"></script>

<!-- template scripts -->

<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body>


<!-- Header -->
<header>
  <div class="container">
    <div class="row justify-content-between">

      <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6 col-5 my-auto">
          <a href="index.html" class="logo"><img src="<?php echo $img_path; ?>logo.png" alt="RealBoost"></a>
      </div>

      <div class="col-lg-6 my-auto dws-hide">
        <nav class="dws-menu">
          <ul>
          	<?php if (isset($menu['items'])){
          	    foreach ($menu['items'] as $value) {?>
                    <li><a <?php echo ($value['has_link'])?'href="'.$value['link'].'"':'';?>><?php echo $value['title'];?>   <?php echo (!empty($value['sub_items']))?'<img src="'.$img_path.'icons/bottom-arrow.png" alt="arrow"> ':'';?></a>
                      <?php if (!empty($value['sub_items'])){?>
                      <ul>
                      	<?php foreach($value['sub_items'] as $val){?>
                      		
                        	<li><a href="<?php echo $val['link'];?>"><?php echo $val['title'];?></a></li>
                       		<?php  if(!empty($val['sub_items'])){?>
                       		    <?php foreach($val['sub_items'] as $val){?>
                       		    	<li><a href="<?php echo $val['link'];?>"><?php echo $val['title'];?></a></li>
                       		    <?php }?>
                       		<?php } ?>
                        <?php }?>
                        
                      </ul>
                      <?php }?>
                      
                    </li>
            	<?php }
          	}?>
           
          </ul>
        </nav>
      </div>
<script>
$(document).ready(function () {
	$('.dws-menu a').each(function () {
		if (this.href == window.location) {
			$(this).addClass('active');
		}
	});
});
</script>

      <div class="col-xl-3 col-lg-2 col-md-5 col-sm-3 col-4 my-auto between">
	  <?php if ($logged) { ?>
		<div class="login">
			  
		  <a class="popup-with-form" href="#login"><img src="<?php echo $img_path; ?>icons/profile.png" alt="profile"><span><?php echo $logged_name;?></span></a>
		</div>
		<div class="cart">
			  <a href="<?php echo $shopping_cart; ?>"><div class="cart-items">2</div><img src="<?php echo $img_path; ?>icons/cart.png" alt="cart"><span><?php echo $text_shopping_cart; ?></span></a>
			</div>
	  <?php } else { ?>
			<div class="login">
			  
			  <a class="popup-with-form" href="#login"><img src="<?php echo $img_path; ?>icons/profile.png" alt="profile"><span>Войти</span></a>
			</div>

			<div class="cart">
			  <a href="#"><img src="<?php echo $img_path; ?>icons/cart.png" alt="cart"><span>Корзина</span></a>
			</div>
      <?php } ?>
      </div>

   <div class="col-2 burger">
        <div class="header-menu-container">
          <a href="#"  class="header-menu"><img src="<?php echo $img_path; ?>icons/menu.png" alt="cart"></a>
        </div>

      </div>

    </div>
  </div>
</header>

<div class="header-substrate"></div>