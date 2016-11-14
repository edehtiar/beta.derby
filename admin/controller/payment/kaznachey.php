<?php
class ControllerPaymentKaznachey extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('payment/kaznachey');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('kaznachey', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');
		$data['text_pay'] = $this->language->get('text_pay');
		$data['text_card'] = $this->language->get('text_card');

		$data['entry_merchant'] = $this->language->get('entry_merchant');
		$data['entry_merchnatSecretKey'] = $this->language->get('entry_merchnatSecretKey');
		$data['entry_total'] = $this->language->get('entry_total');
		$data['entry_order_status'] = $this->language->get('entry_order_status');
		$data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['help_merchant'] = $this->language->get('help_merchant');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['merchant'])) {
			$data['error_merchant'] = $this->error['merchant'];
		} else {
			$data['error_merchant'] = '';
		}

		if (isset($this->error['kaznachey_merchnatSecretKey'])) {
			$data['error_merchnatSecretKey'] = $this->error['kaznachey_merchnatSecretKey'];
		} else {
			$data['error_merchnatSecretKey'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_payment'),
			'href' => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('payment/kaznachey', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('payment/kaznachey', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['kaznachey_merchant'])) {
			$data['kaznachey_merchant'] = $this->request->post['kaznachey_merchant'];
		} else {
			$data['kaznachey_merchant'] = $this->config->get('kaznachey_merchant');
		}

		if (isset($this->request->post['kaznachey_merchnatSecretKey'])) {
			$data['kaznachey_merchnatSecretKey'] = $this->request->post['kaznachey_merchnatSecretKey'];
		} else {
			$data['kaznachey_merchnatSecretKey'] = $this->config->get('kaznachey_merchnatSecretKey');
		}

		if (isset($this->request->post['kaznachey_order_status_id'])) {
			$data['kaznachey_order_status_id'] = $this->request->post['kaznachey_order_status_id'];
		} else {
			$data['kaznachey_order_status_id'] = $this->config->get('kaznachey_order_status_id');
		}

		$this->load->model('localisation/order_status');

		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		if (isset($this->request->post['kaznachey_geo_zone_id'])) {
			$data['kaznachey_geo_zone_id'] = $this->request->post['kaznachey_geo_zone_id'];
		} else {
			$data['kaznachey_geo_zone_id'] = $this->config->get('kaznachey_geo_zone_id');
		}

		$this->load->model('localisation/geo_zone');

		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		if (isset($this->request->post['kaznachey_status'])) {
			$data['kaznachey_status'] = $this->request->post['kaznachey_status'];
		} else {
			$data['kaznachey_status'] = $this->config->get('kaznachey_status');
		}

		if (isset($this->request->post['kaznachey_sort_order'])) {
			$data['kaznachey_sort_order'] = $this->request->post['kaznachey_sort_order'];
		} else {
			$data['kaznachey_sort_order'] = $this->config->get('kaznachey_sort_order');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('payment/kaznachey.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'payment/kaznachey')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['kaznachey_merchant']) {
			$this->error['merchant'] = $this->language->get('error_merchant');
		}

		if (!$this->request->post['kaznachey_merchnatSecretKey']) {
			$this->error['kaznachey_merchnatSecretKey'] = $this->language->get('error_merchnatSecretKey');
		}

		return !$this->error;
	}
}