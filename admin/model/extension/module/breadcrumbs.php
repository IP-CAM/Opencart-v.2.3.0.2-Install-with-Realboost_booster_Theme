<?php
/**
 * Class ModelExtensionModuleBreadcrumbs
 *
 * @module   BreadCrumbs
 * @author   catcherochek
 * @created  09.07.2019 03:39
 */

class ModelExtensionModuleBreadcrumbs extends Model
{

    private $arr= array();
    public function InitLinks($get){
        
    }
    /**
     * @return array
     */
    public function getDemoData()
    {
        $data = ['demo'];

        return $data;
    }

}