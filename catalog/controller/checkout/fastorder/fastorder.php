<?php
class ControllerCheckoutFastorderFastorder extends Controller {
	public function index() {

		if ($this->cart->hasProducts()) {
			$data['cart_status'] = true;
		} elseif(isset($this->session->data['vouchers'])) {
			$data['cart_status'] = true;
		} else {
			$data['cart_status'] = false;
		}

		$this->load->language('checkout/fastorder');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['fastorder_data'] = $this->config->get('fastorder_data');
		$fastorder_data = $this->config->get('fastorder_data');

		$this->load->model('extension/extension');
		$this->load->model('tool/image');
		$this->load->model('tool/upload');
		$this->load->model('account/address');
		$this->load->model('localisation/country');

		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('checkout/fastorder/fastorder', '', 'SSL')
		);

		$data['heading_title'] = $this->language->get('heading_title');
		$data['heading_login_block'] = $this->language->get('heading_login_block');
		$data['heading_user_block'] = $this->language->get('heading_user_block');
		$data['heading_payment_block'] = $this->language->get('heading_payment_block');
		$data['heading_shipping_block'] = $this->language->get('heading_shipping_block');
		$data['heading_cart_block'] = $this->language->get('heading_cart_block');

		$data['text_loading'] = $this->language->get('text_loading');
		$data['text_payment_method'] = $this->language->get('text_payment_method');
		$data['text_shipping_method'] = $this->language->get('text_shipping_method');
		$data['text_i_am_returning_customer'] = $this->language->get('text_i_am_returning_customer');
		$data['text_forgotten'] = $this->language->get('text_forgotten');
		$data['text_recurring_item'] = $this->language->get('text_recurring_item');
		$data['text_next'] = $this->language->get('text_next');
		$data['text_next_choice'] = $this->language->get('text_next_choice');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_your_details'] = $this->language->get('text_your_details');
		$data['text_your_address'] = $this->language->get('text_your_address');
		$data['text_address_new'] = $this->language->get('text_address_new');
		$data['text_address_existing'] = $this->language->get('text_address_existing');
		$data['text_registered'] = $this->language->get('text_registered');

		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_password'] = $this->language->get('entry_password');
		$data['entry_firstname'] = $this->language->get('entry_firstname');
		$data['entry_lastname'] = $this->language->get('entry_lastname');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_telephone'] = $this->language->get('entry_telephone');
		$data['entry_fax'] = $this->language->get('entry_fax');
		$data['entry_company'] = $this->language->get('entry_company');
		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_address_1'] = $this->language->get('entry_address_1');
		$data['entry_address_2'] = $this->language->get('entry_address_2');
		$data['entry_postcode'] = $this->language->get('entry_postcode');
		$data['entry_city'] = $this->language->get('entry_city');
		$data['entry_country'] = $this->language->get('entry_country');
		$data['entry_zone'] = $this->language->get('entry_zone');
		$data['entry_comment'] = $this->language->get('entry_comment');
		$data['entry_voucher'] = $this->language->get('entry_voucher');
		$data['entry_coupon'] = $this->language->get('entry_coupon');
		$data['entry_reward'] = $this->language->get('entry_reward');
		



		$data['button_continue'] = $this->language->get('button_continue');
		$data['button_login'] = $this->language->get('button_login');
		$data['button_checkout'] = $this->language->get('button_checkout');
		$data['button_remove'] = $this->language->get('button_remove');
		$data['button_confirm_order'] = $this->language->get('button_confirm_order');

		$data['column_image'] = $this->language->get('column_image');
		$data['column_name'] = $this->language->get('column_name');
		$data['column_model'] = $this->language->get('column_model');
		$data['column_quantity'] = $this->language->get('column_quantity');
		$data['column_price'] = $this->language->get('column_price');
		$data['column_total'] = $this->language->get('column_total');
		$data['column_remove'] = $this->language->get('column_remove');

		if (isset($this->session->data['error'])) {
			$data['error_warning'] = $this->session->data['error'];
			unset($this->session->data['error']);
		} else {
			$data['error_warning'] = '';
		}

		$data['logged'] = $this->customer->isLogged();

		if (isset($this->session->data['account'])) {
			$data['account'] = $this->session->data['account'];
		} else {
			$data['account'] = 'guest';
		}

		$data['forgotten'] = $this->url->link('account/forgotten', '', 'SSL');
		$data['success_page'] = $this->url->link('checkout/success', '', 'SSL');

		// Shopping Cart
		if (isset($this->request->request['remove'])) {
			$this->cart->remove($this->request->request['remove']);
			unset($this->session->data['vouchers'][$this->request->request['remove']]);
		}

		if (isset($this->request->request['update'])) {
			$this->cart->update($this->request->request['update'], $this->request->request['quantity']);
		}

		if (isset($this->request->request['add'])) {
			$this->cart->add($this->request->request['add'], $this->request->request['quantity']);
		}

