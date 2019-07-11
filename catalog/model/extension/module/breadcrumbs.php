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
            
        }
        $breadcrumbs[] = $this->url->link('common/home');
    }
    

    public function getText()
    {
        return 'Text from model';
    }

}