<div class="box">
        <div class="box-content">
            <div class="banner">

                <div id="banner<?php echo $module; ?>" class="banner">
                  <?php foreach ($banners as $banner) { ?>
                  <?php if ($banner['link']) { ?>
                  <div><a href="<?php echo $banner['link']; ?>" class="image-hover-effect"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a></div>
                  <?php } else { ?>
                  <div class="image-hover-effect"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></div>
                  <?php } ?>
                  <?php } ?>
                </div>
                
                
                

            </div>
        </div>
</div>
