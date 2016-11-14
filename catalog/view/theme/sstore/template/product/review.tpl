<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>
<div class="review-list">
  <div class="author"><b><?php echo $review['author']; ?></b> <?php echo $review['date_added']; ?></div>
  <div class="rating"><?php for ($i = 1; $i <= 5; $i++) { ?>
      <?php if ($review['rating'] < $i) { ?>
      <span><i class="fa fa-star-o stars-rev"></i></span>
      <?php } else { ?>
      <span><i class="fa fa-star stars-rev"></i></span>
      <?php } ?>
      <?php } ?>
</div>
  <div class="text"><?php echo $review['text']; ?></div>
</div>
<?php } ?>
<div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
<div class="content"><?php echo $text_no_reviews; ?></div>
<?php } ?>


