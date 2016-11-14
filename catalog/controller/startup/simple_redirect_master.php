<?php

/**
 * @property Loader $load
 * @property Log $log
 * @property Request $request
 * @property Response $response
 * @property ModelToolSimpleRedirectMaster model_tool_simple_redirect_master
 */
class ControllerStartupSimpleRedirectMaster extends Controller {

	/**
	 * @return void
	 */
	public function index() {
		try {
			$this->load->model('tool/simple_redirect_master');
		} catch (Exception $e) {
			$this->log->write($e->getMessage());
			return;
		}

		if (!$this->isActive())
			return;
		
		if ($redirect = $this->model_tool_simple_redirect_master->getRedirect($this->request->server['REQUEST_URI'])) {
			$this->response->redirect($redirect['to'], $redirect['code']);
		}
	}

	/**
	 * @return boolean
	 */
	protected function isActive() {
		return $this->model_tool_simple_redirect_master->isModuleEnabled();
	}
} 