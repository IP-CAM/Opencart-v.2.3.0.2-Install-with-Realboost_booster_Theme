<?php
class MenuNav {
	private $adaptor;
    private $that;
    private $outarray= array();//prepared array
	public function __construct($that) {
		$this->that = $that;
	}
	
	
	public function GetCustomMenuData(){
	    //fills outarray
	    $ret = array();
	    $out = array();
	    $this->outarray= $this->preparearray();
	    //$out = $this->getArrayAtLvL(0);//getting all parents
	    if (!empty($this->outarray)){
	        $this->AddChildsToArray($this->outarray,$out);
	            
	    }
	    return $out;
	}
	
	private function getArrayAtLvL($lvl){
	    
	    return (isset($this->outarray[$lvl]))?$this->outarray[$lvl]:false;
	}
	
	private function preparearray(){
	    $ret = array();
	    if ($this->IsEnabled()){
	        $qry = "SELECT * FROM ".DB_PREFIX."custom_menu where parent_id in(%replace%) order by sort_order";
	        $replace = "SELECT group_concat(link_id) FROM ".DB_PREFIX."custom_menu where parent_id in(%replace%) order by sort_order";
	        
	        $level = 0;
	        $i=0;
	        $isOk = false;
	        while(!$isOk){
	            $query = str_replace('%replace%',$level, $qry);
	            $ret[$i] = $this->that->db->query($query)->rows;
	            if (!count($ret[$i])){
	                $isOk=true;
	                array_pop($ret);
	            }else{
	                $isOk = false;
	                $qryreplace = str_replace('%replace%',$level, $replace);
	                $res = $this->that->db->query($qryreplace);
	                $level = array_pop($res->rows[0]);
	                $i++;
	            }
	        }
	    }
	    return $ret;
	}
	
	private function AddChildsToArray($from, &$to,$lvl=0){
	    $checkElem = end($to);
	    reset($to);
	    $arr = $this->getArrayAtLvL($lvl);
	    $lvl++;
	    if ((isset($arr))&(!empty($arr))){
	        foreach ($arr as $k=>$v){
	            if ($checkElem){
	                if ($checkElem['link_id']==$v['parent_id']){
	                    $pname = $checkElem['link_name'];
	                   $v['parent_name']=($pname)?$pname:'главная';
	                   $to[]=$v;
	                   $this->AddChildsToArray($from, $to,$lvl);}
	            }else{
	                if ($checkElem === false){
	                    $pname = $checkElem['link_name'];
	                    $v['parent_name']=($pname)?$pname:'главная';
	                    $to[]=$v;
	                    $this->AddChildsToArray($from, $to,$lvl);
	                }
	            }
	                
	            
	           	            
	        }
	    }else{return false;}
	    return true;
	    
	    
	
	}
	private function findParentName($par_id){
	  return $this->that->db->query("select link_name from ".DB_PREFIX."custom_menu where link_id =".$par_id." limit 1")->rows[0]['link_name']; 
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
	
	public function IsEnabled(){
	    
	    return $this->that->config->get('menunav_status');
	}
	
}