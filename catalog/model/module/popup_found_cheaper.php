<?php
class ModelModulePopupFoundCheaper extends Model {
	public function addRequest($data, $linkgood) {
		$this->db->query("INSERT INTO ".DB_PREFIX."popup_found_cheaper SET info = '".$this->db->escape($data['info'])."', note = '".$linkgood."', date_added = NOW()");
	}
}
?>