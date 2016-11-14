<?php
class ControllerModuleFastorder extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/fastorder');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->document->addScript('view/javascript/fastorder/jquery.minicolors.min.js');
		$this->document->addStyle('view/javascript/fastorder/jquery.minicolors.css');

		$this->load->model('setting/setting');
		$this->load->model('localisation/country');


		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('fastorder_data', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_enabled_required'] = $this->language->get('text_enabled_required');

		$data['tab_setting'] = $this->language->get('tab_setting');
		$data['tab_display'] = $this->language->get('tab_display');

		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_login'] = $this->language->get('entry_login');
		$data['entry_shipping'] = $this->language->get('entry_shipping');
		$data['entry_payment'] = $this->language->get('entry_payment');
		$data['entry_firstname'] = $this->language->get('entry_firstname');
		$data['entry_lastname'] = $this->language->get('entry_lastname');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_telephone'] = $this->language->get('entry_telephone');
		$data['entry_fax'] = $this->language->get('entry_fax');
		$data['entry_comment'] = $this->language->get('entry_comment');
		$data['entry_company'] = $this->language->get('entry_company');
		$data['entry_address_1'] = $this->language->get('entry_address_1');
		$data['entry_address_2'] = $this->language->get('entry_address_2');
		$data['entry_city'] = $this->language->get('entry_city');
		$data['entry_postcode'] = $this->language->get('entry_postcode');
		$data['entry_country_and_region'] = $this->language->get('entry_country_and_region');
		$data['entry_backgorund_color_block_border'] = $this->language->get('entry_backgorund_color_block_border');
		$data['entry_backgorund_color_block_heading'] = $this->language->get('entry_backgorund_color_block_heading');
		$data['entry_text_color_block_heading'] = $this->language->get('entry_text_color_block_heading');
		$data['entry_backgorund_color_block_body'] = $this->language->get('entry_backgorund_color_block_body');
		$data['entry_text_color_block_body'] = $this->language->get('entry_text_color_block_body');
		$data['entry_display_inline'] = $this->language->get('entry_display_inline');
		$data['entry_backgorund_color_remove_button'] = $this->language->get('entry_backgorund_color_remove_button');
		$data['entry_text_color_remove_button'] = $this->language->get('entry_text_color_remove_button');
		$data['entry_backgorund_color_quantity_button'] = $this->language->get('entry_backgorund_color_quantity_button');
		$data['entry_text_color_quantity_button'] = $this->language->get('entry_text_color_quantity_button');
		$data['entry_backgorund_color_checkout_button'] = $this->language->get('entry_backgorund_color_checkout_button');
		$data['entry_text_color_checkout_button'] = $this->language->get('entry_text_color_checkout_button');
		$data['entry_default_country'] = $this->language->get('entry_default_country');
			
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
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
			'href' => $this->url->link('module/fastorder', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('module/fastorder', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['fastorder_data'])) {
			$data['fastorder_data'] = $this->request->post['fastorder_data'];
		} else {
			$data['fastorder_data'] = $this->config->get('fastorder_data');
		}

		$data['countries'] = array();

		$countries = $this->model_localisation_country->getCountries();

        foreach ($countries as $country) {
            $data['countries'][] = array(
                'country_id' => $country['country_id'],
                'name'       => $country['name'] . (($country['country_id'] == $this->config->get('config_country_id')) ? $this->language->get('text_default') : null)
            );
        }

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/fastorder.tpl', $data));
	}

	public function install() {   

		$this->load->language('module/fastorder');

        $this->load->model('extension/extension');
        $this->load->model('setting/setting');

        $this->model_user_user_group->addPermission( $this->user->getId(), 'access', 'module/fastorder' );
        $this->model_user_user_group->addPermission( $this->user->getId(), 'modify', 'module/fastorder' );

        $this->model_setting_setting->editSetting( 'fastorder_data', array(
            'fastorder_data' => array(
                'status'                      		=> '1',
                'login'                				=> '1',
                'shipping'                			=> '1',
                'payment'             				=> '1',
				'firstname'							=> '2',		
				'lastname'							=> '2',
				'email'								=> '2',
				'telephone'							=> '2',
				'fax'								=> '1',
				'comment'							=> '1',
				'company'							=> '1',
				'address_1'							=> '2',
				'address_2'							=> '1',
				'city'								=> '2',
				'postcode'							=> '2',
				'country_and_region'				=> '2',
				'display_inline'					=> '0',
				'countries'             			=> array(),
				'backgorund_color_block_border'		=> '',
				'backgorund_color_block_heading'	=> '',
				'text_color_block_heading'			=> '',
				'backgorund_color_block_body'		=> '',
				'text_color_block_body'				=> '',
				'backgorund_color_remove_button'	=> '',
				'text_color_remove_button'			=> '',
				'backgorund_color_quantity_button'  => '',
				'text_color_quantity_button'  		=> '',
				'backgorund_color_checkout_button'	=> '',
				'text_color_checkout_button'		=> ''
            )
        ));        

        if ( !in_array( 'fastorder', $this->model_extension_extension->getInstalled( 'module' ) ) ) {
            $this->model_extension_extension->install( 'module', 'fastorder' );
        }
        
        $this->session->data['success'] = $this->language->get('text_success_install');

        $this->response->redirect( $this->url->link( 'module/fastorder', 'token=' . $this->session->data['token'], 'SSL' ) );
    }

    public function uninstall() {

        $this->load->model('extension/extension');
        $this->load->model('setting/setting');

        $this->model_extension_extension->uninstall( 'module', 'fastorder' );
        $this->model_setting_setting->deleteSetting( 'fastorder_data' );
    }

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/fastorder')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}