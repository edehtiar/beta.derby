<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-fastorder" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-fastorder" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#setting-tab" data-toggle="tab"><?php echo $tab_setting; ?></a></li>
            <li><a href="#display-tab" data-toggle="tab"><?php echo $tab_display; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="setting-tab">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="fastorder_data[status]" id="input-status" class="form-control">
                    <?php if ($fastorder_data['status']) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-login"><?php echo $entry_login; ?></label>
                <div class="col-sm-10">
                  <select name="fastorder_data[login]" id="input-login" class="form-control">
                    <?php if ($fastorder_data['login']) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-shipping"><?php echo $entry_shipping; ?></label>
                <div class="col-sm-10">
                  <select name="fastorder_data[shipping]" id="input-shipping" class="form-control">
                    <?php if ($fastorder_data['shipping']) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-payment"><?php echo $entry_payment; ?></label>
                <div class="col-sm-10">
                  <select name="fastorder_data[payment]" id="input-payment" class="form-control">
                    <?php if ($fastorder_data['payment']) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
                <div class="col-sm-10">
                  <select name="fastorder_data[firstname]" id="input-firstname" class="form-control">
                    <?php if ($fastorder_data['firstname'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } elseif ($fastorder_data['firstname'] == 2) { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2" selected="selected"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
                <div class="col-sm-10">
                  <select name="fastorder_data[lastname]" id="input-lastname" class="form-control">
                    <?php if ($fastorder_data['lastname'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } elseif ($fastorder_data['lastname'] == 2) { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2" selected="selected"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                <div class="col-sm-10">
                  <select name="fastorder_data[email]" id="input-email" class="form-control">
                    <?php if ($fastorder_data['email'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } elseif ($fastorder_data['email'] == 2) { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2" selected="selected"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
                <div class="col-sm-10">
                  <select name="fastorder_data[telephone]" id="input-telephone" class="form-control">
                    <?php if ($fastorder_data['telephone'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } elseif ($fastorder_data['telephone'] == 2) { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2" selected="selected"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-fax"><?php echo $entry_fax; ?></label>
                <div class="col-sm-10">
                  <select name="fastorder_data[fax]" id="input-fax" class="form-control">
                    <?php if ($fastorder_data['fax'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } elseif ($fastorder_data['fax'] == 2) { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2" selected="selected"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-comment"><?php echo $entry_comment; ?></label>
                <div class="col-sm-10">
                  <select name="fastorder_data[comment]" id="input-comment" class="form-control">
                    <?php if ($fastorder_data['comment'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } elseif ($fastorder_data['comment'] == 2) { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2" selected="selected"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-company"><?php echo $entry_company; ?></label>
                <div class="col-sm-10">
                  <select name="fastorder_data[company]" id="input-company" class="form-control">
                    <?php if ($fastorder_data['company'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } elseif ($fastorder_data['company'] == 2) { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2" selected="selected"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-address_1"><?php echo $entry_address_1; ?></label>
                <div class="col-sm-10">
                  <select name="fastorder_data[address_1]" id="input-address_1" class="form-control">
                    <?php if ($fastorder_data['address_1'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } elseif ($fastorder_data['address_1'] == 2) { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2" selected="selected"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-address_2"><?php echo $entry_address_2; ?></label>
                <div class="col-sm-10">
                  <select name="fastorder_data[address_2]" id="input-address_2" class="form-control">
                    <?php if ($fastorder_data['address_2'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } elseif ($fastorder_data['address_2'] == 2) { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2" selected="selected"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-city"><?php echo $entry_city; ?></label>
                <div class="col-sm-10">
                  <select name="fastorder_data[city]" id="input-city" class="form-control">
                    <?php if ($fastorder_data['city'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } elseif ($fastorder_data['city'] == 2) { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2" selected="selected"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
                <div class="col-sm-10">
                  <select name="fastorder_data[postcode]" id="input-postcode" class="form-control">
                    <?php if ($fastorder_data['postcode'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } elseif ($fastorder_data['postcode'] == 2) { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2" selected="selected"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-country_and_region"><?php echo $entry_country_and_region; ?></label>
                <div class="col-sm-10">
                  <select name="fastorder_data[country_and_region]" id="input-country_and_region" class="form-control">
                    <?php if ($fastorder_data['country_and_region'] == 1) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } elseif ($fastorder_data['country_and_region'] == 2) { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2" selected="selected"><?php echo $text_enabled_required; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="2"><?php echo $text_enabled_required; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-country_and_region"><?php echo $entry_display_inline; ?></label>
                <div class="col-sm-10">
                  <select name="fastorder_data[display_inline]" id="input-display_inline" class="form-control">
                    <?php if ($fastorder_data['display_inline']) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_default_country; ?></label>
                <div class="col-sm-10">
                  <div class="well well-sm" style="height: 150px; overflow: auto;">
                    <?php $row = 0; foreach ( $countries as $country ) { ?>
                    <div class="checkbox">
                      <label>
                        <input type="radio" name="fastorder_data[default_country]" value="<?php echo $country['country_id']; ?>" <?php echo ( !empty( $fastorder_data['default_country'] ) && $fastorder_data['default_country'] == $country['country_id'] ) ? 'checked' : ''; ?> /> <?php echo $country['name']; ?>
                      </label>
                    </div>
                    <?php $row++; ?>
                    <?php } ?>
                  </div>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="display-tab">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-backgorund_color_block_border"><?php echo $entry_backgorund_color_block_border; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="fastorder_data[backgorund_color_block_border]" value="<?php echo $fastorder_data['backgorund_color_block_border']; ?>" placeholder="<?php echo $entry_backgorund_color_block_border; ?>" id="input-backgorund_color_block_border" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-backgorund_color_block_heading"><?php echo $entry_backgorund_color_block_heading; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="fastorder_data[backgorund_color_block_heading]" value="<?php echo $fastorder_data['backgorund_color_block_heading']; ?>" placeholder="<?php echo $entry_backgorund_color_block_heading; ?>" id="input-backgorund_color_block_heading" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-text_color_block_heading"><?php echo $entry_text_color_block_heading; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="fastorder_data[text_color_block_heading]" value="<?php echo $fastorder_data['text_color_block_heading']; ?>" placeholder="<?php echo $entry_text_color_block_heading; ?>" id="input-text_color_block_heading" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-backgorund_color_block_body"><?php echo $entry_backgorund_color_block_body; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="fastorder_data[backgorund_color_block_body]" value="<?php echo $fastorder_data['backgorund_color_block_body']; ?>" placeholder="<?php echo $entry_backgorund_color_block_body; ?>" id="input-backgorund_color_block_body" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-text_color_block_body"><?php echo $entry_text_color_block_body; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="fastorder_data[text_color_block_body]" value="<?php echo $fastorder_data['text_color_block_body']; ?>" placeholder="<?php echo $entry_text_color_block_body; ?>" id="input-text_color_block_body" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-backgorund_color_remove_button"><?php echo $entry_backgorund_color_remove_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="fastorder_data[backgorund_color_remove_button]" value="<?php echo $fastorder_data['backgorund_color_remove_button']; ?>" placeholder="<?php echo $entry_backgorund_color_remove_button; ?>" id="input-backgorund_color_remove_button" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-text_color_remove_button"><?php echo $entry_text_color_remove_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="fastorder_data[text_color_remove_button]" value="<?php echo $fastorder_data['text_color_remove_button']; ?>" placeholder="<?php echo $entry_text_color_remove_button; ?>" id="input-text_color_remove_button" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-backgorund_color_quantity_button"><?php echo $entry_backgorund_color_quantity_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="fastorder_data[backgorund_color_quantity_button]" value="<?php echo $fastorder_data['backgorund_color_quantity_button']; ?>" placeholder="<?php echo $entry_backgorund_color_quantity_button; ?>" id="input-backgorund_color_quantity_button" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-text_color_quantity_button"><?php echo $entry_text_color_quantity_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="fastorder_data[text_color_quantity_button]" value="<?php echo $fastorder_data['text_color_quantity_button']; ?>" placeholder="<?php echo $entry_text_color_quantity_button; ?>" id="input-text_color_quantity_button" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-backgorund_color_checkout_button"><?php echo $entry_backgorund_color_checkout_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="fastorder_data[backgorund_color_checkout_button]" value="<?php echo $fastorder_data['backgorund_color_checkout_button']; ?>" placeholder="<?php echo $entry_backgorund_color_checkout_button; ?>" id="input-backgorund_color_checkout_button" class="form-control color" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-text_color_checkout_button"><?php echo $entry_text_color_checkout_button; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="fastorder_data[text_color_checkout_button]" value="<?php echo $fastorder_data['text_color_checkout_button']; ?>" placeholder="<?php echo $entry_text_color_checkout_button; ?>" id="input-text_color_checkout_button" class="form-control color" />
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
  $(function(){
    $('input.color').minicolors();
  });
</script>
<?php echo $footer; ?>