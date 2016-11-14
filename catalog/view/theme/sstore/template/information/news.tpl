<?php echo $header; ?><?php echo $content_top; ?>
<div id="container"><?php echo $column_left; ?><?php echo $column_right; ?>
<article id="content">
  <div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
  </div>
  <?php if (isset($news_info)) { ?>
    <div class="content-news">
      <div class="news" <?php if ($image) { echo 'style="min-height:' . $min_height . 'px;"'; } ?>>
        <?php if ($image) { ?>
          <div class="image">
            <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a>
          </div>
        <?php } ?>
        <h3><?php echo $heading_title; ?></h3>
        <?php echo $description; ?>
      </div>
      <div>
        <?php if ($addthis) { ?>
          <div style="margin:25px 0px;">
            <div class="addthis_toolbox addthis_default_style addthis_32x32_style">
              <a class="addthis_button_email"></a>
              <a class="addthis_button_print"></a>
              <a class="addthis_button_preferred_1"></a>
              <a class="addthis_button_preferred_2"></a>
              <a class="addthis_button_preferred_3"></a>
              <a class="addthis_button_preferred_4"></a>
              <a class="addthis_button_compact"></a>
              <a class="addthis_counter addthis_bubble_style"></a>
            </div>
            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js"></script>
          </div>
        <?php } ?>
      </div>
      <div class="buttons">
        <div class="right">
          <a onclick="location='<?php echo $news; ?>'" class="button"><span><?php echo $button_news; ?></span></a>
        </div>
      </div>
    </div>
  <?php } elseif (isset($news_data)) { ?>
    <div class="panelnews">
        <?php foreach ($news_data as $news) { ?>
        
          <div class="panelcollapsed">
            <div class="panelimage">
                <img class="" src="<?php echo $news['image']; ?>" alt="<?php echo $news['title']; ?>" />
                <div class="paneldata"><?php echo $news['posted']; ?></div>
            </div>
            <h2><a href="<?php echo $news['href']; ?>"><?php echo $news['title']; ?></a></h2>
            <div class="panelcontent">
              <?php echo $news['description']; ?><br />
              </p>
              <a href="<?php echo $news['href']; ?>" class="button"> <?php echo $text_more; ?></a>
            </div>
          </div>
        <?php } ?>
    </div>
  <?php } ?>
  </article>
  <div class="clearfix"></div>
  </div>
  <?php echo $content_bottom; ?>

<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').colorbox({
		overlayClose: true,
		opacity: 0.5,
		rel: "colorbox"
	});
});
//--></script>

<?php echo $footer; ?>