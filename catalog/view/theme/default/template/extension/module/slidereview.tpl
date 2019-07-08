<!-- Reviews -->
<div class="reviews">
  <div class="container">

    <div class="review-title">
      <h2>Отзывы</h2>

      <div class="review-arrow">
        <div class="review-prev"><img src="<?php  echo $img_path; ?>icons/prev.png" alt="prev"></div>
        <div class="review-next"><img src="<?php  echo $img_path; ?>icons/next.png" alt="next"></div>
      </div>

    </div>

    <div class="row review-slider">
		
	<?php foreach ($banners as $banner) {?>	
      <div class="col-lg-4">
        <div class="review">
          <div class="review-top">
            <div class="review-img">
              <img src="<?php  echo $img_path; ?>reviews/1.png" alt="icon-profile">
            </div>

            <div class="review-profile">
              <div class="review-name">Name1</div>
              <div class="review-data">26.03.2015</div>
            </div>
          </div>

          <div class="review-bottom">
           <div class="review-descr">
             Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum...
           </div>
          </div>
        </div>
      </div>

      
    </div>
	<?php }?>
  </div>
</div>