		if (!$this->cart->hasStock() && (!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning'))) {
			$data['error_warning_cart'] = $this->language->get('error_stock');
		} elseif (isset($this->session->data['error'])) {
			$data['error_warning_cart'] = $this->session->data['error'];

			unset($this->session->data['error']);
		} else {
			$data['error_warning_cart'] = '';
		}

		if ($this->config->get('config_customer_price') && !$this->customer->isLogged()) {
			$data['attention_cart'] = sprintf($this->language->get('text_login'), $this->url->link('account/login'), $this->url->link('account/register'));
		} else {
			$data['attention_cart'] = '';
		}

		if ($this->config->get('config_cart_weight')) {
			$data['weight'] = $this->weight->format($this->cart->getWeight(), $this->config->get('config_weight_class_id'), $this->language->get('decimal_point'), $this->language->get('thousand_point'));
		} else {
			$data['weight'] = '';
		}

		$data['products'] = array();

		$products = $this->cart->getProducts();

		foreach ($products as $product) {
			$product_total = 0;

			foreach ($products as $product_2) {
				if ($product_2['product_id'] == $product['product_id']) {
					$product_total += $product_2['quantity'];
				}
			}

			if ($product['minimum'] > $product_total) {
				$data['error_warning_cart'] = sprintf($this->language->get('error_minimum'), $product['name'], $product['minimum']);
			}

			if ($product['image']) {
				$image = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_cart_width'), $this->config->get('config_image_cart_height'));
			} else {
				$image = '';
			}

			$option_data = array();

			foreach ($product['option'] as $option) {
				if ($option['type'] != 'file') {
					$value = $option['value'];
				} else {
					$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

					if ($upload_info) {
						$value = $upload_info['name'];
					} else {
						$value = '';
					}
				}

				$option_data[] = array(
					'name'  => $option['name'],
					'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
					);
			}

			// Display prices
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}

			// Display prices
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$total = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']);
			} else {
				$total = false;
			}

			$recurring = '';

