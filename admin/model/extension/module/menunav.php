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
    
    public function IsEnabled(){
        
        return $this->config->get('menunav_status');
    }
    public function GetCustomMenuData(){//
        $ret = array();
        $out = array();
        $ret = $this->preparearray();
        $out = $this->getArrayAtLvL(0,$ret);
        if (!empty($ret)){
            foreach ($out as $key=>$val){
                $this->AddChildFrom($ret,$out[$key],1);
                
            }}
        return $out;
    }
    public function AddChildFrom($from, &$to,$lvl){
        
        $id = $to['link_id'];
        if (isset($from[$lvl])){
            $arrayval= $this->search($from[$lvl],"parent_id",$id);}else{$arrayval = false;}
        if ($arrayval){
            foreach ($arrayval as $k=>$v){
                $lvl++;
                $this->AddChildFrom($from, $v ,$lvl);
                $to['child'][$k]=$v;
            }
        }
        
        
        $data="";
    }
    public function search($array, $key, $value)
    {
        $ret = false;
        if ($array){
            foreach ($array as $k => $val){
                if ($val[$key]==$value){
                    $ret[] = $array[$k];
                }
            }
        }
        return $ret;
    }
    public function sortfunc($a,$b){
       // echo "hello";
        if ($a['link_id'] == $b['link_id']) {
            return 0;
        }
        return ($a['link_id'] < $b['link_id']) ? -1 : 1;
    }
    public function getArrayAtLvL($lvl,$arr){
        
        return ($lvl)?$arr[$lvl]:false;
    }
    public function preparearray(){
        $ret = array();
        if ($this->IsEnabled()){
            $qry = "SELECT * FROM ".DB_PREFIX."custom_menu where parent_id in(%replace%) order by sort_order";
            $replace = "SELECT group_concat(link_id) FROM ".DB_PREFIX."custom_menu where parent_id in(%replace%) order by sort_order";
            $level = 0;
            $i=0;
            $isOk = false;
            while(!$isOk){
                $query = str_replace('%replace%',$level, $qry);
                $ret[$i] = $this->db->query($query)->rows;
                if (!count($ret[$i])){
                    $isOk=true;
                }else{
                    $isOk = false;
                    $level = str_replace('%replace%',$level, $replace);
                    $i++;
                }
            }
        }
        return $ret;
    }

}