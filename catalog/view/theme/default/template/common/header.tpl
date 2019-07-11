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
<title><?php echo $title; TemplateLoader::savevar($title, 'title'); ?></title>
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
            <li><a href="#">Услуги <img src="<?php echo $img_path; ?>icons/bottom-arrow.png" alt="arrow"></a>
              <ul>
                <li><a href="uslugi/prokachka-mmr">заказать буст рейтинга</a></li>
                <li><a href="order-calibration.html">Заказать калибровку</a></li>
                <li><a href="boost-rating.html">Слить Лоу приорити</a></li>
                <li><a href="battle-cup.html">Победить Battle Cup</a></li>
                <li><a href="training.html">Обучение от бустеров</a></li>
              </ul>
            </li>
            <li><a href="guarantees.html">Гарантии</a></li>
            <li><a href="job.html">Работа</a></li>
          </ul>
        </nav>
      </div>

      <div class="col-xl-3 col-lg-2 col-md-5 col-sm-3 col-4 my-auto between">
        <div class="login">
          
          <a class="popup-with-form" href="#login"><img src="<?php echo $img_path; ?>icons/profile.png" alt="profile"><span>Войти</span></a>
        </div>

        <div class="cart">
          <a href="#"><img src="<?php echo $img_path; ?>icons/cart.png" alt="cart"><span>Корзина</span></a>
        </div>
        
      </div>

      <div class="col-2 burger">
        <div class="header-menu-container">
          <a href="#"  class="header-menu"><img src="<?php echo $img_path; ?>icons/menu.png" alt="cart"></a>
        </div>
      </div>

    </div>
  </div>
</header>
