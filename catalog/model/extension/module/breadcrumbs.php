<?php

/**
 * Class ModelExtensionModuleBreadcrumbs
 *
 * @module   BreadCrumbs
 * @author   catcherochek
 * @created  09.07.2019 03:39
 */

class ModelExtensionModuleBreadcrumbs extends Controller
{
    
    
    public function getSeoParts($get,$controller=''){
     
        
       
        if (isset($get['_route_'])){
            //its ok we have links through seo link
            $parts = explode('/', $get['_route_']);
        }else{
            $handler = str_replace('/','_',$get['route']);
            //its not ok cuz links are without seo
            //standard breadcrumbs behavior
            try {
                if (method_exists($this, $handler)){
                    return call_user_func(array($this, $handler),array());}
            } catch (Exception $e) {
                return "error";
            }
            
            
        }
        
        $breadcrumbs[] = array( 
            'href' => '',
            'text' => 'Главная'
            
        );
        //last part 
        $link = '';
        $name = '';
        switch ($get['route']){
            case 'product/product':
                $pid = $get['product_id'];
                $this->load->model('catalog/product');
                $prod = $this->model_catalog_product->getProduct($pid);
                $name = $prod['name'];
                $link  = $get['_route_'];
                break;
            case 'information/information':
                $pid = $get['information_id'];
                $this->load->model('catalog/information');
                $prod = $this->model_catalog_information->getInformation($pid);
                $name = $prod['title'];
                $link  = $get['_route_'];
                
                break;
            case 'account/account':
                //$pid = $get['information_id'];
                $this->load->model('catalog/information');
                $prod = $this->customer;
                $this->load->language('account/account');
                
                $name = $this->language->get('heading_title');
                $link  = $get['_route_'];
                
                
                break;
        }
        //last bread
        $breadcrumbs[] = array(
            'href' => $link,
            'text' => $name
            
        );
        return  $breadcrumbs;
    }
    

    public function getText()
    {
        return 'Text from model';
    }
    
    
    //Handlers for a standart behavior
    
    
    public function account_account(array $params=array()){
        
        $this->load->language('account/account');
        
        $breadcrumbs = array();
        
        $breadcrumbs[] = array(
            'text' => 'Главная',
            'href' => $this->url->link('common/home')
        );
        
        $breadcrumbs[] = array(
            'text' => $this->language->get('text_account'),
            'href' => $this->url->link('account/account', '', true)
        );
        return  $breadcrumbs;
    }
    
    

}