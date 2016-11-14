<?php
class ModelModuleProductStickers extends Model {
	public function makeDB() {
		$sql1  = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "product_stickers` (";
    $sql1 .= "`product_sticker_id` int(11) NOT NULL AUTO_INCREMENT, ";
    $sql1 .= "`sort_order` int(3) NOT NULL DEFAULT '0', ";
    $sql1 .= "`status` tinyint(1) NOT NULL DEFAULT '1', ";
    $sql1 .= "`color` text NOT NULL, ";
    $sql1 .= "`background` text NOT NULL, ";
    $sql1 .= "PRIMARY KEY (`product_sticker_id`) ";
    $sql1 .= ") ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;";
    $this->db->query($sql1);

    $sql2  = "CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "product_stickers_description` (";
    $sql2 .= "`product_sticker_id` int(11) NOT NULL, ";
    $sql2 .= "`language_id` int(11) NOT NULL, ";
    $sql2 .= "`title` text NOT NULL, ";
    $sql2 .= "`text` text NOT NULL, ";
    $sql2 .= "PRIMARY KEY (`product_sticker_id`,`language_id`) ";
    $sql2 .= ") ENGINE=MyISAM DEFAULT CHARSET=utf8;";
    $this->db->query($sql2);

    $this->db->query("ALTER TABLE `" . DB_PREFIX . "product` ADD `product_stickers` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ;");
	}

	public function removeDB() {
	  $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "product_stickers`;");
	  $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "product_stickers_description`;");
	  $this->db->query("ALTER TABLE `" . DB_PREFIX . "product` DROP `product_stickers` ;");
	}
}
