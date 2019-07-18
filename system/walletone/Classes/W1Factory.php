<?php

namespace WalletOne\Classes;

class W1Factory{
  
  public static function createHtmlClass($config, $className, $lang = 'ru'){
    $object = null;
    switch ($className) {
      case 'diafan':
        $object = new \WalletOne\Classes\ExtraMethods\W1HtmlDiafan($config, $lang);
        break;
      case 'modx':
        $object = new \WalletOne\Classes\ExtraMethods\W1HtmlModx($config, $lang);
        break;
      default:
        $object = new \WalletOne\Classes\StandardsMethods\W1Html($config, $lang);
        break;
    }
    
    return $object;
  }
  
  public static function createPaymentsClass($config, $className, $lang = 'ru'){
    $object = null;
    switch ($className) {
      case 'diafan':
        $object = new \WalletOne\Classes\ExtraMethods\W1PaymentsDiafan($config, $lang);
        break;
      default:
        $object = new \WalletOne\Classes\StandardsMethods\W1Payments($config, $lang);
        break;
    }
    
    return $object;
  }
  
  public static function createSettingsClass($config, $className, $lang = 'ru'){
    $object = null;
    switch ($className) {
      case 'modx':
        $object = new \WalletOne\Classes\ExtraMethods\W1SettingsModx($config, $lang);
        break;
      default:
        $object = new \WalletOne\Classes\StandardsMethods\W1Settings($config, $lang);
        break;
    }
    
    return $object;
  }
}

