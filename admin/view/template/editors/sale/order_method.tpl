<div class="modal-header">
  <button type="button" class="pull-right btn btn-danger btn-sm" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
  <h4 class="modal-title"><?php echo $heading_title_info; ?> <?php echo $order_id; ?> - <?php echo $text_method; ?></h4>
</div>
<div class="modal-body">
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-order-method" class="form-horizontal">
    <div id="tab-customer" class="hidden">
      <select name="store" id="input-store" class="form-control">
        <?php foreach ($stores as $store) { ?>
          <?php if ($store['store_id'] == $store_id) { ?>
            <option value="<?php echo $store['href']; ?>" selected="selected"><?php echo $store['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $store['href']; ?>"><?php echo $store['name']; ?></option>
          <?php } ?>
        <?php } ?>
      </select>
      <select name="currency" id="input-currency" class="form-control">
        <?php foreach ($currencies as $currency) { ?>
          <?php if ($currency['code'] == $currency_code) { ?>
            <option value="<?php echo $currency['code']; ?>" selected="selected"><?php echo $currency['title']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></option>
          <?php } ?>
        <?php } ?>
      </select>
      <input type="text" name="customer" value="<?php echo $customer; ?>" />
      <input type="hidden" name="customer_id" value="<?php echo $customer_id; ?>" />
      <select name="customer_group_id" id="input-customer-group" class="form-control">
        <?php foreach ($customer_groups as $customer_group) { ?>
          <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
            <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
          <?php } ?>
        <?php } ?>
      </select>
      <input type="text" name="firstname" value="<?php echo $firstname; ?>" />
      <input type="text" name="lastname" value="<?php echo $lastname; ?>" />
      <input type="text" name="email" value="<?php echo $email; ?>" />
      <input type="text" name="telephone" value="<?php echo $telephone; ?>" />
      <input type="text" name="fax" value="<?php echo $fax; ?>" />
      <?php foreach ($custom_fields as $custom_field) { ?>
        <?php if ($custom_field['location'] == 'account') { ?>
          <?php if ($custom_field['type'] == 'select') { ?>
            <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
              <label class="col-sm-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
              <div class="col-sm-9">
                <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                  <option value=""><?php echo $text_select; ?></option>
                  <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                    <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                    <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                    <?php } ?>
                  <?php } ?>
                </select>
              </div>
            </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'radio') { ?>
            <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
              <label class="col-sm-3 control-label"><?php echo $custom_field['name']; ?></label>
              <div class="col-sm-9">
                <div id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>">
                  <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                    <div class="radio">
                      <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                      <label>
                        <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                        <?php echo $custom_field_value['name']; ?></label>
                      <?php } else { ?>
                      <label>
                        <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                        <?php echo $custom_field_value['name']; ?></label>
                      <?php } ?>
                    </div>
                  <?php } ?>
                </div>
              </div>
            </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'checkbox') { ?>
            <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
              <label class="col-sm-3 control-label"><?php echo $custom_field['name']; ?></label>
              <div class="col-sm-9">
                <div id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>">
                  <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                    <div>
                      <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $account_custom_field[$custom_field['custom_field_id']])) { ?>
                      <label>
                        <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                        <?php echo $custom_field_value['name']; ?></label>
                      <?php } else { ?>
                      <label>
                        <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                        <?php echo $custom_field_value['name']; ?></label>
                      <?php } ?>
                    </div>
                  <?php } ?>
                </div>
              </div>
            </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'text') { ?>
            <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
              <label class="col-sm-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
              <div class="col-sm-9">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
              </div>
            </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'textarea') { ?>
            <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
              <label class="col-sm-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
              <div class="col-sm-9">
                <textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo $custom_field['value']; ?></textarea>
              </div>
            </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'file') { ?>
            <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
              <label class="col-sm-3 control-label"><?php echo $custom_field['name']; ?></label>
              <div class="col-sm-9">
                <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="btn btn-default"></button>
                <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : ''); ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" />
              </div>
            </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'date') { ?>
            <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
              <label class="col-sm-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
              <div class="col-sm-9">
                <div class="input-group date">
                  <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                  <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
				</div>
              </div>
            </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'time') { ?>
            <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
              <label class="col-sm-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
              <div class="col-sm-9">
                <div class="input-group time">
                  <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                  <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
				</div>
              </div>
            </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'datetime') { ?>
            <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>" data-sort="<?php echo $custom_field['sort_order'] + 3; ?>">
              <label class="col-sm-3 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
              <div class="col-sm-9">
                <div class="input-group datetime">
                  <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                  <span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
				</div>
              </div>
            </div>
          <?php } ?>
        <?php } ?>
      <?php } ?>
      <button type="button" id="button-customer" class="hidden"></button>
    </div>
    <div id="tab-cart" class="hidden">
      <table>
        <tbody id="cart">
          <?php if ($order_products || $order_vouchers) { ?>
            <?php $product_row = 0; ?>
            <?php foreach ($order_products as $order_product) { ?>
              <tr>
                <td>
				  <?php echo $order_product['name']; ?><br />
                  <input type="hidden" name="product[<?php echo $product_row; ?>][product_id]" value="<?php echo $order_product['product_id']; ?>" />
                  <?php foreach ($order_product['option'] as $option) { ?>
                    - <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
                    <?php if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'image') { ?>
                      <input type="hidden" name="product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['product_option_value_id']; ?>" />
                    <?php } ?>
                    <?php if ($option['type'] == 'checkbox') { ?>
                      <input type="hidden" name="product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option['product_option_value_id']; ?>" />
                    <?php } ?>
                    <?php if ($option['type'] == 'text' || $option['type'] == 'textarea' || $option['type'] == 'file' || $option['type'] == 'date' || $option['type'] == 'datetime' || $option['type'] == 'time') { ?>
                      <input type="hidden" name="product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" />
                    <?php } ?>
                  <?php } ?>
				</td>
                <td><?php echo $order_product['model']; ?></td>
                <td><?php echo $order_product['quantity']; ?>
                  <input type="hidden" name="product[<?php echo $product_row; ?>][quantity]" value="<?php echo $order_product['quantity']; ?>" /></td>
                <td></td>
                <td></td>
                <td></td>
              </tr>
              <?php $product_row++; ?>
            <?php } ?>
            <?php $voucher_row = 0; ?>
            <?php foreach ($order_vouchers as $order_voucher) { ?>
              <tr>
                <td>
				  <?php echo $order_voucher['description']; ?>
                  <input type="hidden" name="voucher[<?php echo $voucher_row; ?>][voucher_id]" value="<?php echo $order_voucher['voucher_id']; ?>" />
                  <input type="hidden" name="voucher[<?php echo $voucher_row; ?>][description]" value="<?php echo $order_voucher['description']; ?>" />
                  <input type="hidden" name="voucher[<?php echo $voucher_row; ?>][code]" value="<?php echo $order_voucher['code']; ?>" />
                  <input type="hidden" name="voucher[<?php echo $voucher_row; ?>][from_name]" value="<?php echo $order_voucher['from_name']; ?>" />
                  <input type="hidden" name="voucher[<?php echo $voucher_row; ?>][from_email]" value="<?php echo $order_voucher['from_email']; ?>" />
                  <input type="hidden" name="voucher[<?php echo $voucher_row; ?>][to_name]" value="<?php echo $order_voucher['to_name']; ?>" />
                  <input type="hidden" name="voucher[<?php echo $voucher_row; ?>][to_email]" value="<?php echo $order_voucher['to_email']; ?>" />
                  <input type="hidden" name="voucher[<?php echo $voucher_row; ?>][voucher_theme_id]" value="<?php echo $order_voucher['voucher_theme_id']; ?>" />
                  <input type="hidden" name="voucher[<?php echo $voucher_row; ?>][message]" value="<?php echo $order_voucher['message']; ?>" />
                  <input type="hidden" name="voucher[<?php echo $voucher_row; ?>][amount]" value="<?php echo $order_voucher['amount']; ?>" />
				</td>
                <td></td>
                <td>1</td>
                <td></td>
                <td></td>
                <td></td>
              </tr>
              <?php $voucher_row++; ?>
            <?php } ?>
          <?php } else { ?>
            <tr>
              <td class="text-center" colspan="6"><?php echo $text_no_results; ?></td>
            </tr>
          </tbody>
        <?php } ?>
      </table>
      <div id="tab-product" class="hidden">
        <fieldset>
          <input type="text" name="product" value="" id="input-product" />
          <input type="hidden" name="product_id" value="" />
          <input type="text" name="quantity" value="1" id="input-quantity" class="form-control" />
          <div id="option"></div>
        </fieldset>
        <div class="text-right">
          <button type="button" id="button-product-add"></button>
        </div>
      </div>
      <div id="tab-voucher" class="hidden">
        <fieldset>
          <input type="text" name="to_name" value="" id="input-to-name" />
          <input type="text" name="to_email" value="" id="input-to-email" />
          <input type="text" name="from_name" value="" id="input-from-name" />
          <input type="text" name="from_email" value="" id="input-from-email" />
          <select name="voucher_theme_id" id="input-theme">
            <?php foreach ($voucher_themes as $voucher_theme) { ?>
              <option value="<?php echo $voucher_theme['voucher_theme_id']; ?>"><?php echo $voucher_theme['name']; ?></option>
            <?php } ?>
          </select>
          <textarea name="message" rows="5" id="input-message"></textarea>
          <input type="text" name="amount" value="<?php echo $voucher_min; ?>" id="input-amount" />
        </fieldset>
        <div class="text-right">
          <button type="button" id="button-voucher-add"></button>
        </div>
      </div>
      <button type="button" id="button-cart"></button>
    </div>
    <div id="tab-payment" class="hidden">
      <select name="payment_address" id="input-payment-address" class="form-control">
        <option value="0" selected="selected"><?php echo $text_none; ?></option>
        <?php foreach ($addresses as $address) { ?>
          <option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname'] . ' ' . $address['lastname'] . ', ' . $address['address_1'] . ', ' . $address['city'] . ', ' . $address['country']; ?></option>
        <?php } ?>
      </select>
      <input type="text" name="firstname" value="<?php echo $payment_firstname; ?>" />
      <input type="text" name="lastname" value="<?php echo $payment_lastname; ?>" />
      <input type="text" name="company" value="<?php echo $payment_company; ?>" />
      <input type="text" name="address_1" value="<?php echo $payment_address_1; ?>" />
      <input type="text" name="address_2" value="<?php echo $payment_address_2; ?>" />
      <input type="text" name="city" value="<?php echo $payment_city; ?>" />
      <input type="text" name="postcode" value="<?php echo $payment_postcode; ?>" />
      <select name="country_id" id="input-payment-country">
        <option value=""><?php echo $text_select; ?></option>
        <?php foreach ($countries as $country) { ?>
          <?php if ($country['country_id'] == $payment_country_id) { ?>
            <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
          <?php } ?>
        <?php } ?>
      </select>
      <select name="zone_id" id="input-payment-zone" class="form-control"></select>
      <?php foreach ($custom_fields as $custom_field) { ?>
        <?php if ($custom_field['location'] == 'address') { ?>
          <?php if ($custom_field['type'] == 'select') { ?>
            <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <?php if (isset($payment_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $payment_custom_field[$custom_field['custom_field_id']]) { ?>
                  <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                <?php } ?>
              <?php } ?>
            </select>
          <?php } ?>
          <?php if ($custom_field['type'] == 'radio') { ?>
            <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
              <div class="radio">
                <?php if (isset($payment_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $payment_custom_field[$custom_field['custom_field_id']]) { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } else { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                    <?php echo $custom_field_value['name']; ?></label>
                <?php } ?>
              </div>
            <?php } ?>
          <?php } ?>
          <?php if ($custom_field['type'] == 'checkbox') { ?>
            <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
              <?php if (isset($payment_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $payment_custom_field[$custom_field['custom_field_id']])) { ?>
                <label>
                  <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                  <?php echo $custom_field_value['name']; ?></label>
                <?php } else { ?>
                <label>
                  <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                  <?php echo $custom_field_value['name']; ?></label>
              <?php } ?>
            <?php } ?>
          <?php } ?>
          <?php if ($custom_field['type'] == 'text') { ?>
            <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($payment_custom_field[$custom_field['custom_field_id']]) ? $payment_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
          <?php } ?>
          <?php if ($custom_field['type'] == 'textarea') { ?>
            <textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($payment_custom_field[$custom_field['custom_field_id']]) ? $payment_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
          <?php } ?>
          <?php if ($custom_field['type'] == 'file') { ?>
            <button type="button" id="button-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i></button>
            <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($payment_custom_field[$custom_field['custom_field_id']]) ? $payment_custom_field[$custom_field['custom_field_id']] : ''); ?>" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" />
          <?php } ?>
          <?php if ($custom_field['type'] == 'date') { ?>
            <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($payment_custom_field[$custom_field['custom_field_id']]) ? $payment_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
          <?php } ?>
          <?php if ($custom_field['type'] == 'time') { ?>
            <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($payment_custom_field[$custom_field['custom_field_id']]) ? $payment_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
          <?php } ?>
          <?php if ($custom_field['type'] == 'datetime') { ?>
            <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($payment_custom_field[$custom_field['custom_field_id']]) ? $payment_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
          <?php } ?>
        <?php } ?>
      <?php } ?>
      <button type="button" id="button-payment-address"></button>
    </div>
    <div id="tab-shipping" class="hidden">
      <select name="shipping_address" id="input-shipping-address" class="form-control">
        <option value="0" selected="selected"><?php echo $text_none; ?></option>
        <?php foreach ($addresses as $address) { ?>
          <option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname'] . ' ' . $address['lastname'] . ', ' . $address['address_1'] . ', ' . $address['city'] . ', ' . $address['country']; ?></option>
        <?php } ?>
      </select>
      <input type="text" name="firstname" value="<?php echo $shipping_firstname; ?>" />
      <input type="text" name="lastname" value="<?php echo $shipping_lastname; ?>" />
      <input type="text" name="company" value="<?php echo $shipping_company; ?>" />
      <input type="text" name="address_1" value="<?php echo $shipping_address_1; ?>" />
      <input type="text" name="address_2" value="<?php echo $shipping_address_2; ?>" />
      <input type="text" name="city" value="<?php echo $shipping_city; ?>" />
      <input type="text" name="postcode" value="<?php echo $shipping_postcode; ?>" />
      <select name="country_id">
        <option value=""><?php echo $text_select; ?></option>
        <?php foreach ($countries as $country) { ?>
          <?php if ($country['country_id'] == $shipping_country_id) { ?>
            <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
          <?php } ?>
        <?php } ?>
      </select>
      <select name="zone_id" id="input-shipping-zone" class="form-control"></select>
      <?php foreach ($custom_fields as $custom_field) { ?>
        <?php if ($custom_field['location'] == 'address') { ?>
          <?php if ($custom_field['type'] == 'select') { ?>
            <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <?php if (isset($ashipping_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $shipping_custom_field[$custom_field['custom_field_id']]) { ?>
                  <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                <?php } ?>
              <?php } ?>
            </select>
          <?php } ?>
          <?php if ($custom_field['type'] == 'radio') { ?>
            <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
              <div class="radio">
                <?php if (isset($shipping_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $shipping_custom_field[$custom_field['custom_field_id']]) { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } else { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                    <?php echo $custom_field_value['name']; ?></label>
                <?php } ?>
              </div>
            <?php } ?>
          <?php } ?>
          <?php if ($custom_field['type'] == 'checkbox') { ?>
            <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
              <?php if (isset($shipping_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $shipping_custom_field[$custom_field['custom_field_id']])) { ?>
                <label>
                  <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                  <?php echo $custom_field_value['name']; ?></label>
                <?php } else { ?>
                <label>
                  <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                  <?php echo $custom_field_value['name']; ?></label>
              <?php } ?>
            <?php } ?>
          <?php } ?>
          <?php if ($custom_field['type'] == 'text') { ?>
            <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($shipping_custom_field[$custom_field['custom_field_id']]) ? $shipping_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
          <?php } ?>
          <?php if ($custom_field['type'] == 'textarea') { ?>
            <textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($shipping_custom_field[$custom_field['custom_field_id']]) ? $shipping_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
          <?php } ?>
          <?php if ($custom_field['type'] == 'file') { ?>
            <button type="button" id="button-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i></button>
            <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($shipping_custom_field[$custom_field['custom_field_id']]) ? $shipping_custom_field[$custom_field['custom_field_id']] : ''); ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" />
          <?php } ?>
          <?php if ($custom_field['type'] == 'date') { ?>
            <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($shipping_custom_field[$custom_field['custom_field_id']]) ? $shipping_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
          <?php } ?>
          <?php if ($custom_field['type'] == 'time') { ?>
            <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($shipping_custom_field[$custom_field['custom_field_id']]) ? $shipping_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
          <?php } ?>
          <?php if ($custom_field['type'] == 'datetime') { ?>
            <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($shipping_custom_field[$custom_field['custom_field_id']]) ? $shipping_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
          <?php } ?>
        <?php } ?>
      <?php } ?>
      <button type="button" id="button-shipping-address"></button>
    </div>
    <div id="tab-total">
      <div class="hidden">
        <table class="table table-bordered">
          <tbody id="total">
            <tr>
              <td class="text-center" colspan="5"><?php echo $text_no_results; ?></td>
            </tr>
          </tbody>
        </table>
      </div>
      <fieldset>
        <div class="<?php echo $shipping_view; ?>">
		  <select name="shipping_method" id="input-shipping-method" class="form-control">
            <option value=""><?php echo $text_select; ?></option>
            <?php if ($shipping_code) { ?>
              <option value="<?php echo $shipping_code; ?>" selected="selected"><?php echo $shipping_method; ?></option>
            <?php } ?>
          </select>
		  <button type="button" id="button-shipping-method" class="hidden"></button>
		</div>
        <div class="<?php echo $payment_view; ?>">
          <select name="payment_method" id="input-payment-method" class="form-control">
            <option value=""><?php echo $text_select; ?></option>
            <?php if ($payment_code) { ?>
              <option value="<?php echo $payment_code; ?>" selected="selected"><?php echo $payment_method; ?></option>
            <?php } ?>
          </select>
          <button type="button" id="button-payment-method" class="hidden"></button>
        </div>
        <div class="hidden">
          <input type="text" name="coupon" value="<?php echo $coupon; ?>" />
          <button type="button" id="button-coupon"></button>
        </div>
        <div class="hidden">
          <input type="text" name="voucher" value="<?php echo $voucher; ?>" />
          <button type="button" id="button-voucher"></button>
        </div>
        <div class="hidden">
          <input type="text" name="reward" value="<?php echo $reward; ?>" id="input-reward" />
          <button type="button" id="button-reward"></button>
        </div>
        <div class="hidden">
          <select name="order_status_id">
            <?php foreach ($order_statuses as $order_status) { ?>
              <?php if ($order_status['order_status_id'] == $order_status_id) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
              <?php } ?>
            <?php } ?>
          </select>
          <input type="hidden" name="order_id" value="<?php echo $order_id; ?>" />
        </div>
        <div class="hidden">
          <textarea name="comment"><?php echo $comment; ?></textarea>
        </div>
        <div class="hidden">
          <input type="text" name="affiliate" value="<?php echo $affiliate; ?>" />
          <input type="hidden" name="affiliate_id" value="<?php echo $affiliate_id; ?>" />
        </div>
      </fieldset>
      <div class="hidden">
        <button type="button" id="button-refresh"></button>
      </div>
    </div>
  </form>
