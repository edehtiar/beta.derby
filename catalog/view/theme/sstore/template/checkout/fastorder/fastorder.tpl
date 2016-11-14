<?php echo $header; ?><?php echo $content_top; ?>
<div id="container">
 <div class="row">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
  </div>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="content"><?php echo $column_left; ?><?php echo $column_right; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <article id="content" class="<?php echo $class; ?>">
      <h1><?php echo $heading_title; ?></h1>

      <?php if ($cart_status) { ?>
        <div class="row">
          <div class="panel-group <?php echo (($fastorder_data['shipping'] || $fastorder_data['payment']) && !$fastorder_data['display_inline']) ? 'col-sm-6' : 'col-sm-12'; ?>">
            <?php if (!$logged && $fastorder_data['login']) { ?>
            <div style="margin-bottom: 15px;" class="panel panel-default fastorder-panel-default" id="login-wrapper">
              <div class="panel-heading">
                <h4 class="panel-title"><?php echo $heading_login_block; ?></h4>
              </div>
              <div class="panel-collapse">
                <div class="panel-body" id="login">
                  <p><?php echo $text_i_am_returning_customer; ?></p>
                  <div class="form-group">
                    <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                    <input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                  </div>
                  <div class="form-group">
                    <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
                    <input type="password" name="password" value="" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                    <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></div>
                  <input type="button" value="<?php echo $button_login; ?>" id="button-login" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
                </div>
              </div>
            </div>
            <?php } ?>
            <div style="margin-top: 0;" class="panel panel-default fastorder-panel-default">
              <div class="panel-heading">
                <h4 class="panel-title"><?php echo $heading_user_block; ?><?php if (!$logged && $fastorder_data['login']) { ?><a style="text-decoration: underline; font-size: 12px; margin: 0; padding-top: 2px;" id="i_registered" class="pull-right"><?php echo $text_registered; ?></a><?php } ?></h4>
              </div>
              <div class="panel-collapse">
                <div class="panel-body" id="guest">
                  <div class="row">
                    <?php if ($addresses) { ?>
                      <div class="col-sm-12">
                        <div class="radio">
                          <label><input type="radio" name="payment_address" value="existing" checked="checked" /><?php echo $text_address_existing; ?></label>
                        </div>
                        <div id="payment-existing">
                          <select name="address_id" class="form-control">
                            <?php foreach ($addresses as $address) { ?>
                            <?php if ($address['address_id'] == $address_id) { ?>
                            <option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
                            <?php } ?>
                            <?php } ?>
                          </select>
                        </div>
                        <div class="radio">
                          <label><input type="radio" name="payment_address" value="new" /><?php echo $text_address_new; ?></label>
                        </div>
                      </div>
                    <br />
                    <?php } ?>
                    <div id="payment-new" style="display: <?php echo ($addresses ? 'none' : 'block'); ?>;">
                      <?php if (isset($fastorder_data['firstname']) && isset($fastorder_data['lastname']) && isset($fastorder_data['email']) && isset($fastorder_data['telephone']) && isset($fastorder_data['fax']) && isset($fastorder_data['comment'])) { ?>
                      <div class="col-sm-6">
                        <fieldset id="account">
                          <legend><?php echo $text_your_details; ?></legend>
                          <div class="form-group" style="display: <?php echo (count($customer_groups) > 1 ? 'block' : 'none'); ?>;">
                            <label class="control-label"><?php echo $entry_customer_group; ?></label>
                            <?php foreach ($customer_groups as $customer_group) { ?>
                            <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
                            <div class="radio">
                              <label>
                                <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
                                <?php echo $customer_group['name']; ?></label>
                            </div>
                            <?php } else { ?>
                            <div class="radio">
                              <label>
                                <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" />
                                <?php echo $customer_group['name']; ?></label>
                            </div>
                            <?php } ?>
                            <?php } ?>
                          </div>
                          <?php if ($fastorder_data['firstname'] == 1) { ?>
                          <div class="form-group">
                            <label class="control-label" for="input-payment-firstname"><?php echo $entry_firstname; ?></label>
                            <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-payment-firstname" class="form-control" />
                          </div>
                          <?php } ?>
                          <?php if ($fastorder_data['firstname'] == 2) { ?>
                          <div class="form-group required">
                            <label class="control-label" for="input-payment-firstname"><?php echo $entry_firstname; ?></label>
                            <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-payment-firstname" class="form-control" />
                          </div>
                          <?php } ?>
                          <?php if ($fastorder_data['lastname'] == 1) { ?>
                          <div class="form-group">
                            <label class="control-label" for="input-payment-lastname"><?php echo $entry_lastname; ?></label>
                            <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-payment-lastname" class="form-control" />
                          </div>
                          <?php } ?>
                          <?php if ($fastorder_data['lastname'] == 2) { ?>
                          <div class="form-group required">
                            <label class="control-label" for="input-payment-lastname"><?php echo $entry_lastname; ?></label>
                            <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-payment-lastname" class="form-control" />
                          </div>
                          <?php } ?>
                          <?php if ($fastorder_data['email'] == 1) { ?>
                          <div class="form-group">
                            <label class="control-label" for="input-payment-email"><?php echo $entry_email; ?></label>
                            <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-payment-email" class="form-control" />
                          </div>
                          <?php } ?>
                          <?php if ($fastorder_data['email'] == 2) { ?>
                          <div class="form-group required">
                            <label class="control-label" for="input-payment-email"><?php echo $entry_email; ?></label>
                            <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-payment-email" class="form-control" />
                          </div>
                          <?php } ?>
                          <?php if ($fastorder_data['telephone'] == 1) { ?>
                          <div class="form-group">
                            <label class="control-label" for="input-payment-telephone"><?php echo $entry_telephone; ?></label>
                            <input type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-payment-telephone" class="form-control" />
                          </div>
                          <?php } ?>
                          <?php if ($fastorder_data['telephone'] == 2) { ?>
                          <div class="form-group required">
                            <label class="control-label" for="input-payment-telephone"><?php echo $entry_telephone; ?></label>
                            <input type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-payment-telephone" class="form-control" />
                          </div>
                          <?php } ?>
                          <?php if ($fastorder_data['fax'] == 1) { ?>
                          <div class="form-group">
                            <label class="control-label" for="input-payment-fax"><?php echo $entry_fax; ?></label>
                            <input type="text" name="fax" value="<?php echo $fax; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-payment-fax" class="form-control" />
                          </div>
                          <?php } ?>
                          <?php if ($fastorder_data['fax'] == 2) { ?>
                          <div class="form-group required">
                            <label class="control-label" for="input-payment-fax"><?php echo $entry_fax; ?></label>
                            <input type="text" name="fax" value="<?php echo $fax; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-payment-fax" class="form-control" />
                          </div>
                          <?php } ?>
                          <?php if ($fastorder_data['comment'] == 1) { ?>
                          <div class="form-group">
                            <label class="control-label" for="input-payment-comment"><?php echo $entry_comment; ?></label>
                            <textarea name="comment" rows="8" id="input-payment-comment" class="form-control"><?php echo $comment; ?></textarea>
                          </div>
                          <?php } ?>
                          <?php if ($fastorder_data['comment'] == 2) { ?>
                          <div class="form-group required">
                            <label class="control-label" for="input-payment-comment"><?php echo $entry_comment; ?></label>
                            <textarea name="comment" rows="8" id="input-payment-comment" class="form-control"><?php echo $comment; ?></textarea>
                          </div>
                          <?php } ?>
                          <?php foreach ($custom_fields as $custom_field) { ?>
										      <?php if ($custom_field['location'] == 'account') { ?>
										      <?php if ($custom_field['type'] == 'select') { ?>
										      <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
										        <label class="control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
										        <select name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
										          <option value=""><?php echo $text_select; ?></option>
										          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
										          <?php if (isset($guest_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $guest_custom_field[$custom_field['custom_field_id']]) { ?>
										          <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
										          <?php } else { ?>
										          <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
										          <?php } ?>
										          <?php } ?>
										        </select>
										      </div>
										      <?php } ?>
										      <?php if ($custom_field['type'] == 'radio') { ?>
										      <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
										        <label class="control-label"><?php echo $custom_field['name']; ?></label>
										        <div id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>">
										          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
										          <div class="radio">
										            <?php if (isset($guest_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $guest_custom_field[$custom_field['custom_field_id']]) { ?>
										            <label>
										              <input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
										              <?php echo $custom_field_value['name']; ?></label>
										            <?php } else { ?>
										            <label>
										              <input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
										              <?php echo $custom_field_value['name']; ?></label>
										            <?php } ?>
										          </div>
										          <?php } ?>
										        </div>
										      </div>
										      <?php } ?>
										      <?php if ($custom_field['type'] == 'checkbox') { ?>
										      <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
										        <label class="control-label"><?php echo $custom_field['name']; ?></label>
										        <div id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>">
										          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
										          <div class="checkbox">
										            <?php if (isset($guest_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $guest_custom_field[$custom_field['custom_field_id']])) { ?>
										            <label>
										              <input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
										              <?php echo $custom_field_value['name']; ?></label>
										            <?php } else { ?>
										            <label>
										              <input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
										              <?php echo $custom_field_value['name']; ?></label>
										            <?php } ?>
										          </div>
										          <?php } ?>
										        </div>
										      </div>
										      <?php } ?>
										      <?php if ($custom_field['type'] == 'text') { ?>
										      <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
										        <label class="control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
										        <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
										      </div>
										      <?php } ?>
										      <?php if ($custom_field['type'] == 'textarea') { ?>
										      <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
										        <label class="control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
										        <textarea name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
										      </div>
										      <?php } ?>
										      <?php if ($custom_field['type'] == 'file') { ?>
										      <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
										        <label class="control-label"><?php echo $custom_field['name']; ?></label>
										        <br />
										        <button type="button" id="button-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
										        <input type="hidden" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : ''); ?>" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" />
										      </div>
										      <?php } ?>
										      <?php if ($custom_field['type'] == 'date') { ?>
										      <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
										        <label class="control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
										        <div class="input-group date">
										          <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
										          <span class="input-group-btn">
										          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
										          </span></div>
										      </div>
										      <?php } ?>
										      <?php if ($custom_field['type'] == 'time') { ?>
										      <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
										        <label class="control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
										        <div class="input-group time">
										          <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
										          <span class="input-group-btn">
										          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
										          </span></div>
										      </div>
										      <?php } ?>
										      <?php if ($custom_field['type'] == 'datetime') { ?>
										      <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
										        <label class="control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
										        <div class="input-group datetime">
										          <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
										          <span class="input-group-btn">
										          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
										          </span></div>
										      </div>
										      <?php } ?>
										      <?php } ?>
										      <?php } ?>
                        </fieldset>
                      </div>
                      <?php } ?>
                      <?php if (isset($fastorder_data['company']) && isset($fastorder_data['address_1']) && isset($fastorder_data['address_2']) && isset($fastorder_data['city']) && isset($fastorder_data['postcode']) && isset($fastorder_data['country_and_region'])) { ?>
                      <div class="col-sm-6">
                        <fieldset id="address">
                          <legend><?php echo $text_your_address; ?></legend>
                          <?php if ($fastorder_data['company'] == 1) { ?>
                          <div class="form-group">
                            <label class="control-label" for="input-payment-company"><?php echo $entry_company; ?></label>
                            <input type="text" name="company" value="<?php echo $company; ?>" placeholder="<?php echo $entry_company; ?>" id="input-payment-company" class="form-control" />
                          </div>
                          <?php } ?>
                          <?php if ($fastorder_data['company'] == 2) { ?>
                          <div class="form-group required">
                            <label class="control-label" for="input-payment-company"><?php echo $entry_company; ?></label>
                            <input type="text" name="company" value="<?php echo $company; ?>" placeholder="<?php echo $entry_company; ?>" id="input-payment-company" class="form-control" />
                          </div>
                          <?php } ?>
                          <?php if ($fastorder_data['address_1'] == 1) { ?>
                          <div class="form-group">
                            <label class="control-label" for="input-payment-address-1"><?php echo $entry_address_1; ?></label>
                            <input type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-payment-address-1" class="form-control" />
                          </div>
                          <?php } ?>
                          <?php if ($fastorder_data['address_1'] == 2) { ?>
                          <div class="form-group required">
                            <label class="control-label" for="input-payment-address-1"><?php echo $entry_address_1; ?></label>
                            <input type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-payment-address-1" class="form-control" />
                          </div>
                          <?php } ?>
                          <?php if ($fastorder_data['address_2'] == 1) { ?>
                          <div class="form-group">
                            <label class="control-label" for="input-payment-address-2"><?php echo $entry_address_2; ?></label>
                            <input type="text" name="address_2" value="<?php echo $address_2; ?>" placeholder="<?php echo $entry_address_2; ?>" id="input-payment-address-2" class="form-control" />
                          </div>
                          <?php } ?>
                          <?php if ($fastorder_data['address_2'] == 2) { ?>
                          <div class="form-group required">
                            <label class="control-label" for="input-payment-address-2"><?php echo $entry_address_2; ?></label>
                            <input type="text" name="address_2" value="<?php echo $address_2; ?>" placeholder="<?php echo $entry_address_2; ?>" id="input-payment-address-2" class="form-control" />
                          </div>
                          <?php } ?>
                          <?php if ($fastorder_data['city'] == 1) { ?>
                          <div class="form-group">
                            <label class="control-label" for="input-payment-city"><?php echo $entry_city; ?></label>
                            <input type="text" name="city" value="<?php echo $city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-payment-city" class="form-control" />
                          </div>
                          <?php } ?>
                          <?php if ($fastorder_data['city'] == 2) { ?>
                          <div class="form-group required">
                            <label class="control-label" for="input-payment-city"><?php echo $entry_city; ?></label>
                            <input type="text" name="city" value="<?php echo $city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-payment-city" class="form-control" />
                          </div>
                          <?php } ?>
                          <?php if ($fastorder_data['postcode'] == 1) { ?>
                          <div class="form-group">
                            <label class="control-label" for="input-payment-postcode"><?php echo $entry_postcode; ?></label>
                            <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-payment-postcode" class="form-control" />
                          </div>
                          <?php } ?>
                          <?php if ($fastorder_data['postcode'] == 2) { ?>
                          <div class="form-group required">
                            <label class="control-label" for="input-payment-postcode"><?php echo $entry_postcode; ?></label>
                            <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-payment-postcode" class="form-control" />
                          </div>
                          <?php } ?>
                          <?php if ($fastorder_data['country_and_region'] == 1) { ?>
                          <div class="form-group">
                            <label class="control-label" for="input-payment-country"><?php echo $entry_country; ?></label>
                            <select name="country_id" id="input-payment-country" class="form-control">
                              <option value=""><?php echo $text_select; ?></option>
                              <?php foreach ($countries as $country) { ?>
                              <?php if ($country['country_id'] == $country_id) { ?>
                              <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                              <?php } else { ?>
                              <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                              <?php } ?>
                              <?php } ?>
                            </select>
                          </div>
                          <div class="form-group">
                            <label class="control-label" for="input-payment-zone"><?php echo $entry_zone; ?></label>
                            <select name="zone_id" id="input-payment-zone" class="form-control">
                            </select>
                          </div>
                          <?php } ?>
                          <?php if ($fastorder_data['country_and_region'] == 2) { ?>
                          <div class="form-group required">
                            <label class="control-label" for="input-payment-country"><?php echo $entry_country; ?></label>
                            <select name="country_id" id="input-payment-country" class="form-control">
                              <option value=""><?php echo $text_select; ?></option>
                              <?php foreach ($countries as $country) { ?>
                              <?php if ($country['country_id'] == $country_id) { ?>
                              <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                              <?php } else { ?>
                              <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                              <?php } ?>
                              <?php } ?>
                            </select>
                          </div>
                          <div class="form-group required">
                            <label class="control-label" for="input-payment-zone"><?php echo $entry_zone; ?></label>
                            <select name="zone_id" id="input-payment-zone" class="form-control">
                            </select>
                          </div>
                          <?php } ?>
                          <?php foreach ($custom_fields as $custom_field) { ?>
										      <?php if ($custom_field['location'] == 'address') { ?>
										      <?php if ($custom_field['type'] == 'select') { ?>
										      <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
										        <label class="control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
										        <select name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
										          <option value=""><?php echo $text_select; ?></option>
										          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
										          <?php if (isset($guest_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $guest_custom_field[$custom_field['custom_field_id']]) { ?>
										          <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
										          <?php } else { ?>
										          <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
										          <?php } ?>
										          <?php } ?>
										        </select>
										      </div>
										      <?php } ?>
										      <?php if ($custom_field['type'] == 'radio') { ?>
										      <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
										        <label class="control-label"><?php echo $custom_field['name']; ?></label>
										        <div id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>">
										          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
										          <div class="radio">
										            <?php if (isset($guest_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $guest_custom_field[$custom_field['custom_field_id']]) { ?>
										            <label>
										              <input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
										              <?php echo $custom_field_value['name']; ?></label>
										            <?php } else { ?>
										            <label>
										              <input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
										              <?php echo $custom_field_value['name']; ?></label>
										            <?php } ?>
										          </div>
										          <?php } ?>
										        </div>
										      </div>
										      <?php } ?>
										      <?php if ($custom_field['type'] == 'checkbox') { ?>
										      <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
										        <label class="control-label"><?php echo $custom_field['name']; ?></label>
										        <div id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>">
										          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
										          <div class="checkbox">
										            <?php if (isset($guest_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $guest_custom_field[$custom_field['custom_field_id']])) { ?>
										            <label>
										              <input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
										              <?php echo $custom_field_value['name']; ?></label>
										            <?php } else { ?>
										            <label>
										              <input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
										              <?php echo $custom_field_value['name']; ?></label>
										            <?php } ?>
										          </div>
										          <?php } ?>
										        </div>
										      </div>
										      <?php } ?>
										      <?php if ($custom_field['type'] == 'text') { ?>
										      <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
										        <label class="control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
										        <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
										      </div>
										      <?php } ?>
										      <?php if ($custom_field['type'] == 'textarea') { ?>
										      <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
										        <label class="control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
										        <textarea name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
										      </div>
										      <?php } ?>
										      <?php if ($custom_field['type'] == 'file') { ?>
										      <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
										        <label class="control-label"><?php echo $custom_field['name']; ?></label>
										        <br />
										        <button type="button" id="button-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
										        <input type="hidden" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : ''); ?>" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" />
										      </div>
										      <?php } ?>
										      <?php if ($custom_field['type'] == 'date') { ?>
										      <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
										        <label class="control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
										        <div class="input-group date">
										          <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
										          <span class="input-group-btn">
										          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
										          </span></div>
										      </div>
										      <?php } ?>
										      <?php if ($custom_field['type'] == 'time') { ?>
										      <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
										        <label class="control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
										        <div class="input-group time">
										          <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
										          <span class="input-group-btn">
										          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
										          </span></div>
										      </div>
										      <?php } ?>
										      <?php if ($custom_field['type'] == 'datetime') { ?>
										      <div id="payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
										        <label class="control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
										        <div class="input-group datetime">
										          <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($guest_custom_field[$custom_field['custom_field_id']]) ? $guest_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
										          <span class="input-group-btn">
										          <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
										          </span></div>
										      </div>
										      <?php } ?>
										      <?php } ?>
										      <?php } ?>
                        </fieldset>
                      </div>
                      <?php } ?>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="<?php echo ($fastorder_data['display_inline']) ? 'col-sm-12' : 'col-sm-6'; ?>">
            <?php if ($fastorder_data['payment']) { ?>
            <div class="panel-group">
              <div class="panel panel-default fastorder-panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title"><?php echo $heading_payment_block; ?></h4>
                </div>
                <div class="panel-collapse">
                  <div class="panel-body" id="payment-method">
                    <?php if ($error_warning_payment) { ?>
                    <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning_payment; ?></div>
                    <?php } ?>
                    <?php if ($payment_methods) { ?>
                    <p><?php echo $text_payment_method; ?></p>
                    <?php foreach ($payment_methods as $payment_method) { ?>
                    <div class="radio">
                      <label>
                        <?php if ($payment_method['code'] == $code_p || !$code_p) { ?>
                        <?php $code_p = $payment_method['code']; ?>
                        <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" checked="checked" />
                        <?php } else { ?>
                        <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" />
                        <?php } ?>
                        <?php echo $payment_method['title']; ?>
                        <?php if ($payment_method['terms']) { ?>
                        (<?php echo $payment_method['terms']; ?>)
                        <?php } ?>
                      </label>
                    </div>
                    <?php } ?>
                    <?php } ?>
                    <?php if ($text_agree) { ?>
                    <input type="hidden" name="skip_agree" value="1" />
                    <div class="buttons">
                      <div class="pull-right"><?php echo $text_agree; ?>
                        <?php if ($agree) { ?>
                        <input type="checkbox" name="agree" value="1" checked="checked" onchange="payment_save();" />
                        <?php } else { ?>
                        <input type="checkbox" name="agree" value="1" onchange="payment_save();" />
                        <?php } ?>
                      </div>
                    </div>
                    <div style="display:none;">
                      <div id="popup-terms-block" class="size-popup"><button type="button" class="mfp-close">×</button><div></div></div>
                    </div>
                    <script>
                      $(document).delegate('#open-popup-terms', 'click', function(e) {
                        e.preventDefault();

                        $('#modal-agree').remove();

                        var element = this;

                        $.ajax({
                          url: $(element).attr('href'),
                          type: 'get',
                          dataType: 'html',
                          success: function(data) {
                            html  = '<div id="modal-agree" class="modal">';
                            html += '  <div class="modal-dialog">';
                            html += '    <div class="modal-content">';
                            html += '      <div class="modal-header">';
                            html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
                            html += '        <h4 class="modal-title">' + $(element).text() + '</h4>';
                            html += '      </div>';
                            html += '      <div class="modal-body">' + data + '</div>';
                            html += '    </div';
                            html += '  </div>';
                            html += '</div>';

                            $('body').append(html);

                            $('#modal-agree').modal('show');
                          }
                        });
                      });
                    </script>
                    <?php } ?>
                  </div>
                </div>
              </div>
            </div>
            <?php } ?>
            <?php if ($fastorder_data['shipping']) { ?>
            <div class="panel-group">
              <div class="panel panel-default fastorder-panel-default">
                <div class="panel-heading">
                  <h4 class="panel-title"><?php echo $heading_shipping_block; ?></h4>
                </div>
                <div class="panel-collapse">
                  <div class="panel-body" id="shipping-method">
                    <?php if ($error_warning_shipping) { ?>
                    <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning_shipping; ?></div>
                    <?php } ?>
                    <?php if ($shipping_methods) { ?>
                    <p><?php echo $text_shipping_method; ?></p>
                    <?php foreach ($shipping_methods as $shipping_method) { ?>
                    <p><strong><?php echo $shipping_method['title']; ?></strong></p>
                    <?php if (!$shipping_method['error']) { ?>
                    <?php foreach ($shipping_method['quote'] as $quote) { ?>
                    <div class="radio">
                      <label>
                        <?php if ($quote['code'] == $code_s || !$code_s) { ?>
                        <?php $code_s = $quote['code']; ?>
                        <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" checked="checked" onchange="shipping_save();" />
                        <?php } else { ?>
                        <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" onchange="shipping_save();" />
                        <?php } ?>
                        <?php echo $quote['title']; ?> - <?php echo $quote['text']; ?></label>
                    </div>
                    <?php } ?>
                    <?php } else { ?>
                    <div class="alert alert-danger"><?php echo $shipping_method['error']; ?></div>
                    <?php } ?>
                    <?php } ?>
                    <?php } ?>
                  </div>
                </div>
              </div>
            </div>
            <?php } ?>
          </div>
        </div>

        <!-- CART START -->
        <div class="panel-group" id="checkout-cart">
          <div class="panel panel-default fastorder-panel-default">
            <div class="panel-heading">
              <h4 class="panel-title"><?php echo $heading_cart_block; ?><?php if ($weight) { ?>&nbsp;(<?php echo $weight; ?>)<?php } ?></h4>
            </div>
            <div class="panel-collapse">
              <div class="panel-body">
                <?php if ($attention_cart) { ?>
                <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention_cart; ?>
                  <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
                <?php } ?>
                <?php if ($error_warning_cart) { ?>
                <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning_cart; ?>
                  <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
                <script type="text/javascript">$(function(){$('#checkout-order').addClass('disabled');});</script>
                <?php } ?>
                <div class="table-responsive">
                  <table class="table table-bordered fastorder-table-bordered">
                    <thead>
                      <tr>
                        <td class="text-center"><?php echo $column_image; ?></td>
                        <td class="text-left"><?php echo $column_name; ?></td>
                        <td class="text-left"><?php echo $column_model; ?></td>
                        <td class="text-left"><?php echo $column_quantity; ?></td>
                        <td class="text-right"><?php echo $column_price; ?></td>
                        <td class="text-right"><?php echo $column_total; ?></td>
                        <td class="text-center"><?php echo $column_remove; ?></td>
                      </tr>
                    </thead>
                    <tbody>
                      <?php foreach ($products as $product) { ?>
                      <tr>
                        <td class="text-center"><?php if ($product['thumb']) { ?>
                          <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                          <?php } ?></td>
                        <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                          <?php if (!$product['stock']) { ?>
                          <span class="text-danger">***</span>
                          <?php } ?>
                          <?php if ($product['option']) { ?>
                          <?php foreach ($product['option'] as $option) { ?>
                          <br />
                          <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                          <?php } ?>
                          <?php } ?>
                          <?php if ($product['reward']) { ?>
                          <br />
                          <small><?php echo $product['reward']; ?></small>
                          <?php } ?>
                          <?php if ($product['recurring']) { ?>
                          <br />
                          <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
                          <?php } ?></td>
                        <td class="text-left"><?php echo $product['model']; ?></td>
                        <td class="text-left">

                          <input name="product_id_q" value="<?php echo $product['product_id']; ?>" style="display: none;" type="hidden" />
                          <input name="product_id" value="<?php echo $product['key']; ?>" style="display: none;" type="hidden" />

                          <div class="input-group btn-block" style="max-width: 50px;">

                            <span class="input-group-btn">
                            <a onclick="$(this).parent().next().val(~~$(this).parent().next().val()-1); update( this, 'update' );" class="btn btn-primary"><i class="fa fa-arrow-left"></i></a>
                            </span>

                            <input type="text" name="quantity" style="width: 40px;" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" onchange="update_manual( this, '<?php echo $product['key']; ?>' ); return validate(this);" onkeyup="update_manual( this, '<?php echo $product['key']; ?>' ); return validate(this);" />

                            <span class="input-group-btn">
                            <a onclick="$(this).parent().prev().val(~~$(this).parent().prev().val()+1); update( this, 'update' );" class="btn btn-primary"><i class="fa fa-arrow-right"></i></a>
                            </span>

                          </div>
                        </td>
                        <td class="text-right"><?php echo $product['price']; ?></td>
                        <td class="text-right"><?php echo $product['total']; ?></td>
                        <td class="text-center"><a onclick="update( this, 'remove' );" class="btn btn-danger"><i class="fa fa-times-circle"></i></a></td>
                      </tr>
                      <?php } ?>
                      <?php foreach ($vouchers as $vouchers) { ?>
                      <tr>
                        <td></td>
                        <td class="text-left"><?php echo $vouchers['description']; ?></td>
                        <td class="text-left"></td>
                        <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                            <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                            <span class="input-group-btn"><button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="remove_voucher('<?php echo $vouchers['key']; ?>');"><i class="fa fa-times-circle"></i></button></span></div></td>
                        <td class="text-right"><?php echo $vouchers['amount']; ?></td>
                        <td class="text-right"><?php echo $vouchers['amount']; ?></td>
                      </tr>
                      <?php } ?>
                    </tbody>
                  </table>
                </div>
                <?php if ($coupon || $voucher || $reward) { ?>
                <h2><?php echo $text_next; ?></h2>
                <p><?php echo $text_next_choice; ?></p>
                <div class="panel-group fastorder-panel-group" id="accordion"><?php echo $coupon; ?><?php echo $voucher; ?><?php echo $reward; ?></div>
                <?php } ?>
                <div class="row">
                  <div class="col-sm-4 col-sm-offset-8">
                    <table class="table table-bordered fastorder-table-bordered">
                      <?php foreach ($totals as $total) { ?>
                      <tr>
                        <td class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
                        <td class="text-right"><?php echo $total['text']; ?></td>
                      </tr>
                      <?php } ?>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- CART END -->
        <div class="buttons" id="bottom-buttons">
          <div class="pull-right">
            <input type="button" value="<?php echo $button_checkout; ?>" id="checkout-order" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
          </div>
        </div>
        <div id="payment"><?php echo $payment; ?></div>
      <?php } else {?>
        <p><?php echo $text_error; ?></p>
        <div class="buttons">
          <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
        </div>
      <?php } ?>
      </article>
      <div class="clearfix"></div>
    </div>
  </div>
      <?php echo $content_bottom; ?>

