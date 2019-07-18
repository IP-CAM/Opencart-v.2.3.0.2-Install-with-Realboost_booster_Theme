<?php

class ModelExtensionPaymentW1 extends Model {
  /**
   * The output of the method of payment in the list when ordering.
   * 
   * @param type $address
   * @return type
   */
  public function getMethod($address) {
    $currentLanguage = $this->language->get('code');
    include_once $_SERVER['DOCUMENT_ROOT'].'/walletone/Classes/W1Client.php';
    $client = \WalletOne\Classes\W1Client::init()->run($currentLanguage);
    
    if ($this->config->get('w1_status')) {
      $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int) $this->config->get('w1GeoZone') . "' AND country_id = '" . (int) $address['country_id'] . "' AND (zone_id = '" . (int) $address['zone_id'] . "' OR zone_id = '0')");

      if (!$this->config->get('w1GeoZone')) {
        $status = TRUE;
      }
      elseif ($query->num_rows) {
        $status = TRUE;
      }
      else {
        $status = FALSE;
      }
    }
    else {
      $status = FALSE;
    }
    
    $method_data = array();

    if ($status) {
      $method_data = array(
        'id' => 'w1',
        'code' => 'w1',
        'title' => w1Title,
        'terms' => '',
        'sort_order' => ''
      );
    }
    return $method_data;
  }
  
  /**
   * Get the name of the selected order status of settings.
   * @param type $name
   * @return type
   */
  public function getStatus($name) {
    $status = $this->db->query("SELECT `name` FROM " . DB_PREFIX . "order_status WHERE  `order_status_id` = " . (int) $this->config->get('w1OrderStatus'.$name));
    return mb_strtolower($status->row['name']);
  }

}
?>