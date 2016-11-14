<?php
class ModelModuleProductTabs extends Model {
	public function makeDB() {
		$sql1  = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "extra_tabs` (";
    $sql1 .= "`extra_tab_id` int(11) NOT NULL AUTO_INCREMENT, ";
    $sql1 .= "`sort_order` int(3) NOT NULL DEFAULT '0', ";
    $sql1 .= "`status` tinyint(1) NOT NULL DEFAULT '1', ";
    $sql1 .= "PRIMARY KEY (`extra_tab_id`) ";
    $sql1 .= ") ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;";
    $this->db->query($sql1);

    $sql2  = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "extra_tabs_description` (";
    $sql2 .= "`extra_tab_id` int(11) NOT NULL, ";
    $sql2 .= "`language_id` int(11) NOT NULL, ";
    $sql2 .= "`title` text NOT NULL, ";
    $sql2 .= "PRIMARY KEY (`extra_tab_id`,`language_id`) ";
    $sql2 .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8;";
    $this->db->query($sql2);

    $sql3  = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "product_extra_tabs` (";
    $sql3 .= "`product_id` int(11) NOT NULL, ";
    $sql3 .= "`extra_tab_id` int(11) NOT NULL, ";
    $sql3 .= "`language_id` int(11) NOT NULL, ";
    $sql3 .= "`text` text NOT NULL, ";
    $sql3 .= "PRIMARY KEY (`product_id`,`extra_tab_id`,`language_id`) ";
    $sql3 .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;";

    $this->db->query($sql3);
  }

  public function removeDB() {
    $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "extra_tabs`;");
    $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "extra_tabs_description`;");
    $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "product_extra_tabs`;");
  }
}
