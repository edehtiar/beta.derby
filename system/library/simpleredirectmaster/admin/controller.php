<?php

namespace SimpleRedirectMaster\Admin;

use SimpleRedirectMaster\Controller as SRMController;

abstract class Controller extends SRMController {

    const VERSION = '1.1.1s';
    const YEAR_CREATED = 2016;
    const EMAIL = 'vojjov.artem@ya.ru';

    /**
     * @var bool
     */
    protected $ajax;

    /**
     * @var int
     */
    protected $limit;

    /**
     * @var int
     */
    protected $offset;

    /**
     * @var int
     */
    protected $page;

    /**
     * @var string
     */
    protected $search;

    /**
     * @var string
     */
    protected $sort;

    /**
     * @var string
     */
    protected $order;

    /**
     * @var array
     */
    protected $codes = array(301, 302);

    /**
     * @var array
     */
    protected $filterCodes;

    /**
     * @var boolean|null
     */
    protected $filterStatus;

    /**
     * @var array
     */
    protected $availableWarningTypes = array('pre_action');

    /**
     * @var array
     */
    private $error = array();

    /**
     * @var array
     */
    private $data = array();

    /**
     * @var array
     */
    private $warning = array();

    public function install() {
        $columns = array(
            "`redirect_id` int NOT NULL AUTO_INCREMENT PRIMARY KEY",
            "`from` text NOT NULL",
            "`to` text NOT NULL",
            "`code` int NOT NULL DEFAULT '301'",
            "`status` tinyint(1) NOT NULL DEFAULT '0'"
        );

        $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "srm_redirect` (" . implode(", ", $columns) . ")");

