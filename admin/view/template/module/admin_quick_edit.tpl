<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <a onclick="updateSettingModule();" data-form="form-setting" class="button-save btn btn-primary"><i class="fa fa-save"></i></a>
		<a href="<?php echo $cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default" id="setting-alert">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
	  <div class="panel-body">
	    <div class="maxy-backdrop"></div>
	    <div class="messages-body"></div>
		<div class="row">
		  <div class="col-md-3">
		    <ul class="nav nav-pills nav-stacked">
			  <li class="active"><a href="#tab-setting-category" data-toggle="tab"><?php echo $header_category; ?></a></li>
			  <li><a href="#tab-setting-product" data-toggle="tab"><?php echo $header_product; ?></a></li>
			  <li><a href="#tab-setting-filter" data-toggle="tab"><?php echo $header_filter; ?></a></li>
			  <li><a href="#tab-setting-attribute" data-toggle="tab"><?php echo $header_attribute; ?></a></li>
			  <li><a href="#tab-setting-option" data-toggle="tab"><?php echo $header_option; ?></a></li>
			  <li><a href="#tab-setting-manufacturer" data-toggle="tab"><?php echo $header_manufacturer; ?></a></li>
			  <li><a href="#tab-setting-review" data-toggle="tab"><?php echo $header_review; ?></a></li>
			  <li><a href="#tab-setting-information" data-toggle="tab"><?php echo $header_information; ?></a></li>
			  <li><a href="#tab-setting-customer" data-toggle="tab"><?php echo $header_customer; ?></a></li>
			  <li><a href="#tab-setting-order" data-toggle="tab"><?php echo $header_order; ?></a></li>
            </ul>
		  </div>
		  <div class="col-md-9">
            <form method="post" enctype="multipart/form-data" id="form-setting" class="form-horizontal">
			  <div class="tab-content">
                <div class="tab-pane active" id="tab-setting-category">
			      <div class="table-responsive">
				    <table class="table table-striped table-hover table-bordered">
					  <thead>
					    <tr>
						  <td class="text-left"><?php echo $text_name_settings; ?></td>
						  <td class="text-center" width="1%"><?php echo $entry_status; ?></td>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
						  <td class="text-left"><?php echo $entry_image; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_category_image"<?php echo $admin_quick_edit_category_image ? ' checked="checked"' : '' ?> id="admin_quick_edit_category_image" />
							  <label for="admin_quick_edit_category_image"></label>
						    </div>
						  </td>
					    </tr>
					    <tr>
						  <td class="text-left"><?php echo $entry_category_name; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_category_name"<?php echo $admin_quick_edit_category_name ? ' checked="checked"' : '' ?> id="admin_quick_edit_category_name" />
							  <label for="admin_quick_edit_category_name"></label>
						    </div>
						  </td>
					    </tr>
					    <tr>
						  <td class="text-left"><?php echo $entry_general; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_category_general"<?php echo $admin_quick_edit_category_general ? ' checked="checked"' : '' ?> id="admin_quick_edit_category_general" />
							  <label for="admin_quick_edit_category_general"></label>
						    </div>
						  </td>
					    </tr>
					    <tr>
						  <td class="text-left"><?php echo $entry_seo; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_category_seo"<?php echo $admin_quick_edit_category_seo ? ' checked="checked"' : '' ?> id="admin_quick_edit_category_seo" />
							  <label for="admin_quick_edit_category_seo"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_category_parent; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_category_parent"<?php echo $admin_quick_edit_category_parent ? ' checked="checked"' : '' ?> id="admin_quick_edit_category_parent" />
							  <label for="admin_quick_edit_category_parent"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_filter; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_category_filter"<?php echo $admin_quick_edit_category_filter ? ' checked="checked"' : '' ?> id="admin_quick_edit_category_filter" />
							  <label for="admin_quick_edit_category_filter"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_sort_order; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_category_sort_order"<?php echo $admin_quick_edit_category_sort_order ? ' checked="checked"' : '' ?> id="admin_quick_edit_category_sort_order" />
							  <label for="admin_quick_edit_category_sort_order"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_category_top; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_category_top"<?php echo $admin_quick_edit_category_top ? ' checked="checked"' : '' ?> id="admin_quick_edit_category_top" />
							  <label for="admin_quick_edit_category_top"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_status; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_category_status"<?php echo $admin_quick_edit_category_status ? ' checked="checked"' : '' ?> id="admin_quick_edit_category_status" />
							  <label for="admin_quick_edit_category_status"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_store; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_category_store"<?php echo $admin_quick_edit_category_store ? ' checked="checked"' : '' ?> id="admin_quick_edit_category_store" />
							  <label for="admin_quick_edit_category_store"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_design; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_category_design"<?php echo $admin_quick_edit_category_design ? ' checked="checked"' : '' ?> id="admin_quick_edit_category_design" />
							  <label for="admin_quick_edit_category_design"></label>
							</div>
						  </td>
					    </tr>
					  </tbody>
					</table>
				  </div>
		        </div>
			    <div class="tab-pane" id="tab-setting-product">
				  <div class="table-responsive">
					<table class="table table-striped table-hover table-bordered">
					  <thead>
					    <tr>
						  <td class="text-left"><?php echo $text_name_settings; ?></td>
						  <td class="text-center" width="1%"><?php echo $entry_status; ?></td>
						</tr>
					  </thead>
					  <tbody>
					    <tr>
						  <td class="text-left"><?php echo $entry_image; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_image"<?php echo $admin_quick_edit_product_image ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_image" />
							  <label for="admin_quick_edit_product_image"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_product_name; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_name"<?php echo $admin_quick_edit_product_name ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_name" />
							  <label for="admin_quick_edit_product_name"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_general; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_general"<?php echo $admin_quick_edit_product_general ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_general" />
							  <label for="admin_quick_edit_product_general"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_product_category; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_category"<?php echo $admin_quick_edit_product_category ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_category" />
							  <label for="admin_quick_edit_product_category"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_product_manufacturer; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_manufacturer"<?php echo $admin_quick_edit_product_manufacturer ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_manufacturer" />
							  <label for="admin_quick_edit_product_manufacturer"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_product_code; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_code"<?php echo $admin_quick_edit_product_code ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_code" />
							  <label for="admin_quick_edit_product_code"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_product_model; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_model"<?php echo $admin_quick_edit_product_model ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_model" />
							  <label for="admin_quick_edit_product_model"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_product_model_required; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_model_required"<?php echo $admin_quick_edit_product_model_required ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_model_required" />
							  <label for="admin_quick_edit_product_model_required"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_product_price; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_price"<?php echo $admin_quick_edit_product_price ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_price" />
							  <label for="admin_quick_edit_product_price"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_product_tax; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_tax"<?php echo $admin_quick_edit_product_tax ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_tax" />
							  <label for="admin_quick_edit_product_tax"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_product_quantity; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_quantity"<?php echo $admin_quick_edit_product_quantity ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_quantity" />
							  <label for="admin_quick_edit_product_quantity"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_status; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_status"<?php echo $admin_quick_edit_product_status ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_status" />
							  <label for="admin_quick_edit_product_status"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_product_stock; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_stock"<?php echo $admin_quick_edit_product_stock ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_stock" />
							  <label for="admin_quick_edit_product_stock"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_seo; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_seo"<?php echo $admin_quick_edit_product_seo ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_seo" />
							  <label for="admin_quick_edit_product_seo"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_date_added; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_date"<?php echo $admin_quick_edit_product_date ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_date" />
							  <label for="admin_quick_edit_product_date"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_product_weight; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_weight"<?php echo $admin_quick_edit_product_weight ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_weight" />
							  <label for="admin_quick_edit_product_weight"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_filter; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_filter"<?php echo $admin_quick_edit_product_filter ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_filter" />
							  <label for="admin_quick_edit_product_filter"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_store; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_store"<?php echo $admin_quick_edit_product_store ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_store" />
							  <label for="admin_quick_edit_product_store"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_product_download; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_download"<?php echo $admin_quick_edit_product_download ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_download" />
							  <label for="admin_quick_edit_product_download"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_product_related; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_related"<?php echo $admin_quick_edit_product_related ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_related" />
							  <label for="admin_quick_edit_product_related"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_product_attribute; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_attribute"<?php echo $admin_quick_edit_product_attribute ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_attribute" />
							  <label for="admin_quick_edit_product_attribute"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_product_option; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_option"<?php echo $admin_quick_edit_product_option ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_option" />
							  <label for="admin_quick_edit_product_option"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_product_discount; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_discount"<?php echo $admin_quick_edit_product_discount ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_discount" />
							  <label for="admin_quick_edit_product_discount"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_product_special; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_special"<?php echo $admin_quick_edit_product_special ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_special" />
							  <label for="admin_quick_edit_product_special"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_product_images; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_images"<?php echo $admin_quick_edit_product_images ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_images" />
							  <label for="admin_quick_edit_product_images"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_product_reward; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_reward"<?php echo $admin_quick_edit_product_reward ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_reward" />
							  <label for="admin_quick_edit_product_reward"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_design; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_design"<?php echo $admin_quick_edit_product_design ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_design" />
							  <label for="admin_quick_edit_product_design"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_product_view; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_product_view"<?php echo $admin_quick_edit_product_view ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_view" />
							  <label for="admin_quick_edit_product_view"></label>
							</div>
						  </td>
					    </tr>
					  </tbody>
					</table>
				  </div>
				  <div class="form-group">
					<label class="col-sm-4 control-label" for="input-default-quantity"><span data-toggle="tooltip" title="<?php echo $help_default_quantity; ?>"><?php echo $entry_default_quantity; ?></span></label>
					<div class="col-sm-2">
					  <input type="text" name="admin_quick_edit_product_default_quantity" value="<?php echo $admin_quick_edit_product_default_quantity; ?>" placeholder="<?php echo $entry_default_quantity; ?>" id="input-default-quantity" class="form-control" />
					</div>
					<label class="col-sm-4 control-label" for="input-default-min-quantity"><span data-toggle="tooltip" title="<?php echo $help_default_min_quantity; ?>"><?php echo $entry_default_min_quantity; ?></span></label>
					<div class="col-sm-2">
					  <input type="text" name="admin_quick_edit_product_default_min_quantity" value="<?php echo $admin_quick_edit_product_default_min_quantity; ?>" placeholder="<?php echo $entry_default_min_quantity; ?>" id="input-default-min-quantity" class="form-control" />
					</div>
				  </div>
				   <div class="form-group">
					<label class="col-sm-4 control-label" for="input-default-stock"><span data-toggle="tooltip" title="<?php echo $help_default_stock; ?>"><?php echo $entry_default_stock; ?></span></label>
					<div class="col-sm-2 text-center">
					  <div class="input-checkbox">
					    <input type="checkbox" class="checkbox" name="admin_quick_edit_product_default_stock"<?php echo $admin_quick_edit_product_default_stock ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_default_stock" />
						<label for="admin_quick_edit_product_default_stock"></label>
					  </div>
					</div>
					<label class="col-sm-4 control-label" for="input-default-shipping"><span data-toggle="tooltip" title="<?php echo $help_default_shipping; ?>"><?php echo $entry_default_shipping; ?></span></label>
					<div class="col-sm-2 text-center">
					  <div class="input-checkbox">
					    <input type="checkbox" class="checkbox" name="admin_quick_edit_product_default_shipping"<?php echo $admin_quick_edit_product_default_shipping ? ' checked="checked"' : '' ?> id="admin_quick_edit_product_default_shipping" />
						<label for="admin_quick_edit_product_default_shipping"></label>
					  </div>
					</div>
				  </div>
		        </div>
			    <div class="tab-pane" id="tab-setting-filter">
				  <div class="table-responsive">
					<table class="table table-striped table-hover table-bordered">
					  <thead>
					    <tr>
						  <td class="text-left"><?php echo $text_name_settings; ?></td>
						  <td class="text-center" width="1%"><?php echo $entry_status; ?></td>
						</tr>
					  </thead>
					  <tbody>
					    <tr>
						  <td class="text-left"><?php echo $entry_filter_name; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_filter_name"<?php echo $admin_quick_edit_filter_name ? ' checked="checked"' : '' ?> id="admin_quick_edit_filter_name" />
							  <label for="admin_quick_edit_filter_name"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_sort_order; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_filter_sortorder"<?php echo $admin_quick_edit_filter_sortorder ? ' checked="checked"' : '' ?> id="admin_quick_edit_filter_sortorder" />
							  <label for="admin_quick_edit_filter_sortorder"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_filter_value; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_filter_value"<?php echo $admin_quick_edit_filter_value ? ' checked="checked"' : '' ?> id="admin_quick_edit_filter_value" />
							  <label for="admin_quick_edit_filter_value"></label>
							</div>
						  </td>
					    </tr>
					  </tbody>
					</table>
				  </div>
			    </div>
			    <div class="tab-pane" id="tab-setting-attribute">
				  <div class="table-responsive">
					<table class="table table-striped table-hover table-bordered">
					  <thead>
					    <tr>
						  <td class="text-left"><?php echo $text_name_settings; ?></td>
						  <td class="text-center" width="1%"><?php echo $entry_status; ?></td>
						</tr>
					  </thead>
					  <tbody>
					    <tr>
						  <td class="text-left"><?php echo $entry_attribute_name; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_attribute_name"<?php echo $admin_quick_edit_attribute_name ? ' checked="checked"' : '' ?> id="admin_quick_edit_attribute_name" />
							  <label for="admin_quick_edit_attribute_name"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_attribute_attribute_group; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_attribute_attribute_group"<?php echo $admin_quick_edit_attribute_attribute_group ? ' checked="checked"' : '' ?> id="admin_quick_edit_attribute_attribute_group" />
							  <label for="admin_quick_edit_attribute_attribute_group"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_attribute_group_name; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_attribute_group_name"<?php echo $admin_quick_edit_attribute_group_name ? ' checked="checked"' : '' ?> id="admin_quick_edit_attribute_group_name" />
							  <label for="admin_quick_edit_attribute_group_name"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_sort_order; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_attribute_sortorder"<?php echo $admin_quick_edit_attribute_sortorder ? ' checked="checked"' : '' ?> id="admin_quick_edit_attribute_sortorder" />
							  <label for="admin_quick_edit_attribute_sortorder"></label>
							</div>
						  </td>
					    </tr>
					  </tbody>
					</table>
			      </div>
				</div>
				<div class="tab-pane" id="tab-setting-option">
				  <div class="table-responsive">
					<table class="table table-striped table-hover table-bordered">
					  <thead>
					    <tr>
						  <td class="text-left"><?php echo $text_name_settings; ?></td>
						  <td class="text-center" width="1%"><?php echo $entry_status; ?></td>
						</tr>
					  </thead>
					  <tbody>
					    <tr>
						  <td class="text-left"><?php echo $entry_option_name; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_option_name"<?php echo $admin_quick_edit_option_name ? ' checked="checked"' : '' ?> id="admin_quick_edit_option_name" />
							  <label for="admin_quick_edit_option_name"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_sort_order; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_option_sortorder"<?php echo $admin_quick_edit_option_sortorder ? ' checked="checked"' : '' ?> id="admin_quick_edit_option_sortorder" />
							  <label for="admin_quick_edit_option_sortorder"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_option_value; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_option_value"<?php echo $admin_quick_edit_option_value ? ' checked="checked"' : '' ?> id="admin_quick_edit_option_value" />
							  <label for="admin_quick_edit_option_value"></label>
							</div>
						  </td>
					    </tr>
					  </tbody>
					</table>
			      </div>
				</div>
				<div class="tab-pane" id="tab-setting-manufacturer">
				  <div class="table-responsive">
					<table class="table table-striped table-hover table-bordered">
					  <thead>
					    <tr>
						  <td class="text-left"><?php echo $text_name_settings; ?></td>
						  <td class="text-center" width="1%"><?php echo $entry_status; ?></td>
						</tr>
					  </thead>
					  <tbody>
					    <tr>
						  <td class="text-left"><?php echo $entry_image; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_manufacturer_image"<?php echo $admin_quick_edit_manufacturer_image ? ' checked="checked"' : '' ?> id="admin_quick_edit_manufacturer_image" />
							  <label for="admin_quick_edit_manufacturer_image"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_manufacturer_name; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_manufacturer_name"<?php echo $admin_quick_edit_manufacturer_name ? ' checked="checked"' : '' ?> id="admin_quick_edit_manufacturer_name" />
							  <label for="admin_quick_edit_manufacturer_name"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_sort_order; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_manufacturer_sortorder"<?php echo $admin_quick_edit_manufacturer_sortorder ? ' checked="checked"' : '' ?> id="admin_quick_edit_manufacturer_sortorder" />
							  <label for="admin_quick_edit_manufacturer_sortorder"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_general; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_manufacturer_general"<?php echo $admin_quick_edit_manufacturer_general ? ' checked="checked"' : '' ?> id="admin_quick_edit_manufacturer_general" />
							  <label for="admin_quick_edit_manufacturer_general"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_seo; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_manufacturer_seo"<?php echo $admin_quick_edit_manufacturer_seo ? ' checked="checked"' : '' ?> id="admin_quick_edit_manufacturer_seo" />
							  <label for="admin_quick_edit_manufacturer_seo"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_store; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_manufacturer_store"<?php echo $admin_quick_edit_manufacturer_store ? ' checked="checked"' : '' ?> id="admin_quick_edit_manufacturer_store" />
							  <label for="admin_quick_edit_manufacturer_store"></label>
							</div>
						  </td>
					    </tr>
					  </tbody>
					</table>
			      </div>
				</div>
				<div class="tab-pane" id="tab-setting-review">
				  <div class="table-responsive">
					<table class="table table-striped table-hover table-bordered">
					  <thead>
					    <tr>
						  <td class="text-left"><?php echo $text_name_settings; ?></td>
						  <td class="text-center" width="1%"><?php echo $entry_status; ?></td>
						</tr>
					  </thead>
					  <tbody>
					    <tr>
						  <td class="text-left"><?php echo $entry_review_product; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_review_product"<?php echo $admin_quick_edit_review_product ? ' checked="checked"' : '' ?> id="admin_quick_edit_review_product" />
							  <label for="admin_quick_edit_review_product"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_review_author; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_review_author"<?php echo $admin_quick_edit_review_author ? ' checked="checked"' : '' ?> id="admin_quick_edit_review_author" />
							  <label for="admin_quick_edit_review_author"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_review_rating; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_review_rating"<?php echo $admin_quick_edit_review_rating ? ' checked="checked"' : '' ?> id="admin_quick_edit_review_rating" />
							  <label for="admin_quick_edit_review_rating"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_review_text; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_review_text"<?php echo $admin_quick_edit_review_text ? ' checked="checked"' : '' ?> id="admin_quick_edit_review_text" />
							  <label for="admin_quick_edit_review_text"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_status; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_review_status"<?php echo $admin_quick_edit_review_status ? ' checked="checked"' : '' ?> id="admin_quick_edit_review_status" />
							  <label for="admin_quick_edit_review_status"></label>
							</div>
						  </td>
					    </tr>
					  </tbody>
					</table>
			      </div>
				</div>
				<div class="tab-pane" id="tab-setting-information">
				  <div class="table-responsive">
					<table class="table table-striped table-hover table-bordered">
					  <thead>
					    <tr>
						  <td class="text-left"><?php echo $text_name_settings; ?></td>
						  <td class="text-center" width="1%"><?php echo $entry_status; ?></td>
						</tr>
					  </thead>
					  <tbody>
					    <tr>
						  <td class="text-left"><?php echo $entry_title; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_information_title"<?php echo $admin_quick_edit_information_title ? ' checked="checked"' : '' ?> id="admin_quick_edit_information_title" />
							  <label for="admin_quick_edit_information_title"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_sort_order; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_information_sortorder"<?php echo $admin_quick_edit_information_sortorder ? ' checked="checked"' : '' ?> id="admin_quick_edit_information_sortorder" />
							  <label for="admin_quick_edit_information_sortorder"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_bottom; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_information_bottom"<?php echo $admin_quick_edit_information_bottom ? ' checked="checked"' : '' ?> id="admin_quick_edit_information_bottom" />
							  <label for="admin_quick_edit_information_bottom"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_status; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_information_status"<?php echo $admin_quick_edit_information_status ? ' checked="checked"' : '' ?> id="admin_quick_edit_information_status" />
							  <label for="admin_quick_edit_information_status"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_general; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_information_general"<?php echo $admin_quick_edit_information_general ? ' checked="checked"' : '' ?> id="admin_quick_edit_information_general" />
							  <label for="admin_quick_edit_information_general"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_seo; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_information_seo"<?php echo $admin_quick_edit_information_seo ? ' checked="checked"' : '' ?> id="admin_quick_edit_information_seo" />
							  <label for="admin_quick_edit_information_seo"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_store; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_information_store"<?php echo $admin_quick_edit_information_store ? ' checked="checked"' : '' ?> id="admin_quick_edit_information_store" />
							  <label for="admin_quick_edit_information_store"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_design; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_information_design"<?php echo $admin_quick_edit_information_design ? ' checked="checked"' : '' ?> id="admin_quick_edit_information_design" />
							  <label for="admin_quick_edit_information_design"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_information_view; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_information_view"<?php echo $admin_quick_edit_information_view ? ' checked="checked"' : '' ?> id="admin_quick_edit_information_view" />
							  <label for="admin_quick_edit_information_view"></label>
							</div>
						  </td>
					    </tr>
					  </tbody>
					</table>
			      </div>
				</div>
				<div class="tab-pane" id="tab-setting-customer">
				  <div class="table-responsive">
					<table class="table table-striped table-hover table-bordered">
					  <thead>
					    <tr>
						  <td class="text-left"><?php echo $text_name_settings; ?></td>
						  <td class="text-center" width="1%"><?php echo $entry_status; ?></td>
						</tr>
					  </thead>
					  <tbody>
					    <tr>
						  <td class="text-left"><?php echo $entry_customer_name; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_customer_name"<?php echo $admin_quick_edit_customer_name ? ' checked="checked"' : '' ?> id="admin_quick_edit_customer_name" />
							  <label for="admin_quick_edit_customer_name"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_customer_email; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_customer_email"<?php echo $admin_quick_edit_customer_email ? ' checked="checked"' : '' ?> id="admin_quick_edit_customer_email" />
							  <label for="admin_quick_edit_customer_email"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_customer_group; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_customer_edit_group"<?php echo $admin_quick_edit_customer_edit_group ? ' checked="checked"' : '' ?> id="admin_quick_edit_customer_edit_group" />
							  <label for="admin_quick_edit_customer_edit_group"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_status; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_customer_status"<?php echo $admin_quick_edit_customer_status ? ' checked="checked"' : '' ?> id="admin_quick_edit_customer_status" />
							  <label for="admin_quick_edit_customer_status"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_customer_rss; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_customer_rss"<?php echo $admin_quick_edit_customer_rss ? ' checked="checked"' : '' ?> id="admin_quick_edit_customer_rss" />
							  <label for="admin_quick_edit_customer_rss"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_customer_approved; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_customer_approved"<?php echo $admin_quick_edit_customer_approved ? ' checked="checked"' : '' ?> id="admin_quick_edit_customer_approved" />
							  <label for="admin_quick_edit_customer_approved"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_customer_phone; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_customer_phone"<?php echo $admin_quick_edit_customer_phone ? ' checked="checked"' : '' ?> id="admin_quick_edit_customer_phone" />
							  <label for="admin_quick_edit_customer_phone"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_customer_password; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_customer_password"<?php echo $admin_quick_edit_customer_password ? ' checked="checked"' : '' ?> id="admin_quick_edit_customer_password" />
							  <label for="admin_quick_edit_customer_password"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_customer_field; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_customer_field"<?php echo $admin_quick_edit_customer_field ? ' checked="checked"' : '' ?> id="admin_quick_edit_customer_field" />
							  <label for="admin_quick_edit_customer_field"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_customer_address; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_customer_address"<?php echo $admin_quick_edit_customer_address ? ' checked="checked"' : '' ?> id="admin_quick_edit_customer_address" />
							  <label for="admin_quick_edit_customer_address"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_customer_history; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_customer_history"<?php echo $admin_quick_edit_customer_history ? ' checked="checked"' : '' ?> id="admin_quick_edit_customer_history" />
							  <label for="admin_quick_edit_customer_history"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_customer_transaction; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_customer_transaction"<?php echo $admin_quick_edit_customer_transaction ? ' checked="checked"' : '' ?> id="admin_quick_edit_customer_transaction" />
							  <label for="admin_quick_edit_customer_transaction"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_customer_reward; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_customer_reward"<?php echo $admin_quick_edit_customer_reward ? ' checked="checked"' : '' ?> id="admin_quick_edit_customer_reward" />
							  <label for="admin_quick_edit_customer_reward"></label>
							</div>
						  </td>
					    </tr>
					  </tbody>
					</table>
			      </div>
				</div>
				<div class="tab-pane" id="tab-setting-order">
				  <div class="table-responsive">
					<table class="table table-striped table-hover table-bordered">
					  <thead>
					    <tr>
						  <td class="text-left"><?php echo $text_name_settings; ?></td>
						  <td class="text-center" width="1%"><?php echo $entry_status; ?></td>
						</tr>
					  </thead>
					  <tbody>
					    <tr>
						  <td class="text-left"><?php echo $entry_order_product; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_order_product"<?php echo $admin_quick_edit_order_product ? ' checked="checked"' : '' ?> id="admin_quick_edit_order_product" />
							  <label for="admin_quick_edit_order_product"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_order_product_name; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_order_product_name"<?php echo $admin_quick_edit_order_product_name ? ' checked="checked"' : '' ?> id="admin_quick_edit_order_product_name" />
							  <label for="admin_quick_edit_order_product_name"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_order_product_model; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_order_product_model"<?php echo $admin_quick_edit_order_product_model ? ' checked="checked"' : '' ?> id="admin_quick_edit_order_product_model" />
							  <label for="admin_quick_edit_order_product_model"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_order_product_quantity; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_order_product_quantity"<?php echo $admin_quick_edit_order_product_quantity ? ' checked="checked"' : '' ?> id="admin_quick_edit_order_product_quantity" />
							  <label for="admin_quick_edit_order_product_quantity"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_order_product_price; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_order_product_price"<?php echo $admin_quick_edit_order_product_price ? ' checked="checked"' : '' ?> id="admin_quick_edit_order_product_price" />
							  <label for="admin_quick_edit_order_product_price"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_order_product_total; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_order_product_total"<?php echo $admin_quick_edit_order_product_total ? ' checked="checked"' : '' ?> id="admin_quick_edit_order_product_total" />
							  <label for="admin_quick_edit_order_product_total"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_order_payment; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_order_payment_detail"<?php echo $admin_quick_edit_order_payment_detail ? ' checked="checked"' : '' ?> id="admin_quick_edit_order_payment_detail" />
							  <label for="admin_quick_edit_order_payment_detail"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_order_shipping; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_order_shipping_detail"<?php echo $admin_quick_edit_order_shipping_detail ? ' checked="checked"' : '' ?> id="admin_quick_edit_order_shipping_detail" />
							  <label for="admin_quick_edit_order_shipping_detail"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_order_payment_method; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_order_payment_method"<?php echo $admin_quick_edit_order_payment_method ? ' checked="checked"' : '' ?> id="admin_quick_edit_order_payment_method" />
							  <label for="admin_quick_edit_order_payment_method"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_order_shipping_method; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_order_shipping_method"<?php echo $admin_quick_edit_order_shipping_method ? ' checked="checked"' : '' ?> id="admin_quick_edit_order_shipping_method" />
							  <label for="admin_quick_edit_order_shipping_method"></label>
							</div>
						  </td>
					    </tr>
						<tr>
						  <td class="text-left"><?php echo $entry_order_customer_detail; ?></td>
						  <td class="text-center">
						    <div class="input-checkbox">
					          <input type="checkbox" class="checkbox" name="admin_quick_edit_order_ustomer_detail"<?php echo $admin_quick_edit_order_ustomer_detail ? ' checked="checked"' : '' ?> id="admin_quick_edit_order_ustomer_detail" />
							  <label for="admin_quick_edit_order_ustomer_detail"></label>
							</div>
						  </td>
					    </tr>
					  </tbody>
					</table>
			      </div>
			    </div>
			  </div>
			</form>
		  </div>
		</div>
	  </div>
	</div>
  </div>
</div>
<?php echo $footer; ?>