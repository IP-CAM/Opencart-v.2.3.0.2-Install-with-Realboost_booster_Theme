<!-- Banner -->
<div class="banner">
<?php foreach ($banners as $banner) { ?>
  <div class="banner-background" style="background: url(<?php echo $banner['image2']; ?>) no-repeat center top;">
    <div class="container">
      <div class="row">

        <div class="col-lg-1 col-1 my-auto col-pad"><div class="prev"><img src="<?php  echo $img_path; ?>icons/prev.png" alt="prev"></div></div>

        <div class="col-lg-10 col-10">
          <h1><?php echo $banner['title']; ?></h1>

          <p>
           <?php echo $banner['descr']; ?>
          </p>

          <a href="#" class="button">Подробнее</a>
        </div>

        <div class="col-lg-1 col-1 my-auto col-pad"><div class="next"><img src="<?php  echo $img_path; ?>icons/next.png" alt="next"></div></div>

      </div>
    </div>
  </div>
<?php } ?>
</div>