</div>
<div id="modal-footer" class="modal-footer">
  <div class="text-center">
    <div class="<?php echo $shipping_view; ?>">
	  <button type="button" id="load-shipping-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg"><?php echo $button_load_method; ?></button>
	</div>
	<div class="<?php echo $payment_view; ?>">
	  <button type="button" id="load-payment-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg"><?php echo $button_load_method; ?></button>
	</div>
	<button type="button" id="button-save" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-info btn-lg hidden"><?php echo $button_save; ?></button>
  </div>
</div>
<script type="text/javascript"><!--
var token = '';

// Login to the API
$.ajax({
	url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/login',
	type: 'post',
	data: 'key=<?php echo $api_key; ?>',
	dataType: 'json',
	crossDomain: true,
	success: function(json) {
        $('.alert').remove();

        if (json['error']) {
    		if (json['error']['key']) {
    			$('#form-order-method').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['key'] + '</div>');
				$('.alert-danger').delay(1500).fadeOut(500);
				
    		}

            if (json['error']['ip']) {
    			$('#form-order-method').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['ip'] + ' <button type="button" id="button-ip-add" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-danger btn-xs pull-right"><i class="fa fa-plus"></i> <?php echo $button_ip_add; ?></button></div>');
    		}
        }

		if (json['token']) {
			token = json['token'];

            $('select[name=\'currency\']').trigger('change');
		}
	},
	error: function(xhr, ajaxOptions, thrownError) {
		alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	}
});

