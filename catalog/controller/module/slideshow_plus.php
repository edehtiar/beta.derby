<?php
class ControllerModuleSlideshowPlus extends Controller {
	public function index($setting) {
		static $module = 0;

		$this->load->model('design/banner_plus');
		$this->load->model('tool/image');
        
        
		$this->document->addStyle('catalog/view/javascript/jquery/sstore-slider.css');
		$this->document->addScript('catalog/view/javascript/jquery/jquery.cslider.js');
		$this->document->addScript('catalog/view/javascript/jquery/modernizr.custom.28468.js');
        
        
		$data['banners_plus'] = array();

		$results = $this->model_design_banner_plus->getBanner($setting['banner_id']);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['banners_plus'][] = array(
					'title' 	  => $result['title'],
					'button' 	  => $result['button'],
					'link'  	  => $result['link'],
					'description' => html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'),
					'image' 	  => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
				);
			}
		}

		$data['module'] = $module++;

		$data['banner_id'] 						   = $setting['banner_id'];
		$data['arrows'][$setting['banner_id']]     = $setting['arrows_status'];
		$data['pagination'][$setting['banner_id']] = $setting['paginations_status'];

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/slideshow_plus.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/slideshow_plus.tpl', $data);
		} else {
			return $this->load->view('default/template/module/slideshow_plus.tpl', $data);
		}
	}
}