<?php
/**
 * Class ModelExtensionModuleMenunav
 *
 * @module   CustomMenu
 * @author   catcherochek
 * @created  30.06.2019 07:22
 */

class ModelExtensionModuleMenunav extends Model
{

    /**
     * @return array
     */
    public function getDemoData()
    {
        $data = ['demo'];

        return $data;
    }
    
    public function getTypeText(){
       $this->load->language('extension/module/menunav');
       return array(
           '1'=>$this->language->get('t_override1'),
           '2'=>$this->language->get('t_override2'),
           '3'=>$this->language->get('t_override3'),
       ); 
    }
    
   
    public function GetCustomMenuData(){//
        require_once DIR_SYSTEM.'library/menunav.php';
        $this->registry->set('menunav',new MenuNav($this));
        return  $this->menunav->GetCustomMenuData();
        
    }
   
    
   
   
    

}