        if ($this->isPreActionFileWritable())
            $this->addPreAction();
    }

    public function uninstall() {
        $this->initModels();
        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "srm_redirect`");
        $this->model_setting_setting->deleteSetting('simple_redirect_master');

        if ($this->isPreActionFileWritable())
            $this->removePreAction();
    }

    public function index() {
        $this->initParameters();
        $this->initLanguage();
        $this->initModels();
        $this->initDocument();
        $this->initLimits();

        $this->initCodes();
        $this->initRedirects();

        $this->initBreadcrumbs();

        $this->initSortLinks();
        $this->initCommonData();
        $this->initActions();
        $this->initWarnings();
        $this->initParts();
        $this->initDeveloperInfo();
        $this->response->setOutput($this->load->view($this->getRouteName() . (version_compare(VERSION, '2.2.0', '<') ? '.tpl' : ''), $this->data));
    }

    /**
     * @return void
     */
    public function add() {
        $this->initModels();
        $this->initLanguage(false);

        if ($this->validateAdd()) {
            if ($this->model_tool_simple_redirect_master->addRedirect($this->request->post)) {
                $this->setJsonResponse(array(
                    'success' => $this->language->get('text_success_add')
                ));
                return;
            } else {
                $this->error['add'] = $this->language->get('error_add_redirect');
            }
        }

        $this->setJsonResponse(array(
            'error' => $this->error
        ));
    }

    /**
     * @return void
     */
    public function save() {
        $this->initModels();
        $this->initLanguage(false);

        if ($this->validateSave()) {
            if ($this->model_tool_simple_redirect_master->editRedirect($this->request->post['redirect_id'], $this->request->post)) {
                $this->setJsonResponse(array(
                    'success' => $this->language->get('text_success_save_redirect')
                ));
                return;
            } else {
                $this->error['save'] = $this->language->get('error_save_redirect');
            }
        }

        $this->setJsonResponse(array(
            'error' => $this->error
        ));
    }

    /**
     * @return void
     */
    public function delete() {
        $this->initModels();
        $this->initLanguage(false);

        if ($this->validateDelete()) {
            if ($this->model_tool_simple_redirect_master->deleteRedirect($this->request->post['redirect_id'])) {
                $this->setJsonResponse(array(
                    'success' => $this->language->get('text_success_delete_redirect')
                ));
                return;
            } else {
                $this->error['delete'] = $this->language->get('error_delete_redirect');
            }
        }

        $this->setJsonResponse(array(
            'error' => $this->error
        ));
    }

    /**
     * @return void
     */
    public function warning_disable() {
        $this->initLanguage(false);
        $this->initModels();

        if ($this->validateWarningDisable()) {
            $type = $this->request->post['type'];
            $settings = $this->model_setting_setting->getSetting('simple_redirect_master');
            $settings['simple_redirect_master_warning_disable_' . $type] = 1;
            $this->model_setting_setting->editSetting('simple_redirect_master', $settings);

            $this->setJsonResponse(array(
                'success' => $this->language->get('text_success_warning_disable'),
                'type' => $type
            ));
            return;
        }

        $this->setJsonResponse(array(
            'error' => $this->error
        ));
    }

    /**
     * @return void
     */
    public function warning_action() {
        $this->initLanguage(false);
        $this->initModels();
        $data = array();

        if ($this->validateWarningAction()) {
            $type = $this->request->post['type'];

            $status = false;

            switch ($type) {
                case 'pre_action':
                    if (!$this->hasPreAction()) {
                        if ($this->isPreActionFileWritable()) {
                            $this->addPreAction();
                            $status = true;
                        } else {
                            $this->error['pre_action_file_not_writable'] = $this->language->get('error_pre_action_file_not_writable');
                            $data['help'] = sprintf($this->language->get('help_pre_action_file_manual_insert'), $this->getPreActionFile());
                            $data['path'] = $this->getPreActionFile();
                            $data['content'] = implode("\n", $this->getPreActionModifiedFileLines());
                            $status = false;
                        }
                    } else {
                        $status = true;
                    }
                    break;
            }

            if ($status) {
                $this->setJsonResponse(array(
                    'success' => $this->language->get('text_success_warning_action_' . $type),
                    'type' => $type,
                ));
                return;
            } else {
                $this->error['warning_action_' . $type] = $this->language->get('error_warning_action_' . $type);
            }
        }

        $this->setJsonResponse(array(
            'error' => $this->error,
            'data' => $data,
            'type' => $this->request->post['type']
        ));
    }

    /**
     * @return void
     */
    protected function initParameters() {
        if (isset($this->request->get['limit']) && (int)$this->request->get['limit'])
            $this->limit = (int)$this->request->get['limit'];
        elseif ((int)$this->config->get('config_admin_limit'))
            $this->limit = (int)$this->config->get('config_admin_limit');
        else
            $this->limit = 20;

        $this->page = isset($this->request->get['page']) && (int)$this->request->get['page'] > 0 ? (int)$this->request->get['page'] : 1;
        $this->offset = ($this->page - 1) * $this->limit;
        $this->search = isset($this->request->get['search']) ? $this->request->get['search'] : '';
        $this->sort = isset($this->request->get['sort']) ? $this->request->get['sort'] : '';
        $this->order = isset($this->request->get['order']) ? $this->request->get['order'] : 'ASC';

        $this->filterCodes = isset($this->request->get['code']) ? (array)$this->request->get['code'] : array();
        $this->filterStatus = isset($this->request->get['status']) && $this->request->get['status'] !== '' ? (bool)$this->request->get['status'] : null;

        $this->ajax = (isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest');
    }

    /**
     * @param bool $loadStrings
     * @param array $strings
     * @return void
     */
    protected function initLanguage($loadStrings = true, $strings = array()) {
        $this->load->language($this->getRouteName());

        if ($loadStrings) {
            $languageStrings = array_merge(array(
                'heading_title',

                'text_edit', 'text_enabled', 'text_disabled',
                'text_search', 'text_advanced', 'text_no_results',
                'text_loading', 'text_add_redirect', 'text_none',
                'text_not_show_again', 'text_pre_action_content', 'text_ajax_no_response',
                'text_confirm_delete', 'text_confirm_leave_page',

                'column_from', 'column_to', 'column_code',
                'column_status', 'column_action',

                'entry_from', 'entry_to', 'entry_status',
                'entry_code', 'entry_per_page',

                'button_edit', 'button_save', 'button_cancel',
                'button_delete', 'button_add', 'button_create',
                'button_ok', 'button_yes', 'button_no',

                'error_ajax',

                'help_from', 'help_to', 'help_code'
            ), $strings);

            foreach ($languageStrings as $key => $value) {
                if (!is_string($key))
                    $key = $value;

                $this->data[$key] = $this->language->get($value);
            }
        }
    }

    /**
     * @return void
     */
    protected function initCodes() {
        $this->data['codes'] = array();

        foreach ($this->codes as $code) {
            $this->data['codes'][$code] = array(
                'code' => $code,
                'text' => $this->language->get('text_code_' . $code),
                'checked' => in_array($code, $this->filterCodes)
            );
        }
    }

    /**
     * @return void
     */
    protected function initDocument() {
        $this->document->setTitle($this->language->get('heading_title'));
        $scripts = array(
            'lib/toastr/toastr.min',
            'lib/bootbox.min',
            'script'
        );

        foreach ($scripts as $script) {
            $this->document->addScript('view/javascript/simple-redirect-master/' . $script . '.js');
        }

        $this->document->addStyle('view/javascript/simple-redirect-master/lib/toastr/toastr.min.css');
    }

    /**
     * @param string $url
     * @param int $total
     * @return void
     */
    protected function initPagination($url, $total) {
        $pagination = new \Pagination();

        $pagination->page = $this->page;
        $pagination->limit = $this->limit;
        $pagination->total = $total;
        $pagination->url = $url;

        $this->data['pagination'] = str_replace('<a', '<a data-load="pagination"', $pagination->render());

        $from = ($total) ? (($this->page - 1) * $this->limit) + 1 : 0;

        if ($from < $total) {
            $this->data['results'] = sprintf(
                $this->language->get('text_pagination'),
                $from,
                ((($this->page - 1) * $this->limit) > ($total - $this->limit)) ? $total : ((($this->page - 1) * $this->limit) + $this->limit),
                $total,
                ceil($total / $this->limit)
            );
        } else {
            $this->data['results'] = '';
        }
    }

    /**
     * @return void
     */
    protected function initSortLinks() {
        $this->data['sort_from'] = $this->getSortLink('from');
        $this->data['sort_to'] = $this->getSortLink('to');
        $this->data['sort_code'] = $this->getSortLink('code');
        $this->data['sort_status'] = $this->getSortLink('status');
    }

    /**
     * @return void
     */
    protected function initRedirects() {
        $this->data['redirects'] = array();

        if ($this->model_tool_simple_redirect_master) {
            $redirects = $this->model_tool_simple_redirect_master->getRedirects($this->getFilterData());

            $default_code = reset($this->codes);

            foreach ($redirects as $redirect) {
                $code = in_array($redirect['code'], $this->codes) ? (int)$redirect['code'] : $default_code;
                $this->data['redirects'][] = array(
                    'id' => $redirect['redirect_id'],
                    'from' => $redirect['from'],
                    'show_from' => $this->hasFoundedText($redirect['from']) ? $this->markFoundedText($redirect['from']) : $redirect['from'],
                    'to' => $redirect['to'],
                    'show_to' => $this->hasFoundedText($redirect['to']) ? $this->markFoundedText($redirect['to']) : $redirect['to'],
                    'code' => $code,
                    'status' => (bool)$redirect['status']
                );
            }

            $this->initPagination(
                $this->link($this->getRouteName(), $this->getUrlParameters(array('page')) . '&page={page}', true),
                $this->model_tool_simple_redirect_master->getTotalRedirects($this->getFilterData())
            );
        }
    }

    /**
     * @param array $data
     * @return array
     */
    protected function getFilterData($data = array()) {
        return array_merge(array(
            'filter_search' => $this->search,
            'filter_status' => $this->filterStatus,
            'filter_codes' => $this->filterCodes,
            'offset' => $this->offset,
            'limit' => $this->limit,
            'sort' => $this->sort,
            'order' => $this->order
        ), $data);
    }

    /**
     * @return void
     */
    protected function initModels() {
        try {
            $this->load->model('tool/simple_redirect_master');
            $this->load->model('setting/setting');
        } catch (\Exception $e) {
            trigger_error($e->getMessage());
        }
    }

    /**
     * @return void
     */
    protected function initActions() {
        $this->data['action_cancel'] = $this->link('extension/' . (version_compare(VERSION, '2.3.0.0', '<') ? 'module' : 'extension'));
        $this->data['action_add'] = $this->link($this->getRouteName() . '/add');
        $this->data['action_save'] = $this->link($this->getRouteName() . '/save');
        $this->data['action_delete'] = $this->link($this->getRouteName() . '/delete');
        $this->data['action_search'] = $this->url->link('', '');
        $this->data['action_not_show_again'] = $this->link($this->getRouteName() . '/warning_disable');
        $this->data['action_warning_action'] = $this->link($this->getRouteName() . '/warning_action');
    }

    /**
     * @return void
     */
    protected function initCommonData() {
        $this->data['ajax'] = $this->ajax;
        $this->data['search'] = $this->search;
        $this->data['sort'] = $this->sort;
        $this->data['order'] = $this->order;
        $this->data['token'] = $this->session->data['token'];
        $this->data['route'] = $this->request->get['route'];
        $this->data['filterStatus'] = $this->filterStatus;
        $this->data['current_url'] = $this->link($this->request->get['route'], $this->getUrlParameters());
    }

    /**
     * @return void
     */
    protected function initLimits() {
        $limits = array(
            $this->limit,
            (int)$this->config->get('config_limit_admin'),
            20, 40, 60, 80, 100
        );

        $limits = array_unique(array_filter($limits, function ($limit) {
            return $limit > 0;
        }));

        sort($limits);

        $this->data['limits'] = array();

        foreach ($limits as $limit) {
            $this->data['limits'][] = array(
                'value' => $limit,
                'selected' => $this->limit === $limit
            );
        }
    }

    /**
     * @return void
     */
    protected function initBreadcrumbs() {
        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->link('common/dashboard', '', true)
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->link('extension/' . (version_compare(VERSION, '2.3.0.0', '<') ? 'module' : 'extension'), '', true)
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->link($this->getRouteName(), '', true)
        );
    }

    /**
     * @return void
     */
    protected function initWarnings() {
        if ($this->ajax)
            return;

        if (!$this->hasPreAction()) {
            $this->addWarning(
                'pre_action',
                $this->language->get('warning_no_pre_action'),
                $this->language->get('action_add_pre_action')
            );
        }

        $this->data['warnings'] = $this->warning;
    }

    /**
     * @return void
     */
    protected function initDeveloperInfo() {
        $this->data['developer'] = sprintf(
            $this->language->get('text_developer'),
            self::VERSION,
            'Vozhzhov Artyom',
            self::YEAR_CREATED . (($current_year = (int)date('Y', time())) > self::YEAR_CREATED ? '-' . $current_year : ''),
            self::EMAIL
        );
    }

    /**
     * @return void
     */
    protected function initParts() {
        $this->data['header'] = $this->load->controller('common/header');
        $this->data['column_left'] = $this->load->controller('common/column_left');
        $this->data['footer'] = $this->load->controller('common/footer');
    }

    /**
     * Returns link with token
     *
     * @param string $route
     * @param string $args
     * @param bool $secure
     * @return string
     */
    protected function link($route, $args = '', $secure = false) {
        if (is_array($args))
            $args['token'] = $this->session->data['token'];
        else
            $args .= '&token=' . $this->session->data['token'];

        return $this->url->link($route, $args, $secure);
    }

    /**
     * @param string $type
     * @param string $message
     * @param string $text_action
     * @param string $load_url
     * @param bool $force_add
     */
    protected function addWarning($type, $message, $text_action = '', $load_url = '', $force_add = false) {
        if ($force_add || !$this->config->get('simple_redirect_master_warning_disable_' . $type)) {
            $warning = array(
                'type' => $type,
                'message' => $message,
                'action' => $text_action,
                'load' => $load_url,
                'disableable' => $this->user->hasPermission('modify', 'module/simple_redirect_master')
            );

            $this->warning[$type] = $warning;
        }
    }


    /**
     * @param mixed $data
     */
    protected function setJsonResponse($data) {
        $this->response->addHeader('Content-type: application/json');
        $this->response->setOutput(json_encode($data));
    }

    /**
     * @param string $sort
     * @return string
     */
    protected function getSortLink($sort) {
        $order = ($sort === $this->sort ? ($this->order === 'ASC' ? 'DESC' : 'ASC') : $this->order);

        return $this->link(
            $this->request->get['route'],
            $this->getUrlParameters(array('sort', 'order')) . '&sort=' . $sort . '&order=' . $order
        );
    }

    /**
     * Returns current url query params
     * Some can be excluded by passing
     * array of names through argument
     *
     * @param array $exclude
     * @return string
     */
    protected function getUrlParameters($exclude = array()) {
        $parameters = array();
        $check = array(
            'page',
            'limit',
            'sort',
            'order',
            'search',
            'status',
            'code'
        );

        foreach ($check as $parameter) {
            if (isset($this->request->get[$parameter]) && !in_array($parameter, $exclude)) {
                $parameters[$parameter] = $this->request->get[$parameter];
            }
        }

        if (empty($parameters)) {
            return '';
        }

        return '&' . http_build_query($parameters);
    }

    /**
     * @return boolean
     */
    protected function validateAdd() {
        if (!$this->validateRequestMethod())
            return false;

        if (!$this->validatePermission())
            return false;

        return $this->validateRedirect();
    }

    /**
     * @param int|null $excludeRedirectId
     * @return bool
     */
    protected function validateRedirect($excludeRedirectId = null) {

        if (!isset($this->request->post['from']) || !$this->request->post['from']) {
            $this->error['from'] = $this->language->get('error_empty_from');
        } elseif ($this->model_tool_simple_redirect_master->fromExists($this->request->post['from'], $excludeRedirectId)) {
            $this->error['from'] = $this->language->get('error_from_not_unique');
        }

        if (!isset($this->request->post['to']) || !$this->request->post['to']) {
            $this->error['to'] = $this->language->get('error_empty_to');
        } elseif (isset($this->request->post['from']) && $this->request->post['from'] && $this->request->post['from'] == $this->request->post['to']) {
            $this->error['to'] = $this->language->get('error_from_to_same');
        }

        return empty($this->error);
    }

    /**
     * @return bool
     */
    protected function validateSave() {
        if (!$this->validateRequestMethod())
            return false;

        if (!$this->validatePermission())
            return false;

        if (!isset($this->request->post['redirect_id']) || !$this->request->post['redirect_id']) {
            $this->error['redirect_id'] = $this->language->get('error_empty_redirect_id');
            return false;
        }

        return $this->validateRedirect($this->request->post['redirect_id']);
    }

    /**
     * @return bool
     */
    protected function validateDelete() {
        if (!$this->validateRequestMethod())
            return false;

        if (!$this->validatePermission())
            return false;

        if (!isset($this->request->post['redirect_id']) || !$this->request->post['redirect_id']) {
            $this->error['redirect_id'] = $this->language->get('error_empty_redirect_id');
            return false;
        }

        return empty($this->error);
    }

    /**
     * @return bool
     */
    protected function validateWarning() {
        $type = isset($this->request->post['type']) ? $this->request->post['type'] : null;

        if (!$type || !in_array($type, $this->availableWarningTypes)) {
            $this->error['warning_type'] = $this->language->get('error_warning_type');
        }

        return empty($this->error);
    }

    /**
     * @return bool
     */
    protected function validateWarningDisable() {
        if (!$this->validateRequestMethod())
            return false;

        if (!$this->validatePermission())
            return false;

        return $this->validateWarning();
    }

    /**
     * @return bool
     */
    protected function validateWarningAction() {
        if (!$this->validateRequestMethod())
            return false;

        if (!$this->validatePermission())
            return false;

        return $this->validateWarning();
    }

    /**
     * @return bool
     */
    protected function validateRequestMethod() {
        if (strtolower($this->request->server['REQUEST_METHOD']) !== "post") {
            $this->error['request'] = $this->language->get('error_request');
            return false;
        }

        return true;
    }

    /**
     * @return bool
     */
    protected function validatePermission() {
        if (!$this->user->hasPermission('modify', $this->getRouteName())) {
            $this->error['permission'] = $this->language->get('error_permission');
            return false;
        }

        return true;
    }

    /**
     * @param string $text
     * @return bool
     */
    protected function hasFoundedText($text) {
        if (!$this->search)
            return false;

        return (bool)preg_match('/' . preg_quote($this->search, '/') . '/i', $text);
    }

    /**
     * @param string $text
     * @return string
     */
    protected function markFoundedText($text) {
        return preg_replace('/(' . preg_quote($this->search, '/') . ')/i', '<mark class="search-match">$1</mark>', $text);
    }

    /**
     * @return void
     */
    protected function addPreAction() {
        if ($this->hasPreAction())
            return;

        $this->createPreActionFileBackup();

        $lines = $this->getPreActionModifiedFileLines();

        $this->writeFileFromLines($lines);
    }

    /**
     * @return void
     */
    protected function removePreAction() {
        if (!$this->hasPreAction())
            return;

        $lines = $this->getPreActionFileLines();
        $preActionLine = $this->getPreActionLine();

        array_splice($lines, $preActionLine - 1, 1);

        $this->writeFileFromLines($lines);
    }

    /**
     * @return bool
     */
    protected function hasPreAction() {
        return $this->getPreActionLine() > -1;
    }

    /**
     * @return bool
     */
    protected function isPreActionFileWritable() {
        return is_writable($this->getPreActionFile());
    }

    /**
     * @return bool
     */
    protected function isPreActionFileDirWritable() {
        return is_writable(dirname($this->getPreActionFile()));
    }

    /**
     * @return void
     */
    protected function createPreActionFileBackup() {
        if ($this->isPreActionFileDirWritable()) {
            $preActionFile = $this->getPreActionFile();
            copy($preActionFile, dirname($preActionFile) . '/' . basename($preActionFile) . '.srm.bak');
        }
    }

    /**
     * @return int
     */
    protected function getPreActionLine() {
        $lines = $this->getPreActionFileLines();

        for ($i = 0, $total = count($lines); $i < $total; $i++) {
            if (strpos($lines[$i], '\'startup/simple_redirect_master\'') !== false) {
                return $i + 1;
            }
        }

        return -1;
    }

    /**
     * @return string
     */
    protected function getPreActionFile() {
        return version_compare(VERSION, '2.2.0.0', '>=') ? DIR_CONFIG . 'catalog.php' : realpath(DIR_CATALOG . '../index.php');
    }

    /**
     * @return array
     */
    protected function getPreActionFileLines() {
        return explode("\n", preg_replace('/[\r\n]/', "\n", file_get_contents($this->getPreActionFile())));
    }

    /**
     * @param array $lines
     * @return void
     */
    protected function writeFileFromLines($lines) {
        $f = fopen($this->getPreActionFile(), 'w');
        fwrite($f, implode("\n", $lines));
        fclose($f);
    }

    /**
     * @return array
     */
    protected function getPreActionModifiedFileLines()
    {
        $lines = $this->getPreActionFileLines();

        $preActionArrayStarted = false;
        for ($i = 0, $total = count($lines); $i < $total; $i++) {
            $line = $lines[$i];
            if (version_compare(VERSION, '2.2.0.0', '>=')) {
                if ($line == '$_[\'action_pre_action\'] = array(') {
                    $preActionArrayStarted = true;
                }

                if ($preActionArrayStarted && preg_match('/^(\s*?)\'startup\/seo_url/', $line, $indent)) {
                    array_splice($lines, $i, 0, $indent[1] . '\'startup/simple_redirect_master\',');
                    break;
                }
            } else {
                if (preg_match('/\$controller->addPreAction\s*\(\s*new\s+Action\(\s*\'common\/maintenance\'\s*\)\s*\)\s*;/', $line)) {
                    array_splice($lines, $i, 0, array(
                        '',
                        '// Simple Redirect Master',
                        '$controller->addPreAction(new Action(\'startup/simple_redirect_master\'));'
                    ));
                    break;
                }
            }
        }

        return $lines;
    }

    protected function getRouteName($name = 'simple_redirect_master') {
        return (version_compare(VERSION, '2.3.0.0', '<') ? '' : 'extension/') . 'module/' . $name;
    }
}