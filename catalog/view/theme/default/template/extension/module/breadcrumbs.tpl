
<!-- bread-Banner -->
<div class="bread-banner">
  <div class="container">

    <h1><?php echo TemplateLoader::getvars('title'); ?></h1>
	 <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
    <!-- Хлебные крошки -->
    <div class="bread-crumbs">
      <ul>
        <li><a href="index.html">Главная</a></li>
        <li class="active"><a href="#">Заказать буст рейтинга</a></li>
      </ul>
    </div>

  </div>
</div>