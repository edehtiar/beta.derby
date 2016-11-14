
    <div id="da-slider<?php echo $module; ?>" class="da-slider">
        <?php foreach ($banners_plus as $banner) { ?>
            <div class="da-slide">
        		<h2><?php echo $banner['title']; ?></h2>
        		<p><?php echo $banner['description']; ?></p>
                <p class="da-link-box"><a href="<?php echo $banner['link']; ?>" class="da-link"><?php echo $banner['button']; ?></a></p>                
        		<div class="da-img">
        			<img src="<?php echo $banner['image']; ?>" alt="image01" />
        		</div>
        	</div>
    	<?php } ?>
        <div class="da-arrows">
			<span class="da-arrows-prev"><i class="fa fa-angle-left"></i></span>
			<span class="da-arrows-next"><i class="fa fa-angle-right"></i></span>
    	</div>
    </div>
    <script type="text/javascript"><!--
$('#da-slider<?php echo $module; ?>').cslider({
   	current		: 0, 	
	autoplay	: 1,
	interval	: 5000  
	

});

$('#da-slider<?php echo $module; ?>').hover(
    function () {
        $(this).cslider("stop");
    },
    function () {
        $(this).cslider("start");
    }
);
--></script>