			if ($product['recurring']) {
				$frequencies = array(
					'day'        => $this->language->get('text_day'),
					'week'       => $this->language->get('text_week'),
					'semi_month' => $this->language->get('text_semi_month'),
					'month'      => $this->language->get('text_month'),
					'year'       => $this->language->get('text_year'),
					);

				if ($product['recurring']['trial']) {
					$recurring = sprintf($this->language->get('text_trial_description'), $this->currency->format($this->tax->calculate($product['recurring']['trial_price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax'))), $product['recurring']['trial_cycle'], $frequencies[$product['recurring']['trial_frequency']], $product['recurring']['trial_duration']) . ' ';
				}

				if ($product['recurring']['duration']) {
					$recurring .= sprintf($this->language->get('text_payment_description'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax'))), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
				} else {
					$recurring .= sprintf($this->language->get('text_payment_cancel'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax'))), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
				}
			}

			$data['products'][] = array(
				'key'       => (version_compare(VERSION, '2.1.0.1') < 0) ? $product['key'] : $product['cart_id'],
				'product_id'=> $product['product_id'],
				'thumb'     => $image,
				'name'      => $product['name'],
				'model'     => $product['model'],
				'option'    => $option_data,
				'recurring' => $recurring,
				'quantity'  => $product['quantity'],
				'stock'     => $product['stock'] ? true : !(!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning')),
				'reward'    => ($product['reward'] ? sprintf($this->language->get('text_points'), $product['reward']) : ''),
				'price'     => $price,
				'total'     => $total,
				'href'      => $this->url->link('product/product', 'product_id=' . $product['product_id'])
				);
		}

		// Gift Voucher
		$data['vouchers'] = array();

		if (!empty($this->session->data['vouchers'])) {
			foreach ($this->session->data['vouchers'] as $key => $voucher) {
				$data['vouchers'][] = array(
					'key'         => $key,
					'description' => $voucher['description'],
					'amount'      => $this->currency->format($voucher['amount']),
					'remove'      => $this->url->link('checkout/cart', 'remove=' . $key)
					);
			}
		}

		$dafault_country_id = (isset($fastorder_data['default_country']) && $fastorder_data['default_country']) ? $fastorder_data['default_country'] : $this->config->get('config_country_id');

		// Geuest Info
		if (!isset($this->session->data['shipping_address'])) {
			$this->session->data['shipping_address'] = array('country_id' => $dafault_country_id, 'zone_id' => $this->config->get('config_zone_id'));
		}
		if (!isset($this->session->data['payment_address'])) {
			$this->session->data['payment_address']  = array('country_id' => $dafault_country_id, 'zone_id' => $this->config->get('config_zone_id'));
		}

		$data['customer_groups'] = array();

		if (is_array($this->config->get('config_customer_group_display'))) {
			$this->load->model('account/customer_group');

			$customer_groups = $this->model_account_customer_group->getCustomerGroups();

			foreach ($customer_groups as $customer_group) {
				if (in_array($customer_group['customer_group_id'], $this->config->get('config_customer_group_display'))) {
					$data['customer_groups'][] = $customer_group;
				}
			}
		}

		if (isset($this->session->data['guest']['customer_group_id'])) {
			$data['customer_group_id'] = $this->session->data['guest']['customer_group_id'];
		} else {
			$data['customer_group_id'] = $this->config->get('config_customer_group_id');
		}

		if (isset($this->session->data['guest']['firstname'])) {
			$data['firstname'] = $this->session->data['guest']['firstname'];
		} else {
			$data['firstname'] = '';
		}

		if (isset($this->session->data['guest']['lastname'])) {
			$data['lastname'] = $this->session->data['guest']['lastname'];
		} else {
			$data['lastname'] = '';
		}

		if (isset($this->session->data['guest']['email'])) {
			$data['email'] = $this->session->data['guest']['email'];
		} else {
			$data['email'] = '';
		}

		if (isset($this->session->data['guest']['telephone'])) {
			$data['telephone'] = $this->session->data['guest']['telephone'];
		} else {
			$data['telephone'] = '';
		}

		if (isset($this->session->data['guest']['fax'])) {
			$data['fax'] = $this->session->data['guest']['fax'];
		} else {
			$data['fax'] = '';
		}

		// Custom Fields
		$this->load->model('account/custom_field');

		$data['custom_fields'] = $this->model_account_custom_field->getCustomFields();

		if (isset($this->session->data['guest']['custom_field'])) {
			if (isset($this->session->data['guest']['custom_field'])) {
				$guest_custom_field = $this->session->data['guest']['custom_field'];
			} else {
				$guest_custom_field = array();
			}

			if (isset($this->session->data['payment_address']['custom_field'])) {
				$address_custom_field = $this->session->data['payment_address']['custom_field'];
			} else {
				$address_custom_field = array();
			}

			$data['guest_custom_field'] = $guest_custom_field + $address_custom_field;
		} else {
			$data['guest_custom_field'] = array();
		}

		if (isset($this->session->data['payment_address']['company'])) {
			$data['company'] = $this->session->data['payment_address']['company'];
		} else {
			$data['company'] = '';
		}

		if (isset($this->session->data['payment_address']['address_1'])) {
			$data['address_1'] = $this->session->data['payment_address']['address_1'];
		} else {
			$data['address_1'] = '';
		}

		if (isset($this->session->data['payment_address']['address_2'])) {
			$data['address_2'] = $this->session->data['payment_address']['address_2'];
		} else {
			$data['address_2'] = '';
		}

		if (isset($this->session->data['payment_address']['postcode'])) {
			$data['postcode'] = $this->session->data['payment_address']['postcode'];
		} elseif (isset($this->session->data['shipping_address']['postcode'])) {
			$data['postcode'] = $this->session->data['shipping_address']['postcode'];
		} else {
			$data['postcode'] = '';
		}

		if (isset($this->session->data['payment_address']['city'])) {
			$data['city'] = $this->session->data['payment_address']['city'];
		} else {
			$data['city'] = '';
		}

		if (isset($fastorder_data['default_country']) && $fastorder_data['default_country']) {
			$data['country_id'] = $fastorder_data['default_country'];
		} elseif (isset($this->session->data['payment_address']['country_id'])) {
			$data['country_id'] = $this->session->data['payment_address']['country_id'];
		} elseif (isset($this->session->data['shipping_address']['country_id'])) {
			$data['country_id'] = $this->session->data['shipping_address']['country_id'];
		} else {
			$data['country_id'] = $this->config->get('config_country_id');
		}

		// if (isset($this->session->data['payment_address']['zone_id'])) {
		// 	$data['zone_id'] = $this->session->data['payment_address']['zone_id'];
		// } elseif (isset($this->session->data['shipping_address']['zone_id'])) {
		// 	$data['zone_id'] = $this->session->data['shipping_address']['zone_id'];
		// } else {
			$data['zone_id'] = '';
		// }

		if (isset($this->session->data['payment_address']['address_id'])) {
			$data['address_id'] = $this->session->data['payment_address']['address_id'];
		} else {
			$data['address_id'] = $this->customer->getAddressId();
		}

		if (isset($this->session->data['comment'])) {
			$data['comment'] = $this->session->data['comment'];
		} else {
			$data['comment'] = '';
		}

		$data['addresses'] = $this->model_account_address->getAddresses();

		$data['countries'] = $this->model_localisation_country->getCountries();

		$data['shipping_required'] = $this->cart->hasShipping();

		$total_data = array();
		$total = 0;
		$taxes = $this->cart->getTaxes();

		$sort_order = array();

		$results = $this->model_extension_extension->getExtensions('total');

		foreach ($results as $key => $value) {
			$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
		}

		array_multisort($sort_order, SORT_ASC, $results);

		foreach ($results as $result) {
			if ($this->config->get($result['code'] . '_status')) {
				$this->load->model('total/' . $result['code']);

				$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
			}
		}

		// Payment Block
		$payment_method_data = array();

		$payment_results = $this->model_extension_extension->getExtensions('payment');

		$recurring = $this->cart->hasRecurringProducts();

		foreach ($payment_results as $result) {
			if ($this->config->get($result['code'] . '_status')) {
				$this->load->model('payment/' . $result['code']);

				$method = $this->{'model_payment_' . $result['code']}->getMethod($this->session->data['payment_address'], $total);

				if ($method) {
					if ($recurring) {
						if (method_exists($this->{'model_payment_' . $result['code']}, 'recurringPayments') && $this->{'model_payment_' . $result['code']}->recurringPayments()) {
							$payment_method_data[$result['code']] = $method;
						}
					} else {
						$payment_method_data[$result['code']] = $method;
					}
				}
			}
		}

		$sort_order = array();

		foreach ($payment_method_data as $key => $value) {
			$sort_order[$key] = $value['sort_order'];
		}

		array_multisort($sort_order, SORT_ASC, $payment_method_data);

		$this->session->data['payment_methods'] = $payment_method_data;

		if (empty($this->session->data['payment_methods'])) {
			$data['error_warning_payment'] = sprintf($this->language->get('error_no_payment'), $this->url->link('information/contact'));
		} else {
			$data['error_warning_payment'] = '';
		}

		if (isset($this->session->data['payment_methods'])) {
			$data['payment_methods'] = $this->session->data['payment_methods'];
		} else {
			$data['payment_methods'] = array();
		}

		if (isset($this->session->data['payment_method']['code'])) {
			$data['code_p'] = $this->session->data['payment_method']['code'];
			// $data['payment'] = $this->load->controller('payment/' . $this->session->data['payment_method']['code']);
			$data['payment'] = '';
		} else {
			$data['code_p'] = '';
			$data['payment'] = '';
		}

		if ($this->config->get('config_checkout_id')) {
			$this->load->model('catalog/information');

			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_checkout_id'));

			if ($information_info) {
				$data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/agree', 'information_id=' . $this->config->get('config_checkout_id'), 'SSL'), $information_info['title'], $information_info['title']);
			} else {
				$data['text_agree'] = '';
			}
		} else {
			$data['text_agree'] = '';
		}

		if (isset($this->session->data['agree'])) {
			$data['agree'] = $this->session->data['agree'];
		} else {
			$data['agree'] = '';
		}

		// Shipping Block
		$shipping_method_data = array();

		$shipping_results = $this->model_extension_extension->getExtensions('shipping');

		foreach ($shipping_results as $result) {
			if ($this->config->get($result['code'] . '_status')) {
				$this->load->model('shipping/' . $result['code']);

				$quote = $this->{'model_shipping_' . $result['code']}->getQuote($this->session->data['shipping_address']);

				if ($quote) {
					$shipping_method_data[$result['code']] = array(
						'title'      => $quote['title'],
						'quote'      => $quote['quote'],
						'sort_order' => $quote['sort_order'],
						'error'      => $quote['error']
						);
				}
			}
		}

		$sort_order = array();

		foreach ($shipping_method_data as $key => $value) {
			$sort_order[$key] = $value['sort_order'];
		}

		array_multisort($sort_order, SORT_ASC, $shipping_method_data);

		$this->session->data['shipping_methods'] = $shipping_method_data;

		if (empty($this->session->data['shipping_methods'])) {
			$data['error_warning_shipping'] = sprintf($this->language->get('error_no_shipping'), $this->url->link('information/contact'));
		} else {
			$data['error_warning_shipping'] = '';
		}

		if (isset($this->session->data['shipping_methods'])) {
			$data['shipping_methods'] = $this->session->data['shipping_methods'];
		} else {
			$data['shipping_methods'] = array();
		}

		if (isset($this->session->data['shipping_method']['code'])) {
			$data['code_s'] = $this->session->data['shipping_method']['code'];
		} else {
			$data['code_s'] = '';
		}

		// Totals Data
		$total_data = array();
		$total = 0;
		$taxes = $this->cart->getTaxes();

		$sort_order = array();

		$total_results = $this->model_extension_extension->getExtensions('total');

		foreach ($total_results as $key => $value) {
			$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
		}

		array_multisort($sort_order, SORT_ASC, $total_results);

		foreach ($total_results as $result) {
			if ($this->config->get($result['code'] . '_status')) {
				$this->load->model('total/' . $result['code']);

				$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
			}
		}

		$data['totals'] = array();

		foreach ($total_data as $total) {
			$data['totals'][] = array(
				'title' => $total['title'],
				'text'  => $this->currency->format($total['value'])
				);
		}

		// Add blocks
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		if ((version_compare(VERSION, '2.1.0.1') < 0)) {
			$data['coupon'] = $this->load->controller('checkout/coupon');
			$data['voucher'] = $this->load->controller('checkout/voucher');
			$data['reward'] = $this->load->controller('checkout/reward');
		} else {
			$data['coupon'] = $this->load->controller('total/coupon');
			$data['voucher'] = $this->load->controller('total/voucher');
			$data['reward'] = $this->load->controller('total/reward');
		}
		
		if (!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) {

			$data['heading_title'] = $this->language->get('heading_cart_block');

			$data['text_empty'] = $this->language->get('text_empty');

			$data['continue'] = $this->url->link('common/home');

			unset($this->session->data['success']);

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/fastorder/empty.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/checkout/fastorder/empty.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/checkout/fastorder/empty.tpl', $data));
			}
		} else {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/fastorder/fastorder.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/checkout/fastorder/fastorder.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/checkout/fastorder/fastorder.tpl', $data));
			}
		}

	}

	public function update_pay_and_ship() {
		$json = array();

		if (!isset($this->session->data['shipping_address'])) {
			$this->session->data['shipping_address'] = array();
		}

		if (!isset($this->session->data['payment_address'])) {
			$this->session->data['payment_address'] = array();
		}

		if (isset($this->request->request['country_id'])) {
			$this->session->data['shipping_address']['country_id'] = $this->request->request['country_id'];
			$this->session->data['payment_address']['country_id'] = $this->request->request['country_id'];
		}

		if (isset($this->request->request['zone_id'])) {
			$this->session->data['shipping_address']['zone_id'] = $this->request->request['zone_id'];
			$this->session->data['payment_address']['zone_id']  = $this->request->request['zone_id'];
		}

		if (isset($this->request->request['address_1'])) {
			$this->session->data['payment_address']['address_1'] = $this->request->request['address_1'];
			$this->session->data['shipping_address']['address_1'] = $this->request->request['address_1'];
		}

		if (isset($this->request->request['address_2'])) {
			$this->session->data['payment_address']['address_2'] = $this->request->request['address_2'];
			$this->session->data['shipping_address']['address_2'] = $this->request->request['address_2'];
		}

		if (isset($this->request->request['postcode'])) {
			$this->session->data['payment_address']['postcode'] = $this->request->request['postcode'];
			$this->session->data['shipping_address']['postcode'] = $this->request->request['postcode'];
		}

		if (isset($this->request->request['city'])) {
			$this->session->data['payment_address']['city'] = $this->request->request['city'];
			$this->session->data['shipping_address']['city'] = $this->request->request['city'];
		}
		
		unset($this->session->data['shipping_method']);
		unset($this->session->data['shipping_methods']);
		unset($this->session->data['payment_method']);
		unset($this->session->data['payment_methods']);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function status_cart() {

		$json = array();

		$this->load->language('checkout/fastorder');

		if (!$this->cart->hasProducts()) {
			$json['redirect'] = $this->url->link('checkout/fastorder/fastorder');
		}

		// Totals
		$this->load->model('extension/extension');

		$total_data = array();
		$total = 0;
		$taxes = $this->cart->getTaxes();

		// Display prices
		if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
			$sort_order = array();

			$results = $this->model_extension_extension->getExtensions('total');

			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}

			array_multisort($sort_order, SORT_ASC, $results);

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('total/' . $result['code']);

					$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
				}
			}

