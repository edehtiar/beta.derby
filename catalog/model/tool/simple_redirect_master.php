<?php

/**
 * @property DB $db
 */
class ModelToolSimpleRedirectMaster extends Model {

    /**
     * @param $from
     * @return array
     */
    public function getRedirect($from) {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "srm_redirect` WHERE `from` = '" . $this->db->escape($from) . "' AND `status` = '1' LIMIT 1");

        return $query->row;
    }

    /**
     * @return bool
     */
    public function isModuleEnabled() {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "extension` WHERE `type` = 'module' AND `code` = 'simple_redirect_master'");

        return $query->num_rows > 0;
    }
}