<script type="text/javascript"><!--
$('#collapse-payment-address button[id^=\'button-payment-custom-field\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$(node).parent().find('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input[name^=\'custom_field\']').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input[name^=\'custom_field\']').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.time').datetimepicker({
	pickDate: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});
//--></script>
<script type="text/javascript">
// Sort the custom fields
$('#account .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#account .form-group').length) {
		$('#account .form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('#account .form-group').length) {
		$('#account .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('#account .form-group').length) {
		$('#account .form-group:first').before(this);
	}
});

$('#address .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#address .form-group').length) {
		$('#address .form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('#address .form-group').length) {
		$('#address .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('#address .form-group').length) {
		$('#address .form-group:first').before(this);
	}
});

function masked(element, status) {
  if (status == true) {
    $('<div/>')
    .attr({ 'class':'masked' })
    .prependTo(element);
    $('<div class="masked_loading" />').insertAfter($('.masked'));
  } else {
    $('.masked').remove();
    $('.masked_loading').remove();
  }
}
</script>
<script type="text/javascript"><!--
<?php if ($fastorder_data['address_1']) { ?>
$('#guest input[name=\'address_1\']').on('change', function() {
 	masked('#shipping-method, #payment-method, #checkout-cart', true);
  $.ajax({
    url: 'index.php?route=checkout/fastorder/fastorder/update_pay_and_ship',
    data: $('#guest input[name=\'address_1\']'),
    type: 'get',
    dataType: 'json',
    success: function(json) {
      masked('#shipping-method, #payment-method, #checkout-cart', false);
      $.ajax({
        url: 'index.php?route=checkout/fastorder/fastorder',
        dataType: 'html',
        success: function(data) {
          $('#shipping-method').html( $( data ).find( '#shipping-method > *' ) );
          $('#payment-method').html( $( data ).find( '#payment-method > *' ) );
          $('#checkout-cart').html( $( data ).find( '#checkout-cart > *' ) );
          masked('#shipping-method, #payment-method, #checkout-cart', false);
        }
      });
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});
<?php	} ?>
<?php if ($fastorder_data['address_2']) { ?>
$('#guest input[name=\'address_2\']').on('change', function() {
 	masked('#shipping-method, #payment-method, #checkout-cart', true);
  $.ajax({
    url: 'index.php?route=checkout/fastorder/fastorder/update_pay_and_ship',
    data: $('#guest input[name=\'address_2\']'),
    type: 'get',
    dataType: 'json',
    success: function(json) {
      masked('#shipping-method, #payment-method, #checkout-cart', false);
      $.ajax({
        url: 'index.php?route=checkout/fastorder/fastorder',
        dataType: 'html',
        success: function(data) {
          $('#shipping-method').html( $( data ).find( '#shipping-method > *' ) );
          $('#payment-method').html( $( data ).find( '#payment-method > *' ) );
          $('#checkout-cart').html( $( data ).find( '#checkout-cart > *' ) );
          masked('#shipping-method, #payment-method, #checkout-cart', false);
        }
      });
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});
<?php	} ?>
<?php if ($fastorder_data['city']) { ?>
$('#guest input[name=\'city\']').on('change', function() {
 	masked('#shipping-method, #payment-method, #checkout-cart', true);
  $.ajax({
    url: 'index.php?route=checkout/fastorder/fastorder/update_pay_and_ship',
    data: $('#guest input[name=\'city\']'),
    type: 'get',
    dataType: 'json',
    success: function(json) {
      masked('#shipping-method, #payment-method, #checkout-cart', false);
      $.ajax({
        url: 'index.php?route=checkout/fastorder/fastorder',
        dataType: 'html',
        success: function(data) {
          $('#shipping-method').html( $( data ).find( '#shipping-method > *' ) );
          $('#payment-method').html( $( data ).find( '#payment-method > *' ) );
          $('#checkout-cart').html( $( data ).find( '#checkout-cart > *' ) );
          masked('#shipping-method, #payment-method, #checkout-cart', false);
        }
      });
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});
<?php	} ?>
<?php if ($fastorder_data['postcode']) { ?>
$('#guest input[name=\'postcode\']').on('change', function() {
 	masked('#shipping-method, #payment-method, #checkout-cart', true);
  $.ajax({
    url: 'index.php?route=checkout/fastorder/fastorder/update_pay_and_ship',
    data: $('#guest input[name=\'postcode\']'),
    type: 'get',
    dataType: 'json',
    success: function(json) {
      masked('#shipping-method, #payment-method, #checkout-cart', false);
      $.ajax({
        url: 'index.php?route=checkout/fastorder/fastorder',
        dataType: 'html',
        success: function(data) {
          $('#shipping-method').html( $( data ).find( '#shipping-method > *' ) );
          $('#payment-method').html( $( data ).find( '#payment-method > *' ) );
          $('#checkout-cart').html( $( data ).find( '#checkout-cart > *' ) );
          masked('#shipping-method, #payment-method, #checkout-cart', false);
        }
      });
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});
<?php	} ?>
<?php if ($fastorder_data['shipping']) { ?>
shipping_save();
function shipping_save() {
  masked('#shipping-method', true);
  masked('#checkout-cart', true);
  $.ajax({
    url: 'index.php?route=checkout/fastorder/fastorder/shipping_save',
    type: 'post',
    data: $('#shipping-method input[type=\'radio\']:checked, #guest select[name=\'zone_id\'], #guest select[name=\'country_id\']'),
    dataType: 'json',
    success: function(json) {
      // $('.alert, .text-danger').remove();
      masked('#shipping-method', false);
      masked('#checkout-cart', false);
      if (json['error']) {
        if (json['error']['warning']) {
          $('#shipping-method').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        }
      } else {
        $.ajax({
          url: 'index.php?route=checkout/fastorder/fastorder',
          dataType: 'html',
          success: function(data) {
            $('#shipping-method').html( $( data ).find( '#shipping-method > *' ) );
            $('#checkout-cart').html( $( data ).find( '#checkout-cart > *' ) );
            masked('#shipping-method', false);
            masked('#checkout-cart', false);
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        });
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
}
<?php } ?>
<?php if ($fastorder_data['payment']) { ?>
payment_save();
function payment_save() {
  masked('#payment-method', true);
  $.ajax({
    url: 'index.php?route=checkout/fastorder/fastorder/payment_save',
    type: 'post',
    data: $('#payment-method input[type=\'radio\']:checked, #payment-method input[type=\'hidden\'], #payment-method input[type=\'checkbox\']:checked'),
    dataType: 'json',
    success: function(json) {
      $('#payment-method .alert, #payment-method .text-danger').remove();

      if (json['error']) {
        masked('#payment-method', false);
        if (json['error']['warning']) {
          $('#payment-method').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        }
      } else {
        $.ajax({
          url: 'index.php?route=checkout/fastorder/fastorder',
          dataType: 'html',
          success: function(data) {
            $('#payment-method').html( $( data ).find( '#payment-method > *' ) );
            masked('#payment-method', false);
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        });
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
}
<?php } ?>

$(document).delegate('#checkout-order', 'click', function() {

    masked('#guest', true);
    <?php if ($fastorder_data['shipping']) { ?>masked('#shipping-method', true);<?php } ?>
    <?php if ($fastorder_data['payment']) { ?>masked('#payment-method', true);<?php } ?>
    masked('#checkout-cart', true);

    var address_id = $('input[name=\'payment_address\']').val();

    if (address_id == "existing" || typeof(address_id) != 'undefined') {
      var user_data = $('#guest select[name=\'address_id\'],#guest input[type=\'radio\']:checked');
    } else {
      var user_data = $('#guest input[type=\'text\'], #guest input[type=\'date\'], #guest input[type=\'datetime-local\'], #guest input[type=\'time\'], #guest input[type=\'checkbox\']:checked, #guest input[type=\'radio\']:checked, #guest input[type=\'hidden\'], #guest textarea, #guest select:not([name=\'address_id\'])');
    }

    $.ajax({
      url: 'index.php?route=checkout/fastorder/fastorder/guest_save',
      type: 'post',
      data: user_data,
      dataType: 'json',
      beforeSend: function() {
        $('#checkout-order').button('loading');
      },
       success: function(json) {
          masked('#guest', false);
          <?php if ($fastorder_data['shipping']) { ?>masked('#shipping-method', false);<?php } ?>
          <?php if ($fastorder_data['payment']) { ?>masked('#payment-method', false);<?php } ?>
          masked('#checkout-cart', false);
          $('.alert, .text-danger').remove();

          if (json['error']) {
            masked('#guest', false);
            <?php if ($fastorder_data['shipping']) { ?>masked('#shipping-method', false);<?php } ?>
            <?php if ($fastorder_data['payment']) { ?>masked('#payment-method', false);<?php } ?>
            masked('#checkout-cart', false);
            $('#checkout-order').button('reset');

            if (json['error']['warning']) {
              $('#guest').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
            }

            for (i in json['error']) {
              var element = $('#input-payment-' + i.replace('_', '-'));

              if ($(element).parent().hasClass('input-group')) {
                $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
              } else {
                $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
              }
            }

            $('html, body').animate({ scrollTop: 0 }, 'slow');
            $('.text-danger').parent().addClass('has-error');

          } else {

            $('.alert, .text-danger').remove();
            masked('#guest', true);
            <?php if ($fastorder_data['shipping']) { ?>masked('#shipping-method', true);<?php } ?>
            <?php if ($fastorder_data['payment']) { ?>masked('#payment-method', true);<?php } ?>
            masked('#checkout-cart', true);

            <?php if ($fastorder_data['shipping']) { ?>
            $.ajax({
                url: 'index.php?route=checkout/fastorder/fastorder/shipping_save',
                type: 'post',
                data: $('#shipping-method input[type=\'radio\']:checked'),
                dataType: 'json',
                beforeSend: function() {
                  $('#checkout-order').button('loading');
                },
                success: function(json) {
                  masked('#guest', false);
                  masked('#shipping-method', false);
                  <?php if ($fastorder_data['payment']) { ?>masked('#payment-method', false);<?php } ?>
                  masked('#checkout-cart', false);
                  $('.alert, .text-danger').remove();
                  $('#checkout-order').button('reset');

                  if (json['error']) {

                    masked('#guest', false);
                    masked('#shipping-method', false);
                    <?php if ($fastorder_data['payment']) { ?>masked('#payment-method', false);<?php } ?>
                    masked('#checkout-cart', false);
                    $('#checkout-order').button('reset');

                    if (json['error']['warning']) {
                      $('#shipping-method').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    }
                  } else {

                    $.ajax({
                      url: 'index.php?route=checkout/fastorder/fastorder',
                      dataType: 'html',
                      success: function(data) {
                        $('#shipping-method').html( $( data ).find( '#shipping-method > *' ) );
                      },
                      error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                      }
                    });
                  }
                },
                error: function(xhr, ajaxOptions, thrownError) {
                  alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
              });
              <?php } ?>
              <?php if ($fastorder_data['payment']) { ?>
              $.ajax({
                url: 'index.php?route=checkout/fastorder/fastorder/payment_save',
                type: 'post',
                data: $('#payment-method input[type=\'radio\']:checked, #payment-method input[type=\'checkbox\']:checked'),
                dataType: 'json',
                beforeSend: function() {
                  $('#checkout-order').button('loading');
                },
                success: function(json) {

                  masked('#guest', true);
                  <?php if ($fastorder_data['shipping']) { ?>masked('#shipping-method', true);<?php } ?>
                  masked('#payment-method', true);
                  masked('#checkout-cart', true);

                  $('.alert, .text-danger').remove();

                  if (json['error']) {

                    masked('#guest', false);
                    <?php if ($fastorder_data['shipping']) { ?>masked('#shipping-method', false);<?php } ?>
                    masked('#payment-method', false);
                    masked('#checkout-cart', false);
                    $('#checkout-order').button('reset');

                    if (json['error']['warning']) {
                      $('#payment-method').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    }

                  } else {

                  $.ajax({
                    url: 'index.php?route=checkout/fastorder/confirm',
                    dataType: 'html',
                    beforeSend: function() {
                      $('#checkout-order').button('loading');
                    },
                    success: function(data) {
                      $('#payment').html(data);
                      $('#bottom-buttons').hide();

                      var pay_form = $('#payment form').html();

                      if (typeof(pay_form) === "undefined" || pay_form == "") {

                          $('#button-confirm').click();

                      }

                      masked('#guest', false);
                      <?php if ($fastorder_data['shipping']) { ?>masked('#shipping-method', false);<?php } ?>
                      masked('#payment-method', false);
                      masked('#checkout-cart', false);
                      $('#checkout-order').button('reset');
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                  });
                }
              },
              error: function(xhr, ajaxOptions, thrownError) {
                  alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
              }
            });
            <?php } else { ?>
              $.ajax({
                url: 'index.php?route=checkout/fastorder/confirm',
                dataType: 'html',
                beforeSend: function() {
                  $('#checkout-order').button('loading');
                },
                success: function(html) {

                  location.href = '<?php echo $success_page; ?>';

                  masked('#guest', false);
                 <?php if ($fastorder_data['shipping']) { ?> masked('#shipping-method', false);<?php } ?>
                  masked('#payment-method', false);
                  masked('#checkout-cart', false);
                  $('#checkout-order').button('reset');
                },
                error: function(xhr, ajaxOptions, thrownError) {
                  alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
              });
            <?php } ?>
          }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});

function validate( input ) {
  input.value = input.value.replace( /[^\d,]/g, '' );
}

function update( target, status ) {
  masked('#checkout-cart', true);
  var input_val    = $( target ).parent().parent().children( 'input[name=quantity]' ).val(),
      quantity     = parseInt( input_val ),
      product_id   = $( target ).parent().parent().parent().children( 'input[name=product_id]' ).val(),
      product_id_q = $( target ).parent().parent().parent().children( 'input[name=product_id_q]' ).val(),
      product_key  = $( target ).parent().prev().prev().prev().children( 'input[name=product_id]' ).val(),
      urls         = null;

  if ( quantity <= 0 ) {
    masked('#checkout-cart', false);
    quantity = $( target ).parent().parent().children( 'input[name=quantity]' ).val( 1 );
    return;
  }

  if ( status == 'update' ) {
    urls = 'index.php?route=checkout/fastorder/fastorder&update=' + product_id + '&quantity=' + quantity;
  } else if ( status == 'add' ) {
    urls = 'index.php?route=checkout/fastorder/fastorder&add=' + target + '&quantity=1';
  } else {
    urls = 'index.php?route=checkout/fastorder/fastorder&remove=' + product_key;
  }

  $.ajax({
    url: urls,
    type: 'get',
    dataType: 'html',
    beforeSend: function() {
      $(target).html('<i class="fa fa-refresh fa-spin"></i>');
    },
    success: function( data ) {
      $.ajax({
        url: 'index.php?route=checkout/fastorder/fastorder/status_cart',
        type: 'get',
        dataType: 'json',
        success: function( json ) {
          masked('#checkout-cart', false);
          if (json['total']) {
            setTimeout(function () {
	          getCartMobile();
              $('#cart-total').html(json['total']);
            }, 100);
            $('#cart > ul').load('index.php?route=common/cart/info ul li');
          }
          if (!json['redirect']) {
            $('#checkout-order').removeClass('disabled');
            <?php if ($fastorder_data['shipping']) { ?>shipping_save();<?php } ?>
            <?php if ($fastorder_data['payment']) { ?>payment_save();<?php } ?>
            $('#checkout-cart').html( $( data ).find( '#checkout-cart > *' ) );
            <?php if ($fastorder_data['shipping']) { ?>$('#shipping-method').html( $( data ).find( '#shipping-method > *' ) );<?php } ?>
          } else {
            location = json['redirect'];
          }
        }
      });
    }
  });
}
function update_manual( target, product_id ) {
  masked('#checkout-cart', true);
  var input_val = $( target ).val(),
      quantity  = parseInt( input_val );

  if ( quantity <= 0 ) {
    masked('#checkout-cart', false);
    quantity = $( target ).val( 1 );
    return;
  }

  $.ajax({
    url: 'index.php?route=checkout/fastorder/fastorder&update=' + product_id + '&quantity=' + quantity,
    type: 'get',
    dataType: 'html',
    success: function( data ) {
      $.ajax({
        url: 'index.php?route=checkout/fastorder/fastorder/status_cart',
        type: 'get',
        dataType: 'json',
        success: function( json ) {
          masked('#checkout-cart', false);
          if (json['total']) {
            setTimeout(function () {
              $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
            }, 100);
            $('#cart > ul').load('index.php?route=common/cart/info ul li');
          }
          if (!json['redirect']) {
            $('#checkout-order').removeClass('disabled');
            <?php if ($fastorder_data['shipping']) { ?>shipping_save();<?php } ?>
            <?php if ($fastorder_data['payment']) { ?>payment_save();<?php } ?>
            $('#checkout-cart').html( $( data ).find( '#checkout-cart > *' ) );
            <?php if ($fastorder_data['shipping']) { ?>$('#shipping-method').html( $( data ).find( '#shipping-method > *' ) );<?php } ?>
          } else {
            location = json['redirect'];
          }
        }
      });
    }
  });
}

function remove_voucher(voucher_id) {
  $.ajax({
    url: 'index.php?route=checkout/fastorder/fastorder&remove='+voucher_id,
    type: 'get',
    dataType: 'html',
    success: function( data ) {
      $.ajax({
        url: 'index.php?route=checkout/fastorder/fastorder/status_cart',
        type: 'get',
        dataType: 'json',
        success: function( json ) {
          masked('#checkout-cart', false);
          if (json['total']) {
            setTimeout(function () {
              $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
            }, 100);
            $('#cart > ul').load('index.php?route=common/cart/info ul li');
          }
          if (!json['redirect']) {
            $('#checkout-order').removeClass('disabled');
            <?php if ($fastorder_data['shipping']) { ?>shipping_save();<?php } ?>
            <?php if ($fastorder_data['payment']) { ?>payment_save();<?php } ?>
            $('#checkout-cart').html( $( data ).find( '#checkout-cart > *' ) );
            <?php if ($fastorder_data['shipping']) { ?>$('#shipping-method').html( $( data ).find( '#shipping-method > *' ) );<?php } ?>
          } else {
            location = json['redirect'];
          }
        }
      });
    }
  });
}

</script>
<script type="text/javascript"><!--
$('input[name=\'payment_address\']').on('change', function() {
  if (this.value == 'new') {
    $('#payment-existing').hide();
    $('#payment-new').show();
  } else {
    $('#payment-existing').show();
    $('#payment-new').hide();
  }
});
//--></script>
<script type="text/javascript"><!--
$('#guest select[name=\'country_id\']').on('change', function() {
  $.ajax({
    url: 'index.php?route=checkout/fastorder/fastorder/country&country_id=' + this.value,
    dataType: 'json',
    beforeSend: function() {
      $('#guest select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
    },
    complete: function() {
      $('.fa-spin').remove();
    },
    success: function(json) {
      if (json['postcode_required'] == '1') {
        $('#guest input[name=\'postcode\']').parent().parent().addClass('required');
      } else {
        $('#guest input[name=\'postcode\']').parent().parent().removeClass('required');
      }

      html = '<option value=""><?php echo $text_select; ?></option>';

      if (json['zone'] && json['zone'] != '') {
        for (i = 0; i < json['zone'].length; i++) {
          html += '<option value="' + json['zone'][i]['zone_id'] + '"';

          if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
            html += ' selected="selected"';
          }

          html += '>' + json['zone'][i]['name'] + '</option>';
        }

        <?php if ($fastorder_data['shipping'] || $fastorder_data['payment']) { ?>
        masked('#shipping-method, #payment-method, #checkout-cart', true);
			  $.ajax({
			    url: 'index.php?route=checkout/fastorder/fastorder/update_pay_and_ship',
			    data: $('#guest select[name=\'country_id\'], #guest select[name=\'zone_id\']'),
			    type: 'get',
			    dataType: 'json',
			    success: function(json) {
			      masked('#shipping-method, #payment-method, #checkout-cart', false);
			      $.ajax({
			        url: 'index.php?route=checkout/fastorder/fastorder',
			        dataType: 'html',
			        success: function(data) {
			          shipping_save();
			          $('#shipping-method').html( $( data ).find( '#shipping-method > *' ) );
			          $('#payment-method').html( $( data ).find( '#payment-method > *' ) );
			          $('#checkout-cart').html( $( data ).find( '#checkout-cart > *' ) );
			          
			          masked('#shipping-method, #payment-method, #checkout-cart', false);
			        }
			      });
			    },
			    error: function(xhr, ajaxOptions, thrownError) {
			      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			    }
			  });
        <?php } ?>

      } else {
        html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
      }

      $('#guest select[name=\'zone_id\']').html(html);
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});
$('#guest select[name=\'country_id\']').trigger('change');
<?php if ($fastorder_data['shipping'] || $fastorder_data['payment']) { ?>
$('#guest select').on('change', function() {
 masked('#shipping-method, #payment-method, #checkout-cart', true);
  $.ajax({
    url: 'index.php?route=checkout/fastorder/fastorder/update_pay_and_ship',
    data: $('#guest select[name=\'country_id\'], #guest select[name=\'zone_id\']'),
    type: 'get',
    dataType: 'json',
    success: function(json) {
      masked('#shipping-method, #payment-method, #checkout-cart', false);
      $.ajax({
        url: 'index.php?route=checkout/fastorder/fastorder',
        dataType: 'html',
        success: function(data) {
          shipping_save();
          $('#shipping-method').html( $( data ).find( '#shipping-method > *' ) );
          $('#payment-method').html( $( data ).find( '#payment-method > *' ) );
          $('#checkout-cart').html( $( data ).find( '#checkout-cart > *' ) );
          
          masked('#shipping-method, #payment-method, #checkout-cart', false);
        }
      });
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});
<?php } ?>
//--></script>
<?php if (!$logged && $fastorder_data['login']) { ?>
<script type="text/javascript"><!--
$(document).delegate('#button-login', 'click', function() {
  masked('#login', true);
  $.ajax({
    url: 'index.php?route=checkout/fastorder/fastorder/login_save',
    type: 'post',
    data: $('#login :input'),
    dataType: 'json',
    beforeSend: function() {
      $('#button-login').button('loading');
    },
    complete: function() {
        $('#button-login').button('reset');
    },
    success: function(json) {
      masked('#login', false);
      $('#login .alert, #login .text-danger').remove();
      $('#login .form-group').removeClass('has-error');

      if (json['redirect']) {
          location = json['redirect'];
      } else if (json['error']) {
        masked('#login', false);
        $('#login').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        $('#login input[name=\'email\']').parent().addClass('has-error');
        $('#login input[name=\'password\']').parent().addClass('has-error');
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});
$(document).on('click', '#i_registered', function(){
	$('#login-wrapper').slideToggle();
});
//--></script>
<?php } ?>
<style type="text/css">
.panel2 {margin-bottom: 20px;background-color: #fff;border: 1px solid transparent;border-radius: 4px;-webkit-box-shadow: 0 1px 1px rgba(0,0,0,.05);box-shadow: 0 1px 1px rgba(0,0,0,.05);}
#login, #guest, #shipping-method, #payment-method, #checkout-cart {position: relative !important;}
.masked {position: absolute;z-index: 10000;width: 100%;height: 100%;background: #eee;opacity: 0.4;left: 0;top: 0;}
.masked_loading {background:url(catalog/view/theme/sstore/image/ring-alt.svg) no-repeat center center;width: 100%;height: 100%;position: absolute;z-index: 10001;top: 0;left: 0;}
<?php if ($fastorder_data['backgorund_color_block_border']) { ?>
.fastorder-panel-default {border-color:<?php echo $fastorder_data['backgorund_color_block_border']; ?>;}
.fastorder-panel-default>.panel-heading+.panel-collapse>.panel-body {border-top-color:<?php echo $fastorder_data['backgorund_color_block_border']; ?>;}
.fastorder-panel-default>.panel-heading{border-color:<?php echo $fastorder_data['backgorund_color_block_border']; ?>;}
.fastorder-table-bordered {border: 1px solid <?php echo $fastorder_data['backgorund_color_block_border']; ?>;}
.fastorder-table-bordered>tbody>tr>td, .fastorder-table-bordered>tbody>tr>th, .fastorder-table-bordered>tfoot>tr>td, .fastorder-table-bordered>tfoot>tr>th, .fastorder-table-bordered>thead>tr>td, .fastorder-table-bordered>thead>tr>th {border-color: <?php echo $fastorder_data['backgorund_color_block_border']; ?>;}
.fastorder-panel-group .panel-default {border-color: <?php echo $fastorder_data['backgorund_color_block_border']; ?>;}
<?php } ?>
<?php if ($fastorder_data['backgorund_color_block_heading']) { ?>
.fastorder-panel-default>.panel-heading {background-color: <?php echo $fastorder_data['backgorund_color_block_heading']; ?>;}
.fastorder-panel-group .panel-default>.panel-heading {background-color: <?php echo $fastorder_data['backgorund_color_block_heading']; ?>;}
<?php } ?>
<?php if ($fastorder_data['text_color_block_heading']) { ?>
.fastorder-panel-default>.panel-heading {color: <?php echo $fastorder_data['text_color_block_heading']; ?>;}
.fastorder-panel-group .panel-default>.panel-heading {color: <?php echo $fastorder_data['text_color_block_heading']; ?>;}
<?php } ?>
<?php if ($fastorder_data['backgorund_color_block_body']) { ?>
.fastorder-panel-default {background-color: <?php echo $fastorder_data['backgorund_color_block_body']; ?>;}
#collapse-coupon, #collapse-voucher {background-color: <?php echo $fastorder_data['backgorund_color_block_body']; ?>;}
<?php } ?>
<?php if ($fastorder_data['text_color_block_body']) { ?>
.fastorder-panel-default, .fastorder-panel-default h1, .fastorder-panel-default h2, .fastorder-panel-default h3, .fastorder-panel-default legend {color: <?php echo $fastorder_data['text_color_block_body']; ?>;}
<?php } ?>
<?php if ($fastorder_data['backgorund_color_remove_button']) { ?>
.fastorder-table-bordered a.btn-danger {background-color: <?php echo $fastorder_data['backgorund_color_remove_button']; ?>;background-image: none;border:<?php echo $fastorder_data['backgorund_color_remove_button']; ?>;}
<?php } ?>
<?php if ($fastorder_data['text_color_remove_button']) { ?>
.fastorder-table-bordered a.btn-danger {color: <?php echo $fastorder_data['text_color_remove_button']; ?>;}
<?php } ?>
<?php if ($fastorder_data['backgorund_color_quantity_button']) { ?>
.fastorder-table-bordered a.btn-primary, #button-coupon, #button-voucher, #button-login {background-color: <?php echo $fastorder_data['backgorund_color_quantity_button']; ?>;background-image: none;border-color:<?php echo $fastorder_data['backgorund_color_quantity_button']; ?>;}
<?php } ?>
<?php if ($fastorder_data['text_color_quantity_button']) { ?>
.fastorder-table-bordered a.btn-primary, #button-coupon, #button-voucher, #button-login {color: <?php echo $fastorder_data['text_color_quantity_button']; ?>;}
<?php } ?>
<?php if ($fastorder_data['text_color_remove_button']) { ?>
.fastorder-table-bordered a.btn-danger {color: <?php echo $fastorder_data['text_color_remove_button']; ?>;}
<?php } ?>
<?php if ($fastorder_data['backgorund_color_checkout_button']) { ?>
#checkout-order {background-color: <?php echo $fastorder_data['backgorund_color_checkout_button']; ?>;background-image: none;border-color:<?php echo $fastorder_data['backgorund_color_checkout_button']; ?>;}
<?php } ?>
<?php if ($fastorder_data['text_color_checkout_button']) { ?>
#checkout-order {color: <?php echo $fastorder_data['text_color_quantity_button']; ?>;}
<?php } ?>
#checkout-order:hover, .fastorder-table-bordered a.btn-primary:hover, #button-coupon:hover, #button-voucher:hover, #button-login:hover {opacity: .8;}
#i_registered:hover {text-decoration: underline;cursor: pointer;}
#login-wrapper {display: none;}

</style>
<?php echo $footer; ?>