			$sort_order = array();

			foreach ($total_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $total_data);
		}

		$json['total'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total));

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function country() {
		$json = array();

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']
				);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function shipping_save() {

		$json = array();

		$this->load->language('checkout/fastorder');

		if (!isset($this->request->post['shipping_method'])) {
			$json['error']['warning'] = $this->language->get('error_shipping');
		} else {
			$shipping = explode('.', $this->request->post['shipping_method']);

			if (!isset($shipping[0]) || !isset($shipping[1]) || !isset($this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]])) {
				$json['error']['warning'] = $this->language->get('error_shipping');
			}
		}

		if (!$json) {
			$this->session->data['shipping_method'] = $this->session->data['shipping_methods'][$shipping[0]]['quote'][$shipping[1]];
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function payment_save() {

		$json = array();

		$this->load->language('checkout/fastorder');

		if (!isset($this->request->post['payment_method'])) {
			$json['error']['warning'] = $this->language->get('error_payment');
		} elseif (!isset($this->session->data['payment_methods'][$this->request->post['payment_method']])) {
			$json['error']['warning'] = $this->language->get('error_payment');
		}

		if(!isset($this->request->post['skip_agree'])){
			if ($this->config->get('config_checkout_id')) {
				$this->load->model('catalog/information');

				$information_info = $this->model_catalog_information->getInformation($this->config->get('config_checkout_id'));

				if ($information_info && !isset($this->request->post['agree'])) {
					$json['error']['warning'] = sprintf($this->language->get('error_agree'), $information_info['title']);
				}
			}
		}

		if (!$json) {
			$this->session->data['payment_method'] = $this->session->data['payment_methods'][$this->request->post['payment_method']];

			$this->session->data['agree'] = isset($this->request->post['agree']) ? $this->request->post['agree'] : "";
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function guest_save() {

		$json = array();

		$fastorder_data = $this->config->get('fastorder_data');

		$this->load->language('checkout/fastorder');

		if (isset($this->request->post['comment'])) {
			$this->session->data['comment'] = $this->request->post['comment'];
		} else {
			$this->session->data['comment'] = "";
		}

		if ( !isset($this->request->post['payment_address']) || $this->request->post['payment_address'] != "existing") {

			if (!$json) {

				if (isset($this->request->post['firstname'])) {
					if ((isset($fastorder_data['firstname']) && $fastorder_data['firstname'] == 2) && (utf8_strlen(trim($this->request->post['firstname'])) < 1) || (utf8_strlen(trim($this->request->post['firstname'])) > 32)) {
						$json['error']['firstname'] = $this->language->get('error_firstname');
					}
				}

				if (isset($this->request->post['lastname'])) {
					if ((isset($fastorder_data['lastname']) && $fastorder_data['lastname'] == 2) && (utf8_strlen(trim($this->request->post['lastname'])) < 1) || (utf8_strlen(trim($this->request->post['lastname'])) > 32)) {
						$json['error']['lastname'] = $this->language->get('error_lastname');
					}
				}

				if (isset($this->request->post['email'])) {
					if (isset($fastorder_data['email']) && $fastorder_data['email'] == 2) {
						if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $this->request->post['email'])) {
							$json['error']['email'] = $this->language->get('error_email');
						}
					}
				}

				if (isset($this->request->post['telephone'])) {
					if ((isset($fastorder_data['telephone']) && $fastorder_data['telephone'] == 2) && (utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
						$json['error']['telephone'] = $this->language->get('error_telephone');
					}
				}

				if (isset($this->request->post['fax'])) {
					if ((isset($fastorder_data['fax']) && $fastorder_data['fax'] == 2) && (utf8_strlen($this->request->post['fax']) < 3) || (utf8_strlen($this->request->post['fax']) > 32)) {
						$json['error']['fax'] = $this->language->get('error_fax');
					}
				}

				if (isset($this->request->post['comment'])) {
					if ((isset($fastorder_data['comment']) && $fastorder_data['comment'] == 2) && (utf8_strlen($this->request->post['comment']) < 3) || (utf8_strlen($this->request->post['comment']) > 500)) {
						$json['error']['comment'] = $this->language->get('error_comment');
					}
				}

				if (isset($this->request->post['address_1'])) {
					if ((isset($fastorder_data['address_1']) && $fastorder_data['address_1'] == 2) && (utf8_strlen(trim($this->request->post['address_1'])) < 3) || (utf8_strlen(trim($this->request->post['address_1'])) > 128)) {
						$json['error']['address_1'] = $this->language->get('error_address_1');
					}
				}

				if (isset($this->request->post['address_2'])) {
					if ((isset($fastorder_data['address_2']) && $fastorder_data['address_2'] == 2) && (utf8_strlen(trim($this->request->post['address_2'])) < 3) || (utf8_strlen(trim($this->request->post['address_2'])) > 128)) {
						$json['error']['address_2'] = $this->language->get('error_address_2');
					}
				}

				if (isset($this->request->post['city'])) {
					if ((isset($fastorder_data['city']) && $fastorder_data['city'] == 2) && (utf8_strlen(trim($this->request->post['city'])) < 2) || (utf8_strlen(trim($this->request->post['city'])) > 128)) {
						$json['error']['city'] = $this->language->get('error_city');
					}
				}

				if (isset($this->request->post['company'])) {
					if ((isset($fastorder_data['company']) && $fastorder_data['company'] == 2) && (utf8_strlen(trim($this->request->post['company'])) < 2) || (utf8_strlen(trim($this->request->post['company'])) > 128)) {
						$json['error']['company'] = $this->language->get('error_company');
					}
				}

				if (isset($this->request->post['postcode']) && isset($this->request->post['country_id'])) {
					$this->load->model('localisation/country');

					$country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);

					if ((isset($fastorder_data['postcode']) && $fastorder_data['postcode'] == 2) && $country_info && $country_info['postcode_required'] && (utf8_strlen(trim($this->request->post['postcode'])) < 2 || utf8_strlen(trim($this->request->post['postcode'])) > 10)) {
						$json['error']['postcode'] = $this->language->get('error_postcode');
					}
				}

				if (isset($this->request->post['country_id'])) {
					if ((isset($fastorder_data['country_and_region']) && $fastorder_data['country_and_region'] == 2) && $this->request->post['country_id'] == '') {
						$json['error']['country'] = $this->language->get('error_country');
					}
				}

				if (isset($this->request->post['zone_id'])) {
					if ((isset($fastorder_data['country_and_region']) && $fastorder_data['country_and_region'] == 2) && !isset($this->request->post['zone_id']) || $this->request->post['zone_id'] == '') {
						$json['error']['zone'] = $this->language->get('error_zone');
					}
				}

				// Customer Group
				if (isset($this->request->post['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->post['customer_group_id'], $this->config->get('config_customer_group_display'))) {
					$customer_group_id = $this->request->post['customer_group_id'];
				} else {
					$customer_group_id = $this->config->get('config_customer_group_id');
				}

				// Custom field validation
				$this->load->model('account/custom_field');

				$custom_fields = $this->model_account_custom_field->getCustomFields($customer_group_id);

				foreach ($custom_fields as $custom_field) {
					if ($custom_field['required'] && empty($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']])) {
						$json['error']['custom_field' . $custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
					}
				}
			}

			if (!$json) {

				if ($this->customer->isLogged()) {
					$this->session->data['account'] = 'register';
				} else {
					$this->session->data['account'] = 'guest';

					$this->session->data['guest']['customer_group_id'] = $customer_group_id;
					$this->session->data['guest']['firstname'] = (isset($this->request->post['firstname'])) ? $this->request->post['firstname'] : "";
					$this->session->data['guest']['lastname'] = (isset($this->request->post['lastname'])) ? $this->request->post['lastname'] : "";
					$this->session->data['guest']['email'] = (isset($this->request->post['email'])) ? (!empty($this->request->post['email']) ? $this->request->post['email'] : 'test@test.com') : 'test@test.com';
					$this->session->data['guest']['telephone'] = (isset($this->request->post['telephone'])) ? $this->request->post['telephone'] : "";
					$this->session->data['guest']['fax'] = (isset($this->request->post['fax'])) ? $this->request->post['fax'] : "";
					if (isset($this->request->post['custom_field']['account'])) {
						$this->session->data['guest']['custom_field'] = $this->request->post['custom_field']['account'];
					} else {
						$this->session->data['guest']['custom_field'] = array();
					}
				}

				if (isset($this->request->post['address_id'])) {
					// Default Payment Address
					$this->load->model('account/address');

					$this->session->data['payment_address'] = $this->model_account_address->getAddress($this->request->post['address_id']);

					if (isset($this->request->post['shipping_address']) && !empty($this->request->post['shipping_address'])) {
						$this->session->data['shipping_address'] = $this->model_account_address->getAddress($this->request->post['address_id']);
					}
				} else {
					$this->session->data['payment_address']['firstname'] = (isset($this->request->post['firstname'])) ? $this->request->post['firstname'] : "";
					$this->session->data['payment_address']['lastname'] = (isset($this->request->post['lastname'])) ? $this->request->post['lastname'] : "";
					$this->session->data['payment_address']['company'] = (isset($this->request->post['company'])) ? $this->request->post['company'] : "";
					$this->session->data['payment_address']['address_1'] = (isset($this->request->post['address_1'])) ? $this->request->post['address_1'] : "";
					$this->session->data['payment_address']['address_2'] = (isset($this->request->post['address_2'])) ? $this->request->post['address_2'] : "";
					$this->session->data['payment_address']['postcode'] = (isset($this->request->post['postcode'])) ? $this->request->post['postcode'] : "";
					$this->session->data['payment_address']['city'] = (isset($this->request->post['city'])) ? $this->request->post['city'] : "";
					$this->session->data['payment_address']['country_id'] = (isset($this->request->post['country_id'])) ? $this->request->post['country_id'] : "";
					$this->session->data['payment_address']['zone_id'] = (isset($this->request->post['zone_id'])) ? $this->request->post['zone_id'] : "";

					if (isset($this->request->post['custom_field']['address'])) {
						$this->session->data['payment_address']['custom_field'] = $this->request->post['custom_field']['address'];
					} else {
						$this->session->data['payment_address']['custom_field'] = array();
					}

					$this->load->model('localisation/country');

					$country_info = $this->model_localisation_country->getCountry((isset($this->request->post['country_id'])) ? $this->request->post['country_id'] : "");

					if ($country_info) {
						$this->session->data['payment_address']['country'] = $country_info['name'];
						$this->session->data['payment_address']['iso_code_2'] = $country_info['iso_code_2'];
						$this->session->data['payment_address']['iso_code_3'] = $country_info['iso_code_3'];
						$this->session->data['payment_address']['address_format'] = $country_info['address_format'];
					} else {
						$this->session->data['payment_address']['country'] = '';
						$this->session->data['payment_address']['iso_code_2'] = '';
						$this->session->data['payment_address']['iso_code_3'] = '';
						$this->session->data['payment_address']['address_format'] = '';
					}

					$this->load->model('localisation/zone');

					$zone_info = $this->model_localisation_zone->getZone((isset($this->request->post['zone_id'])) ? $this->request->post['zone_id'] : "");

					if ($zone_info) {
						$this->session->data['payment_address']['zone'] = $zone_info['name'];
						$this->session->data['payment_address']['zone_code'] = $zone_info['code'];
					} else {
						$this->session->data['payment_address']['zone'] = '';
						$this->session->data['payment_address']['zone_code'] = '';
					}

					if (!empty($this->request->post['shipping_address'])) {
						$this->session->data['guest']['shipping_address'] = $this->request->post['shipping_address'];
					} else {
						$this->session->data['guest']['shipping_address'] = false;
					}

					// Default Payment Address
					if ($this->session->data['guest']['shipping_address']) {
						$this->session->data['shipping_address']['firstname'] = (isset($this->request->post['firstname'])) ? $this->request->post['firstname'] : "";
						$this->session->data['shipping_address']['lastname'] = (isset($this->request->post['lastname'])) ? $this->request->post['lastname'] : "";
						$this->session->data['shipping_address']['company'] = (isset($this->request->post['company'])) ? $this->request->post['company'] : "";
						$this->session->data['shipping_address']['address_1'] = (isset($this->request->post['address_1'])) ? $this->request->post['address_1'] : "";
						$this->session->data['shipping_address']['address_2'] = (isset($this->request->post['address_2'])) ? $this->request->post['address_2'] : "";
						$this->session->data['shipping_address']['postcode'] = (isset($this->request->post['postcode'])) ? $this->request->post['postcode'] : "";
						$this->session->data['shipping_address']['city'] = (isset($this->request->post['city'])) ? $this->request->post['city'] : "";
						$this->session->data['shipping_address']['country_id'] = (isset($this->request->post['country_id'])) ? $this->request->post['country_id'] : "";
						$this->session->data['shipping_address']['zone_id'] = (isset($this->request->post['zone_id'])) ? $this->request->post['zone_id'] : "";

						if ($country_info) {
							$this->session->data['shipping_address']['country'] = $country_info['name'];
							$this->session->data['shipping_address']['iso_code_2'] = $country_info['iso_code_2'];
							$this->session->data['shipping_address']['iso_code_3'] = $country_info['iso_code_3'];
							$this->session->data['shipping_address']['address_format'] = $country_info['address_format'];
						} else {
							$this->session->data['shipping_address']['country'] = '';
							$this->session->data['shipping_address']['iso_code_2'] = '';
							$this->session->data['shipping_address']['iso_code_3'] = '';
							$this->session->data['shipping_address']['address_format'] = '';
						}

						if ($zone_info) {
							$this->session->data['shipping_address']['zone'] = $zone_info['name'];
							$this->session->data['shipping_address']['zone_code'] = $zone_info['code'];
						} else {
							$this->session->data['shipping_address']['zone'] = '';
							$this->session->data['shipping_address']['zone_code'] = '';
						}

						if (isset($this->request->post['custom_field']['address'])) {
							$this->session->data['shipping_address']['custom_field'] = $this->request->post['custom_field']['address'];
						} else {
							$this->session->data['shipping_address']['custom_field'] = array();
						}
					}
				}


			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function login_save() {

		$json = array();

		$this->load->model('account/customer');
		$this->load->language('checkout/fastorder');

		// Check how many login attempts have been made.
		$login_info = $this->model_account_customer->getLoginAttempts($this->request->post['email']);

		if ($login_info && ($login_info['total'] >= $this->config->get('config_login_attempts')) && strtotime('-1 hour') < strtotime($login_info['date_modified'])) {
			$json['error']['warning'] = $this->language->get('error_attempts');
		}

		// Check if customer has been approved.
		$customer_info = $this->model_account_customer->getCustomerByEmail($this->request->post['email']);

		if ($customer_info && !$customer_info['approved']) {
			$json['error']['warning'] = $this->language->get('error_approved');
		}

		if (!isset($json['error'])) {
			if (!$this->customer->login($this->request->post['email'], $this->request->post['password'])) {
				$json['error']['warning'] = $this->language->get('error_login');

				$this->model_account_customer->addLoginAttempt($this->request->post['email']);
			} else {
				$this->model_account_customer->deleteLoginAttempts($this->request->post['email']);
			}
		}

		if (!$json) {
			unset($this->session->data['guest']);

			$this->load->model('account/address');

			if ($this->config->get('config_tax_customer') == 'payment') {
				$this->session->data['payment_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
			}

			if ($this->config->get('config_tax_customer') == 'shipping') {
				$this->session->data['shipping_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
			}

			$json['redirect'] = $this->url->link('checkout/checkout', '', 'SSL');

			// Add to activity log
			$this->load->model('account/activity');

			$activity_data = array(
				'customer_id' => $this->customer->getId(),
				'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
				);

			$this->model_account_activity->addActivity('login', $activity_data);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
