<?php
/**
 * Платежная система Wallet One Единая касса
 * 
 * @cms    Opencart
 * @author     Wallet One
 * @version    3.0.1
 * @license    
 * @copyright  Copyright (c) 2016 Wallet One (http://www.walletone.com)
 * This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */

class ControllerExtensionPaymentW1 extends Controller {

  private $error = array();
  
  /**
   * Declaration of class client
   * 
   * @var object
   */
  private $client;
  
  private $logger;


  public function __construct($registry) {
    parent::__construct($registry);
    
    $currentLanguage = $this->language->get('code');
    include_once DIR_SYSTEM.'/walletone/Classes/W1Client.php';
    $this->client = \WalletOne\Classes\W1Client::init()->run($currentLanguage);
    
    $this->logger = \Logger::getLogger(__CLASS__);
  }

    /**
   * Page output settings.
   */
  public function index() {
    $this->document->setTitle(w1Title);
    $this->load->model('setting/setting');
    
    if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
      $this->model_setting_setting->editSetting('w1', $this->request->post);
      $this->session->data['success'] = w1SaveSubmitSuccess;
      $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'], true));
    }
    
    //a version php check
    if (PHP_VERSION_ID < 50400) {
      $data['errorPhpVersion'] = w1ErrorPhpVersion;
    }
    //text for headings
    $data['headingTitle'] = w1Title;
    $data['heading_title'] = w1Title;
    $data['titleEdit'] = titleEdit;
    
    //text for tabs
    $data['textTabInfo'] = textTabInfo;
    $data['textTabApi'] = textTabApi;
		$data['textTabDopApi'] = textTabDopApi;
    $data['textTabStatusOrder'] = textTabStatusOrder;
    
    $data['breadcrumbs'] = array();
    $data['breadcrumbs'][] = array(
      'text' => $this->language->get('text_home'),
      'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
    );
    $data['breadcrumbs'][] = array(
      'text' => textPayment,
      'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'], 'SSL')
    );
    $data['breadcrumbs'][] = array(
      'text' => w1Title,
      'href' => $this->url->link('extension/payment/w1', 'token=' . $this->session->data['token'], true)
    );
    
    //buttons in right
    $data['action'] = $this->url->link('extension/payment/w1', 'token=' . $this->session->data['token'], true);
    $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'], true);
    
    //text for labels and values of settings
    $data['textEnabled'] = $this->language->get('text_enabled');
    $data['textDisabled'] = $this->language->get('text_disabled');
    $data['textAllZones'] = $this->language->get('text_all_zones');
    $data['textGeoZone'] = textGeoZone;
    $data['textSortOrder'] = textSortOrder;
    $data['textMerchantId'] = w1SettingsMerchant;
    $data['textMerchantIdDesc'] = w1SettingsMerchantDesc;
    $data['textCurrencyId'] = w1SettingsCurrency;
    $data['textCurrencyDefault'] = w1SettingsCurrencyDefault;
    $data['textCurrencyDefaultDesc'] = w1SettingsCurrencyDefaultDesc;
    $data['textSignature'] = w1SettingsSignature;
    $data['textSignatureDesc'] = w1SettingsSignatureDesc;
    $data['textPtenabled'] = w1SettingsPtdisabled;
    $data['textPtdisabled'] = w1Settings_Ptdisabled;
    $data['textStatusOrderWaiting'] = w1SettingsOrderStatusWaiting;
    $data['textStatusOrderProcessed'] = w1SettingsOrderStatusProcessed;
    $data['textStatusOrderSuccess'] = w1SettingsOrderStatusSuccess;
    $data['textReturnUrl'] = w1SettingsReturnUrl;
    $data['textStatus'] = w1SettingsStatus;
    $data['textCultureId'] = w1SettingsCulture;
    
    $data['currencies'] = $this->client->getSettings()->currencyName;
    $data['cultures'] = $this->client->getSettings()->cultureArray;
    
    $this->load->model('localisation/order_status');
		$data['orderStatuses'] = $this->model_localisation_order_status->getOrderStatuses();
    
    $this->load->model('localisation/geo_zone');
    $data['geoZones'] = $this->model_localisation_geo_zone->getGeoZones();

    $data['button_save'] = $this->language->get('button_save');
    $data['button_cancel'] = $this->language->get('button_cancel');
    
    //error processing
    if (isset($this->error['warning'])) {
      $data['errorWarning'] = $this->error['warning'];
    }
    else {
      $data['errorWarning'] = '';
    }
    
    $fields_list = array('_sort_order', 'currencyDefault', 'geoZone',
      'merchantId', 'currencyId', 'signature', 'orderStatusWaiting',
      'orderStatusProcessed', 'orderStatusSuccess', 'cultureId');
    foreach ($fields_list as $value) {
      if (isset($this->error[$value])) {
        $data['error'.ucfirst($value)] = $this->error[$value];
      }
      else {
        $data['error'.ucfirst($value)] = '';
      }
    }
    
    //value of fields a settings
    foreach ($fields_list as $value) {
      if (isset($this->request->post['w1'.ucfirst($value)])) {
        $data[$value] = $this->request->post['w1'.ucfirst($value)];
      }
      else {
        $data['w1'.ucfirst($value)] = $this->config->get('w1'.ucfirst($value));
      }
    }
    
    if (isset($this->request->post['w1_ptenabled'])) {
      $data['w1_ptenabled'] = $this->request->post['w1_ptenabled'];
    }
    else {
      $data['w1_ptenabled'] = $this->config->get('w1_ptenabled');
    }
    if (isset($this->request->post['w1_ptdisabled'])) {
      $data['w1_ptdisabled'] = $this->request->post['w1_ptdisabled'];
    }
    else {
      $data['w1_ptdisabled'] = $this->config->get('w1_ptdisabled');
    }
    $data['listPtenabled'] = $this->client->getHtmlPayments('ptenabled', $data['w1_ptenabled']);
    $data['listPtdisabled'] = $this->client->getHtmlPayments('ptdisabled', $data['w1_ptdisabled']);
    
    if (isset($this->request->post['w1_status'])) {
      $data['w1_status'] = $this->request->post['w1_status'];
    }
    else {
      $data['w1_status'] = $this->config->get('w1_status');
    }

    $data['w1ReturnUrl'] = HTTP_CATALOG . 'index.php?route=extension/payment/w1/result';
    $data['linkToCss'] = '/walletone/css/opencart.css';
    
    $data['header'] = $this->load->controller('common/header');
    $data['column_left'] = $this->load->controller('common/column_left');
    $data['footer'] = $this->load->controller('common/footer');

    $this->response->setOutput($this->load->view('extension/payment/w1.tpl', $data));
  }
  
  /**
   * Validate settings before save.
   * 
   * @return type
   */
  protected function validate() {
    if (!$this->user->hasPermission('modify', 'extension/payment/w1')) {
      $this->error['warning'] = w1ErrorPermission;
    }
    
    $fields_list = array('merchantId', 'currencyId', 'signature');
    foreach ($fields_list as $value) {
      if (!$this->request->post['w1'.ucfirst($value)]) {
        $this->error[$value] = sprintf(w1ErrorRequired, $value);
      }
    }
    return !$this->error;
  }

}
