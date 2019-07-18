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
    include_once $_SERVER['DOCUMENT_ROOT'].'/walletone/Classes/W1Client.php';
    $this->client = \WalletOne\Classes\W1Client::init()->run($currentLanguage);
    
    $this->logger = \Logger::getLogger(__CLASS__);
  }


  /**
   * The output form to send the payment system.
   * 
   * @return type
   */
  public function index() {
    $this->load->language('extension/payment/w1');
    $this->load->model('extension/payment/w1');
    $data['button_confirm'] = $this->language->get('button_confirm');
    $data['button_back'] = $this->language->get('button_back');

    $this->load->model('checkout/order');
    $order = $this->model_checkout_order->getOrder($this->session->data['order_id']);
    
    $cultureId = $this->config->get('w1CultureId');
    $successUrl = $this->url->link('extension/payment/w1/resultpayment', '', 'SSL');
    $settings = [
      'merchantId' => $this->config->get('w1MerchantId'),
      'signatureMethod' => 'md5',
      'signature' => $this->config->get('w1Signature'),
      'currencyId' => $this->config->get('w1CurrencyId'),
      'currencyDefault' => $this->config->get('w1CurrencyDefault'),
      'orderStatusSuccess' => $this->config->get('w1OrderStatusSuccess'),
      'orderStatusWaiting' => $this->config->get('w1OrderStatusWaiting'),
      'cultureId' => (!empty($cultureId) && isset($this->client->getSettings()->cultureArray[$cultureId]) 
          ? $cultureId : ''),
      'order_currency' => array_search($order['currency_code'], $this->client->getSettings()->currencyCode),
      'summ' => number_format($order['total'], 2, '.', ''),
      'orderId' => $order['order_id'],
      'siteName' => $order['store_name'],
      'successUrl' => $successUrl.(strpos($successUrl, '?') == false ? '?' : '&').'id_order='.$order['order_id'],
      'failUrl' => $successUrl.(strpos($successUrl, '?') == false ? '?' : '&').'id_order='.$order['order_id'],
      'nameCms' => '_opencart'
    ];
    
    $ptenabled = $this->config->get('w1_ptenabled');
    if(!empty($ptenabled)){
      $settings['paymentSystemEnabled'] = $ptenabled;
    }
    $ptdisabled = $this->config->get('w1_ptdisabled');
    if(!empty($ptdisabled)){
      $settings['paymentSystemDisabled'] = $ptdisabled;
    }
    
    if(!empty($order['email'])){
      $settings['emailBuyer'] = $order['email'];
    }
    if(!empty($order['firstname'])){
      $settings['firstNameBuyer'] = $order['firstname'];
    }
    if(!empty($order['lastname'])){
      $settings['lastNameBuyer'] = $order['lastname'];
    }
    
    $pathToView = (property_exists('Config', 'config_template') ? '' : $this->config->get('config_template'));
    
    if ($this->client->validateParams($settings) !== true) {
      $data['error'] = $this->client->getMessage($this->client->errors, $this->client->messages, 'text');
      $this->response->setOutput($this->load->view('extension/payment/w1_error.tpl', $data));
      return true;
    }
    
    $data['order_status'] = $this->config->get('w1OrderStatusWaiting');
    $this->model_checkout_order->addOrderHistory($order['order_id'], $this->config->get('w1OrderStatusWaiting'));
    
    if (isset($this->session->data['order_id'])) {
      $this->cart->clear();
    
      // Add to activity log
      $this->load->model('account/activity');

      if ($this->customer->isLogged()) {
        $activity_data = array(
          'customer_id' => $this->customer->getId(),
          'name' => $this->customer->getFirstName() . ' ' . $this->customer->getLastName(),
          'order_id' => $this->session->data['order_id']
        );

        $this->model_account_activity->addActivity('order_account', $activity_data);
      }
      else {
        $activity_data = array(
          'name' => $this->session->data['guest']['firstname'] . ' ' . $this->session->data['guest']['lastname'],
          'order_id' => $this->session->data['order_id']
        );

        $this->model_account_activity->addActivity('order_guest', $activity_data);
      }

      unset($this->session->data['shipping_method']);
      unset($this->session->data['shipping_methods']);
      unset($this->session->data['payment_method']);
      unset($this->session->data['payment_methods']);
      unset($this->session->data['guest']);
      unset($this->session->data['comment']);
      unset($this->session->data['order_id']);
      unset($this->session->data['coupon']);
      unset($this->session->data['reward']);
      unset($this->session->data['voucher']);
      unset($this->session->data['vouchers']);
      unset($this->session->data['totals']);
    }
    
    $fields = $this->client->createFieldsForForm();
    $redirect = false;
    $data['action'] = $this->client->getPayments()->paymentUrl;
    
    $data = array_merge($data, $fields);
    return $this->load->view($pathToView . 'extension/payment/w1.tpl', $data);
  }
  
  /**
   * Page after processing the return with result payment the buyer.
   * 
   * @return boolean
   */
  public function resultpayment(){
    $data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
    
    $this->load->language('extension/payment/w1');
    $this->load->model('extension/payment/w1');
    
    $this->document->setTitle(w1Title);
    
    $data['breadcrumbs'] = array();
    $data['breadcrumbs'][] = array(
      'text' => $this->language->get('text_home'),
      'href' => $this->url->link('common/home')
    );
    $data['breadcrumbs'][] = array(
      'text' => textBasket,
      'href' => $this->url->link('checkout/cart')
    );
    $data['breadcrumbs'][] = array(
      'text' => textCheckout,
      'href' => $this->url->link('checkout/checkout', '', true)
    );
    $data['breadcrumbs'][] = array(
      'text' => textSuccess,
      'href' => $this->url->link('checkout/success')
    );
    
    $data['button_continue'] = $this->language->get('button_continue');
    $data['continue'] = $this->url->link('common/home');
    $data['column_left'] = $this->load->controller('common/column_left');
    $data['column_right'] = $this->load->controller('common/column_right');
    $data['content_top'] = $this->load->controller('common/content_top');
    $data['content_bottom'] = $this->load->controller('common/content_bottom');
    $data['footer'] = $this->load->controller('common/footer');
    $data['header'] = $this->load->controller('common/header');
    
    $pathToView = (property_exists('Config', 'config_template') ? '' : $this->config->get('config_template'));
    
    if(empty($_POST) && empty($_GET['id_order'])){
      $data['error'] = $this->language->get('error_post');
      $this->response->setOutput($this->load->view($pathToView . 'extension/payment/w1_error.tpl', $data));
      return true;
    }
    
    $this->load->model('checkout/order');
    $order = $this->model_checkout_order->getOrder((int)$_GET['id_order']);
    if (empty($order)) {
      $error = sprintf(w1ErrorResultOrder, (int)$_GET['id_order']);
      $this->logger->info($error);
      $data['error'] = $error;
      $this->response->setOutput($this->load->view($pathToView . 'extension/payment/w1_error.tpl', $data));
      return true;
    }
    
    $data['headingTitle'] = sprintf(textDopTitle, '');
    if($order['order_status_id'] == $this->config->get('w1OrderStatusSuccess')){
      $text = sprintf(w1OrderResultSuccessOnlyText, (int)$_GET['id_order']);
    }
    else{
      $text = sprintf(w1OrderResultCreatedOnlyText, (int)$_GET['id_order']);
    }
      if ($this->customer->isLogged()) {
      $data['textMessage'] = sprintf(textCustomer, $text, $this->url->link('account/account', '', true), $this->url->link('account/order', '', true), $this->url->link('account/download', '', true), $this->url->link('information/contact'));
    }
    else {
      $data['textMessage'] = sprintf(textGuest, $text, $this->url->link('information/contact'));
    }
    
    $this->response->setOutput($this->load->view($pathToView . 'extension/payment/w1_result.tpl', $data));
    return true;
  }
  
  /**
   * Page response for the payment system.
   * 
   * @return boolean
   */
  public function result() {
    $this->load->language('extension/payment/w1');
    $this->load->model('extension/payment/w1');
    
    if(empty($_POST)){
      ob_start();
      echo 'WMI_RESULT=RETRY&WMI_DESCRIPTION='.w1ErrorEmptyPost;
      die();
    }
    
    $settings = [
      'merchantId' => $this->config->get('w1MerchantId'),
      'signature' => $this->config->get('w1Signature'),
      'signatureMethod' => 'md5',
      'currencyId' => $this->config->get('w1CurrencyId'),
      'currencyDefault' => $this->config->get('w1CurrencyDefault'),
      'orderStatusSuccess' => $this->config->get('w1OrderStatusSuccess'),
      'orderStatusWaiting' => $this->config->get('w1OrderStatusWaiting')
    ];
    
    $settings['orderPaymentId'] = $_POST['WMI_ORDER_ID'];
    $settings['orderState'] = mb_strtolower($_POST['WMI_ORDER_STATE']);
    $settings['orderId'] = str_replace('_' . $_SERVER['HTTP_HOST'], '', $_POST['WMI_PAYMENT_NO']);
    $settings['paymentType'] = $_POST['WMI_PAYMENT_TYPE'];
    $settings['summ'] = $_POST['WMI_PAYMENT_AMOUNT'];

    if ($this->client->resultValidation($settings, $_POST)) {
      $result = $this->client->getResult();

    $this->load->model('checkout/order');
      $order = $this->model_checkout_order->getOrder($result->orderId);
    if (empty($order)) {
        $error = sprintf(w1ErrorResultOrder, $result->orderId, $result->orderState, $result->orderPaymentId);
        $this->logger->info($error);
        ob_start();
        echo 'WMI_RESULT=RETRY&WMI_DESCRIPTION='.$error;
        die();
    }
    
    //checking on the order amount
      if (number_format($order['total'], 2, '.', '') != $result->summ) {
        $error = sprintf(w1ErrorResultOrderSumm, $result->orderId, $result->orderState, $result->orderPaymentId);
        $this->logger->info($error);
        ob_start();
        echo 'WMI_RESULT=RETRY&WMI_DESCRIPTION=' . $error;
        die();
      }

      $status = $this->config->get('w1OrderStatusSuccess');
      if (empty($order['order_status_id']) || $order['order_status_id'] != $status && $result->orderState == 'accepted') {
        $text = sprintf(w1OrderResultSuccess, $result->orderId, $result->orderState, $result->orderPaymentId);
        $this->logger->info($text);
        $data['order_status'] = $status;
        $this->model_checkout_order->addOrderHistory($order['order_id'], $status);
      }
    }
    
    if (isset($this->session->data['order_id'])) {
      $this->cart->clear();

      // Add to activity log
      $this->load->model('account/activity');

      if ($this->customer->isLogged()) {
        $activity_data = array(
          'customer_id' => $this->customer->getId(),
          'name' => $this->customer->getFirstName() . ' ' . $this->customer->getLastName(),
          'order_id' => $this->session->data['order_id']
        );

        $this->model_account_activity->addActivity('order_account', $activity_data);
      }
      else {
        $activity_data = array(
          'name' => $this->session->data['guest']['firstname'] . ' ' . $this->session->data['guest']['lastname'],
          'order_id' => $this->session->data['order_id']
        );

        $this->model_account_activity->addActivity('order_guest', $activity_data);
      }

      unset($this->session->data['shipping_method']);
      unset($this->session->data['shipping_methods']);
      unset($this->session->data['payment_method']);
      unset($this->session->data['payment_methods']);
      unset($this->session->data['guest']);
      unset($this->session->data['comment']);
      unset($this->session->data['order_id']);
      unset($this->session->data['coupon']);
      unset($this->session->data['reward']);
      unset($this->session->data['voucher']);
      unset($this->session->data['vouchers']);
      unset($this->session->data['totals']);
    }

    if ($result->orderState == 'accepted') {
      ob_start();
      echo 'WMI_RESULT=OK';
      ob_end_flush();
      die();
    }
    $this->logger->info('Error');
    ob_start();
    echo 'WMI_RESULT=RETRY&WMI_DESCRIPTION=Error';
    die();
  }
}

?>