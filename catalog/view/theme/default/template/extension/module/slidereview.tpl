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
		
	<?php foreach ($reviews as $review) {?>	
      <div class="col-lg-4">
        <div class="review">
          <div class="review-top">
            <div class="review-img">
              <img src="<?php echo $review['photo']; ?>" alt="icon-profile">
            </div>

            <div class="review-profile">
              <div class="review-name"><?php echo $review['author']; ?></div>
              <div class="review-data"><?php echo $review['date']; ?></div>
            </div>
          </div>

          <div class="review-bottom">
           <div class="review-descr">
             <?php echo $review['text']; ?>
           </div>
          </div>
        </div>
      </div>

      
    
	<?php }?>
	
	
	</div>
  </div>
</div>