$(document).delegate('#button-ip-add', 'click', function() {
	$.ajax({
		url: 'index.php?route=user/api/addip&token=<?php echo $token; ?>&api_id=<?php echo $api_id; ?>',
		type: 'post',
		data: 'ip=<?php echo $api_ip; ?>',
		dataType: 'json',
		beforeSend: function() {
			$('#button-ip-add').button('loading');
		},
		complete: function() {
			$('#button-ip-add').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#form-order-method').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				$('.alert-danger').delay(1500).fadeOut(500);
			}

			if (json['success']) {
				$('#form-order-method').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
				$('.alert-success').delay(1500).fadeOut(500);
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

// Currency
$('select[name=\'currency\']').on('change', function() {
	$.ajax({
		url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/currency&token=' + token,
		type: 'post',
		data: 'currency=' + $('select[name=\'currency\'] option:selected').val(),
		dataType: 'json',
		crossDomain: true,
		beforeSend: function() {
			$('select[name=\'currency\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				$('.alert-danger').delay(1500).fadeOut(500);

				// Highlight any found errors
				$('select[name=\'currency\']').parent().parent().addClass('has-error');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

// Add all products to the cart using the api
$('#button-refresh').on('click', function() {
	$.ajax({
		url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/cart/products&token=' + token,
		dataType: 'json',
		crossDomain: true,
		success: function(json) {
			$('.alert-danger, .text-danger').remove();

			// Check for errors
			if (json['error']) {
				if (json['error']['warning']) {
					$('.alert-danger').delay(1500).fadeOut(500);
				}

				if (json['error']['stock']) {
					$('.alert-danger').delay(1500).fadeOut(500);
				}

				if (json['error']['minimum']) {
					for (i in json['error']['minimum']) {
						$('.alert-danger').delay(1500).fadeOut(500);
					}
				}
			}

			var shipping = false;

			html = '';

			if (json['products'].length) {
				for (i = 0; i < json['products'].length; i++) {
					product = json['products'][i];

					html += '<tr>';
					html += '  <td class="text-left">' + product['name'] + ' ' + (!product['stock'] ? '<span class="text-danger">***</span>' : '') + '<br />';
					html += '  <input type="hidden" name="product[' + i + '][product_id]" value="' + product['product_id'] + '" />';

					if (product['option']) {
						for (j = 0; j < product['option'].length; j++) {
							option = product['option'][j];

							html += '  - <small>' + option['name'] + ': ' + option['value'] + '</small><br />';

							if (option['type'] == 'select' || option['type'] == 'radio' || option['type'] == 'image') {
								html += '<input type="hidden" name="product[' + i + '][option][' + option['product_option_id'] + ']" value="' + option['product_option_value_id'] + '" />';
							}

							if (option['type'] == 'checkbox') {
								html += '<input type="hidden" name="product[' + i + '][option][' + option['product_option_id'] + '][]" value="' + option['product_option_value_id'] + '" />';
							}

							if (option['type'] == 'text' || option['type'] == 'textarea' || option['type'] == 'file' || option['type'] == 'date' || option['type'] == 'datetime' || option['type'] == 'time') {
								html += '<input type="hidden" name="product[' + i + '][option][' + option['product_option_id'] + ']" value="' + option['value'] + '" />';
							}
						}
					}

					html += '</td>';
					html += '  <td class="text-left">' + product['model'] + '</td>';
					html += '  <td class="text-right"><div class="input-group btn-block" style="max-width: 200px;"><input type="text" name="product[' + i + '][quantity]" value="' + product['quantity'] + '" class="form-control" /><span class="input-group-btn"><button id="btn-refresh-quantity" type="button"></button></span></div></td>';
                    html += '  <td class="text-right">' + product['price'] + '</td>';
					html += '  <td class="text-right">' + product['total'] + '</td>';
					html += '  <td class="text-center" style="width: 3px;"><button type="button" value="' + product['cart_id'] + '"></button></td>';
					html += '</tr>';

					if (product['shipping'] != 0) {
						shipping = true;
					}
				}
			}

			if (!shipping) {
				$('select[name=\'shipping_method\'] option').removeAttr('selected');
				$('select[name=\'shipping_method\']').prop('disabled', true);
				$('#button-shipping-method').prop('disabled', true);
			} else {
				$('select[name=\'shipping_method\']').prop('disabled', false);
				$('#button-shipping-method').prop('disabled', false);
			}

			if (json['vouchers'].length) {
				for (i in json['vouchers']) {
					voucher = json['vouchers'][i];

					html += '<tr>';
					html += '  <td class="text-left">' + voucher['description'];
                    html += '    <input type="hidden" name="voucher[' + i + '][code]" value="' + voucher['code'] + '" />';
					html += '    <input type="hidden" name="voucher[' + i + '][description]" value="' + voucher['description'] + '" />';
                    html += '    <input type="hidden" name="voucher[' + i + '][from_name]" value="' + voucher['from_name'] + '" />';
                    html += '    <input type="hidden" name="voucher[' + i + '][from_email]" value="' + voucher['from_email'] + '" />';
                    html += '    <input type="hidden" name="voucher[' + i + '][to_name]" value="' + voucher['to_name'] + '" />';
                    html += '    <input type="hidden" name="voucher[' + i + '][to_email]" value="' + voucher['to_email'] + '" />';
                    html += '    <input type="hidden" name="voucher[' + i + '][voucher_theme_id]" value="' + voucher['voucher_theme_id'] + '" />';
                    html += '    <input type="hidden" name="voucher[' + i + '][message]" value="' + voucher['message'] + '" />';
                    html += '    <input type="hidden" name="voucher[' + i + '][amount]" value="' + voucher['amount'] + '" />';
					html += '  </td>';
					html += '  <td class="text-left"></td>';
					html += '  <td class="text-right">1</td>';
					html += '  <td class="text-right">' + voucher['amount'] + '</td>';
					html += '  <td class="text-right">' + voucher['amount'] + '</td>';
					html += '  <td class="text-center" style="width: 3px;"><button type="button" value="' + voucher['code'] + '"></button></td>';
					html += '</tr>';
				}
			}

			if (!json['products'].length && !json['vouchers'].length) {
				html += '<tr>';
				html += '  <td colspan="6" class="text-center"><?php echo $text_no_results; ?></td>';
				html += '</tr>';
			}

			$('#cart').html(html);

			// Totals
			html = '';

			if (json['products'].length) {
				for (i = 0; i < json['products'].length; i++) {
					product = json['products'][i];

					html += '<tr>';
					html += '  <td class="text-left">' + product['name'] + ' ' + (!product['stock'] ? '<span class="text-danger">***</span>' : '') + '<br />';

					if (product['option']) {
						for (j = 0; j < product['option'].length; j++) {
							option = product['option'][j];

							html += '  - <small>' + option['name'] + ': ' + option['value'] + '</small><br />';
						}
					}

					html += '  </td>';
					html += '  <td class="text-left">' + product['model'] + '</td>';
					html += '  <td class="text-right">' + product['quantity'] + '</td>';
					html += '  <td class="text-right">' + product['price'] + '</td>';
					html += '  <td class="text-right">' + product['total'] + '</td>';
					html += '</tr>';
				}
			}

			if (json['vouchers'].length) {
				for (i in json['vouchers']) {
					voucher = json['vouchers'][i];

					html += '<tr>';
					html += '  <td class="text-left">' + voucher['description'] + '</td>';
					html += '  <td class="text-left"></td>';
					html += '  <td class="text-right">1</td>';
					html += '  <td class="text-right">' + voucher['amount'] + '</td>';
					html += '  <td class="text-right">' + voucher['amount'] + '</td>';
					html += '</tr>';
				}
			}

			if (json['totals'].length) {
				for (i in json['totals']) {
					total = json['totals'][i];

					html += '<tr>';
					html += '  <td class="text-right" colspan="4">' + total['title'] + ':</td>';
					html += '  <td class="text-right">' + total['text'] + '</td>';
					html += '</tr>';
				}
			}

			if (!json['totals'].length && !json['products'].length && !json['vouchers'].length) {
				html += '<tr>';
				html += '  <td colspan="5" class="text-center"><?php echo $text_no_results; ?></td>';
				html += '</tr>';
			}

			$('#total').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

// Custom Fields
$('select[name=\'customer_group_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=customer/customer/customfield&token=<?php echo $token; ?>&customer_group_id=' + this.value,
		dataType: 'json',
		success: function(json) {
			$('.custom-field').hide();
			$('.custom-field').removeClass('required');

			for (i = 0; i < json.length; i++) {
				custom_field = json[i];

				$('.custom-field' + custom_field['custom_field_id']).show();

				if (custom_field['required']) {
					$('.custom-field' + custom_field['custom_field_id']).addClass('required');
				}
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'customer_group_id\']').trigger('change');

$('#button-customer').on('click', function() {
	$.ajax({
		url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/customer&token=' + token,
		type: 'post',
		data: $('#tab-customer input[type=\'text\'], #tab-customer input[type=\'hidden\'], #tab-customer input[type=\'radio\']:checked, #tab-customer input[type=\'checkbox\']:checked, #tab-customer select, #tab-customer textarea'),
		dataType: 'json',
		crossDomain: true,
		beforeSend: function() {
			$('#button-customer').button('loading');
		},
		complete: function() {
			 $('#button-customer').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['warning']) {
					$('.alert-danger').delay(1500).fadeOut(500);
				}

				for (i in json['error']) {
					var element = $('#input-' + i.replace('_', '-'));

					if (element.parent().hasClass('input-group')) {
                   		$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
					} else {
						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
					}
				}

				// Highlight any found errors
				$('.text-danger').parentsUntil('.form-group').parent().addClass('has-error');
			} else {
                // Refresh products, vouchers and totals
                var request_1 = $.ajax({
                    url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/cart/add&token=' + token,
                    type: 'post',
                    data: $('#cart input[name^=\'product\'][type=\'text\'], #cart input[name^=\'product\'][type=\'hidden\'], #cart input[name^=\'product\'][type=\'radio\']:checked, #cart input[name^=\'product\'][type=\'checkbox\']:checked, #cart select[name^=\'product\'], #cart textarea[name^=\'product\']'),
                    dataType: 'json',
                    crossDomain: true,
                    beforeSend: function() {
                        $('#button-product-add').button('loading');
                    },
                    complete: function() {
                        $('#button-product-add').button('reset');
                    },
                    success: function(json) {
                        $('.alert, .text-danger').remove();
                        $('.form-group').removeClass('has-error');

                        if (json['error'] && json['error']['warning']) {
                            $('.alert, .text-danger').remove();
                        }
            		},
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });

                var request_2 = request_1.then(function() {
                    $.ajax({
                        url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/voucher/add&token=' + token,
                        type: 'post',
                        data: $('#cart input[name^=\'voucher\'][type=\'text\'], #cart input[name^=\'voucher\'][type=\'hidden\'], #cart input[name^=\'voucher\'][type=\'radio\']:checked, #cart input[name^=\'voucher\'][type=\'checkbox\']:checked, #cart select[name^=\'voucher\'], #cart textarea[name^=\'voucher\']'),
                        dataType: 'json',
                        crossDomain: true,
                        beforeSend: function() {
                            $('#button-voucher-add').button('loading');
                        },
                        complete: function() {
                            $('#button-voucher-add').button('reset');
                        },
                        success: function(json) {
                            $('.alert, .text-danger').remove();
                            $('.form-group').removeClass('has-error');

                            if (json['error'] && json['error']['warning']) {
                               $('.alert, .text-danger').remove();
                            }
                		},
                        error: function(xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });
                });

                request_2.done(function() {
                    $('#button-refresh').trigger('click');

                    $('a[href=\'#tab-cart\']').tab('show');
                });
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#cart').delegate('.btn-primary', 'click', function() {
    var node = this;

    // Refresh products, vouchers and totals
    $.ajax({
        url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/cart/add&token=' + token,
        type: 'post',
        data: $('#cart input[name^=\'product\'][type=\'text\'], #cart input[name^=\'product\'][type=\'hidden\'], #cart input[name^=\'product\'][type=\'radio\']:checked, #cart input[name^=\'product\'][type=\'checkbox\']:checked, #cart select[name^=\'product\'], #cart textarea[name^=\'product\']'),
        dataType: 'json',
        crossDomain: true,
        beforeSend: function() {
            $(node).button('loading');
        },
        complete: function() {
            $(node).button('reset');
        },
        success: function(json) {
            $('.alert, .text-danger').remove();
            $('.form-group').removeClass('has-error');

            if (json['error'] && json['error']['warning']) {
               $('.alert, .text-danger').remove();
            }

            if (json['success']) {
				$('.alert, .text-danger').remove();
			}
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }).done(function() {
        $('#button-refresh').trigger('click');
    });
});

// Payment Address
$('select[name=\'payment_address\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=customer/customer/address&token=<?php echo $token; ?>&address_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'payment_address\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('#tab-payment .fa-spin').remove();
		},
		success: function(json) {
			// Reset all fields
			$('#tab-payment input[type=\'text\'], #tab-payment input[type=\'text\'], #tab-payment textarea').val('');
			$('#tab-payment select option').not('#tab-payment select[name=\'payment_address\']').removeAttr('selected');
			$('#tab-payment input[type=\'checkbox\'], #tab-payment input[type=\'radio\']').removeAttr('checked');

			$('#tab-payment input[name=\'firstname\']').val(json['firstname']);
			$('#tab-payment input[name=\'lastname\']').val(json['lastname']);
			$('#tab-payment input[name=\'company\']').val(json['company']);
			$('#tab-payment input[name=\'address_1\']').val(json['address_1']);
			$('#tab-payment input[name=\'address_2\']').val(json['address_2']);
			$('#tab-payment input[name=\'city\']').val(json['city']);
			$('#tab-payment input[name=\'postcode\']').val(json['postcode']);
			$('#tab-payment select[name=\'country_id\']').val(json['country_id']);

			payment_zone_id = json['zone_id'];

			for (i in json['custom_field']) {
				$('#tab-payment select[name=\'custom_field[' + i + ']\']').val(json['custom_field'][i]);
				$('#tab-payment textarea[name=\'custom_field[' + i + ']\']').val(json['custom_field'][i]);
				$('#tab-payment input[name^=\'custom_field[' + i + ']\'][type=\'text\']').val(json['custom_field'][i]);
				$('#tab-payment input[name^=\'custom_field[' + i + ']\'][type=\'hidden\']').val(json['custom_field'][i]);
				$('#tab-payment input[name^=\'custom_field[' + i + ']\'][type=\'radio\'][value=\'' + json['custom_field'][i] + '\']').prop('checked', true);
				$('#tab-payment input[name^=\'custom_field[' + i + ']\'][type=\'checkbox\'][value=\'' + json['custom_field'][i] + '\']').prop('checked', true);

				if (json['custom_field'][i] instanceof Array) {
					for (j = 0; j < json['custom_field'][i].length; j++) {
						$('#tab-payment input[name^=\'custom_field[' + i + ']\'][type=\'checkbox\'][value=\'' + json['custom_field'][i][j] + '\']').prop('checked', true);
					}
				}
			}

			$('#tab-payment select[name=\'country_id\']').trigger('change');
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

var payment_zone_id = '<?php echo $payment_zone_id; ?>';

$('#tab-payment select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=localisation/country/country&token=<?php echo $token; ?>&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#tab-payment select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('#tab-payment .fa-spin').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#tab-payment input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('#tab-payment input[name=\'postcode\']').parent().parent().removeClass('required');
			}

			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == payment_zone_id) {
	      				html += ' selected="selected"';
	    			}

	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('#tab-payment select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#tab-payment select[name=\'country_id\']').trigger('change');

$('#button-payment-address').on('click', function() {
	$.ajax({
		url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/payment/address&token=' + token,
		type: 'post',
		data: $('#tab-payment input[type=\'text\'], #tab-payment input[type=\'hidden\'], #tab-payment input[type=\'radio\']:checked, #tab-payment input[type=\'checkbox\']:checked, #tab-payment select, #tab-payment textarea'),
		dataType: 'json',
		crossDomain: true,
		success: function(json) {
			// Check for errors
			if (json['error']) {
				if (json['error']['warning']) {
					$('.alert-success').delay(1500).fadeOut(500);
				}

			} else {
				// Payment Methods
				$.ajax({
					url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/payment/methods&token=' + token,
					dataType: 'json',
					crossDomain: true,
					beforeSend: function() {
						$('#button-payment-address i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
						$('#button-payment-address').prop('disabled', true);
					},
					complete: function() {
						$('#button-payment-address i').replaceWith('<i class="fa fa-arrow-right"></i>');
						$('#button-payment-address').prop('disabled', false);
					},
					success: function(json) {
						if (json['error']) {
							$('.alert-success').delay(1500).fadeOut(500);
						} else {
							html = '<option value=""><?php echo $text_select; ?></option>';

							if (json['payment_methods']) {
								for (i in json['payment_methods']) {
									if (json['payment_methods'][i]['code'] == $('select[name=\'payment_method\'] option:selected').val()) {
										html += '<option value="' + json['payment_methods'][i]['code'] + '" selected="selected">' + json['payment_methods'][i]['title'] + '</option>';
									} else {
										html += '<option value="' + json['payment_methods'][i]['code'] + '">' + json['payment_methods'][i]['title'] + '</option>';
									}
								}
							}

							$('select[name=\'payment_method\']').html(html);
							
							$('#modal-footer #button-save').removeClass('hidden');
							$('#modal-footer #load-payment-method').addClass('hidden');
						}
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				}).done(function() {
                    // Refresh products, vouchers and totals
    				$('#button-refresh').trigger('click');
                });
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

// Shipping Address
$('select[name=\'shipping_address\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=customer/customer/address&token=<?php echo $token; ?>&address_id=' + this.value,
		dataType: 'json',
		success: function(json) {
			// Reset all fields
			$('#tab-shipping input[type=\'text\'], #tab-shipping input[type=\'text\'], #tab-shipping textarea').val('');
			$('#tab-shipping select option').not('#tab-shipping select[name=\'shipping_address\']').removeAttr('selected');
			$('#tab-shipping input[type=\'checkbox\'], #tab-shipping input[type=\'radio\']').removeAttr('checked');

			$('#tab-shipping input[name=\'firstname\']').val(json['firstname']);
			$('#tab-shipping input[name=\'lastname\']').val(json['lastname']);
			$('#tab-shipping input[name=\'company\']').val(json['company']);
			$('#tab-shipping input[name=\'address_1\']').val(json['address_1']);
			$('#tab-shipping input[name=\'address_2\']').val(json['address_2']);
			$('#tab-shipping input[name=\'city\']').val(json['city']);
			$('#tab-shipping input[name=\'postcode\']').val(json['postcode']);
			$('#tab-shipping select[name=\'country_id\']').val(json['country_id']);

			shipping_zone_id = json['zone_id'];

			for (i in json['custom_field']) {
				$('#tab-shipping select[name=\'custom_field[' + i + ']\']').val(json['custom_field'][i]);
				$('#tab-shipping textarea[name=\'custom_field[' + i + ']\']').val(json['custom_field'][i]);
				$('#tab-shipping input[name^=\'custom_field[' + i + ']\'][type=\'text\']').val(json['custom_field'][i]);
				$('#tab-shipping input[name^=\'custom_field[' + i + ']\'][type=\'hidden\']').val(json['custom_field'][i]);
				$('#tab-shipping input[name^=\'custom_field[' + i + ']\'][type=\'radio\'][value=\'' + json['custom_field'][i] + '\']').prop('checked', true);
				$('#tab-shipping input[name^=\'custom_field[' + i + ']\'][type=\'checkbox\'][value=\'' + json['custom_field'][i] + '\']').prop('checked', true);

				if (json['custom_field'][i] instanceof Array) {
					for (j = 0; j < json['custom_field'][i].length; j++) {
						$('#tab-shipping input[name^=\'custom_field[' + i + ']\'][type=\'checkbox\'][value=\'' + json['custom_field'][i][j] + '\']').prop('checked', true);
					}
				}
			}

			$('#tab-shipping select[name=\'country_id\']').trigger('change');
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

var shipping_zone_id = '<?php echo $shipping_zone_id; ?>';

$('#tab-shipping select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=localisation/country/country&token=<?php echo $token; ?>&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#tab-shipping select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('#tab-shipping .fa-spin').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#tab-shipping input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('#tab-shipping input[name=\'postcode\']').parent().parent().removeClass('required');
			}

			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == shipping_zone_id) {
	      				html += ' selected="selected"';
	    			}

	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('#tab-shipping select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#tab-shipping select[name=\'country_id\']').trigger('change');

$('#button-shipping-address').on('click', function() {
	$.ajax({
		url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/shipping/address&token=' + token,
		type: 'post',
		data: $('#tab-shipping input[type=\'text\'], #tab-shipping input[type=\'hidden\'], #tab-shipping input[type=\'radio\']:checked, #tab-shipping input[type=\'checkbox\']:checked, #tab-shipping select, #tab-shipping textarea'),
		dataType: 'json',
		crossDomain: true,
		success: function(json) {
			// Check for errors
			if (json['error']) {
				if (json['error']['warning']) {
					$('.alert-success').delay(1500).fadeOut(500);
				}
			} else {
				// Shipping Methods
				var request = $.ajax({
					url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/shipping/methods&token=' + token,
					dataType: 'json',
					beforeSend: function() {
						$('#button-shipping-address i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
						$('#button-shipping-address').prop('disabled', true);
					},
					complete: function() {
						$('#button-shipping-address i').replaceWith('<i class="fa fa-arrow-right"></i>');
						$('#button-shipping-address').prop('disabled', false);
					},
					success: function(json) {
						if (json['error']) {
							$('.alert-success').delay(1500).fadeOut(500);
						} else {
							// Shipping Methods
							html = '<option value=""><?php echo $text_select; ?></option>';

							if (json['shipping_methods']) {
								for (i in json['shipping_methods']) {
									html += '<optgroup label="' + json['shipping_methods'][i]['title'] + '">';

									if (!json['shipping_methods'][i]['error']) {
										for (j in json['shipping_methods'][i]['quote']) {
											if (json['shipping_methods'][i]['quote'][j]['code'] == $('select[name=\'shipping_method\'] option:selected').val()) {
												html += '<option value="' + json['shipping_methods'][i]['quote'][j]['code'] + '" selected="selected">' + json['shipping_methods'][i]['quote'][j]['title'] + ' - ' + json['shipping_methods'][i]['quote'][j]['text'] + '</option>';
											} else {
												html += '<option value="' + json['shipping_methods'][i]['quote'][j]['code'] + '">' + json['shipping_methods'][i]['quote'][j]['title'] + ' - ' + json['shipping_methods'][i]['quote'][j]['text'] + '</option>';
											}
										}
									} else {
										html += '<option value="" style="color: #F00;" disabled="disabled">' + json['shipping_method'][i]['error'] + '</option>';
									}

									html += '</optgroup>';
								}
							}

							$('select[name=\'shipping_method\']').html(html);

							$('#modal-footer #button-save').removeClass('hidden');
							$('#modal-footer #load-shipping-method').addClass('hidden');
						}
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				}).done(function() {
				    // Refresh products, vouchers and totals
				    $('#button-refresh').trigger('click');
                });
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

// Shipping Method
$('#button-shipping-method').on('click', function() {
	$.ajax({
		url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/shipping/method&token=' + token,
		type: 'post',
		data: 'shipping_method=' + $('select[name=\'shipping_method\'] option:selected').val(),
		dataType: 'json',
		crossDomain: true,
		success: function(json) {
			if (json['error']) {
				$('.alert-success').delay(1500).fadeOut(500);
			}

			if (json['success']) {
				$('.alert-success').delay(1500).fadeOut(500);

				// Refresh products, vouchers and totals
				$('#button-refresh').trigger('click');
				
				$('#button-payment-address').trigger('click');
				$('#button-payment-method').trigger('click');

			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

// Payment Method
$('#button-payment-method').on('click', function() {
	$.ajax({
		url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/payment/method&token=' + token,
		type: 'post',
		data: 'payment_method=' + $('select[name=\'payment_method\'] option:selected').val(),
		dataType: 'json',
		crossDomain: true,
		success: function(json) {			
			if (json['error']) {
				$('.alert-success').delay(1500).fadeOut(500);
			}

			if (json['success']) {
				$('.alert-success').delay(1500).fadeOut(500);
				
				// Refresh products, vouchers and totals
				$('#button-refresh').trigger('click');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

// Coupon
$('#button-coupon').on('click', function() {
	$.ajax({
		url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/coupon&token=' + token,
		type: 'post',
		data: 'coupon=' + $('input[name=\'coupon\']').val(),
		dataType: 'json',
		crossDomain: true,
		success: function(json) {
			if (json['error']) {
				$('.alert-success').delay(1500).fadeOut(500);
			}

			if (json['success']) {
				$('.alert-success').delay(1500).fadeOut(500);
				
				// Refresh products, vouchers and totals
				$('#button-refresh').trigger('click');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

// Voucher
$('#button-voucher').on('click', function() {
	$.ajax({
		url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/voucher&token=' + token,
		type: 'post',
		data: 'voucher=' + $('input[name=\'voucher\']').val(),
		dataType: 'json',
		crossDomain: true,
		success: function(json) {
			if (json['error']) {
				$('.alert-success').delay(1500).fadeOut(500);
			}

			if (json['success']) {
				$('.alert-success').delay(1500).fadeOut(500);
				
				// Refresh products, vouchers and totals
				$('#button-refresh').trigger('click');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

// Reward
$('#button-reward').on('click', function() {
	$.ajax({
		url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/reward&token=' + token,
		type: 'post',
		data: 'reward=' + $('input[name=\'reward\']').val(),
		dataType: 'json',
		crossDomain: true,
		success: function(json) {
			if (json['error']) {
				$('.alert-success').delay(1500).fadeOut(500);
			}

			if (json['success']) {
				$('.alert-success').delay(1500).fadeOut(500);
				
				// Refresh products, vouchers and totals
				$('#button-refresh').trigger('click');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#load-payment-method').on('click', function() {
	$('#button-customer').trigger('click');
	$('#btn-refresh-quantity').trigger('click');
	$('#button-payment-address').trigger('click');
	$('#button-shipping-address').trigger('click');
	$('#button-shipping-method').trigger('click');
	$('#button-coupon').trigger('click');
	$('#button-reward').trigger('click');
});

$('#load-shipping-method').on('click', function() {
	$('#button-customer').trigger('click');
	$('#btn-refresh-quantity').trigger('click');
	$('#button-payment-address').trigger('click');
	$('#button-payment-method').trigger('click');
	$('#button-shipping-address').trigger('click');
	$('#button-coupon').trigger('click');
	$('#button-reward').trigger('click');
});

$('select[name=\'payment_method\']').on('change', function() {
	$('#button-payment-method').trigger('click');
	$('#button-shipping-method').trigger('click');
});

$('select[name=\'shipping_method\']').on('change', function() {
	$('#button-payment-method').trigger('click');
	$('#button-shipping-method').trigger('click');
});

// Checkout
$('#button-save').on('click', function() {
	if ($('input[name=\'order_id\']').val() == 0) {
		var url = $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/order/add&token=' + token;
	} else {
		var url = $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/order/edit&token=' + token + '&order_id=' + $('input[name=\'order_id\']').val();
	}

	$.ajax({
		url: url,
		type: 'post',
		data: $('select[name=\'payment_method\'] option:selected,  select[name=\'shipping_method\'] option:selected,  #tab-total select[name=\'order_status_id\'], #tab-total select, #tab-total textarea[name=\'comment\'], #tab-total input[name=\'affiliate_id\']'),
		dataType: 'json',
		crossDomain: true,
		success: function(json) {
			if (json['error']) {
				$('.alert-success').delay(1500).fadeOut(500);
			}

			if (json['success']) {
				$('#form-order-method').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '  <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                // Refresh products, vouchers and totals
				$('#button-refresh').trigger('click');
				
				$('#order-products').load('index.php?route=editors/order/order_products&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>');
				$('#payment-method').load('index.php?route=editors/order/getPaymentMethod&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>');
				$('#shipping-method').load('index.php?route=editors/order/getShippingMethod&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>');
				
				setTimeout(function(){
					$('#modal-order').modal('hide');
				}, 1000)
            }

			if (json['order_id']) {
				$('input[name=\'order_id\']').val(json['order_id']);
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
//--></script>