<?php
class ControllerModuleProductTabs extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/product_tabs');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		
		$data['token'] = $this->session->data['token'];

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('product_tabs', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');

		$data['tab_setting'] = $this->language->get('tab_setting');

		$data['entry_status'] = $this->language->get('entry_status');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
	
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/product_tabs', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('module/product_tabs', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['product_tabs_data'])) {
			$data['product_tabs_data'] = $this->request->post['product_tabs_data'];
		} else {
			$data['product_tabs_data'] = $this->config->get('product_tabs_data');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/product_tabs.tpl', $data));
	}

	public function install() {
		$this->load->language('module/product_tabs');

		$this->load->model('module/product_tabs');
    $this->load->model('extension/extension');
    $this->load->model('setting/setting');

    $this->model_user_user_group->addPermission($this->user->getId(), 'access', 'module/product_tabs');
    $this->model_user_user_group->addPermission($this->user->getId(), 'modify', 'module/product_tabs');
    $this->model_user_user_group->addPermission($this->user->getId(), 'access', 'catalog/product_tabs');
    $this->model_user_user_group->addPermission($this->user->getId(), 'modify', 'catalog/product_tabs');

    $this->model_setting_setting->editSetting('product_tabs', array(
        'product_tabs_data' => array(
          'status'   => '1'
        )
      )
		);

    if (!in_array('product_tabs', $this->model_extension_extension->getInstalled('module'))) {
      $this->model_extension_extension->install('module', 'product_tabs');
    }

    $this->model_module_product_tabs->makeDB();

    $this->session->data['success'] = $this->language->get('text_success_install');

    $this->response->redirect($this->url->link('module/product_tabs', 'token=' . $this->session->data['token'], 'SSL'));
  }

  public function uninstall() {
    $this->load->model('extension/extension');
    $this->load->model('setting/setting');
		$this->load->model('module/product_tabs');

		$this->model_module_product_tabs->removeDB();
    $this->model_extension_extension->uninstall('module', 'product_tabs');
    $this->model_setting_setting->deleteSetting('product_tabs_data');
  }

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/product_tabs')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}
