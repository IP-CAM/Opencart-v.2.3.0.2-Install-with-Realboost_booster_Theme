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
            //its not ok cuz links are without seo
            return "not_implemented";
        }
        
        $breadcrumbs[] = array( 
            'link' => '',
            'name' => 'Главная'
            
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
        }
        //last bread
        $breadcrumbs[] = array(
            'link' => $link,
            'name' => $name
            
        );
        return  $breadcrumbs;
    }
    

    public function getText()
    {
        return 'Text from model';
    }

}