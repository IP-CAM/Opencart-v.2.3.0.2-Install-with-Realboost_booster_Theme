<?php /**
       * @author John
       *
       *класс для помощи  с интеграцией шаблона
       */
      class TemplateLoader{
        public static $saveddaata;
        public static $vals= array();
    /**
     * @param Registry $obj -из контроллера - $this
     * @param array $data - собссно сам объект $data
     * после этой функции в шаблоне используем $img_path и т.д...
     */
    public static function initLinks($obj,&$data){
        $tpl = $obj->config->get('theme_default_directory');
        $data['img_path'] = "catalog/view/theme/$tpl/img/";
        $data['js_path'] = "catalog/view/theme/$tpl/js/";
        $data['css_path'] = "catalog/view/theme/$tpl/stylesheet/";
    }
    
    public static function getNoImage(){
        return 'image/no_image.png';
    }
    /**путь к папке загрузок админки
     * @return string
     */
    public static function getPathToImgFolder(){
        return 'image/';
    }
    
    public static function getLayoutCategoryName($tis, $category_id){
        $qry = "SELECT route FROM `" . DB_PREFIX . "category_to_layout` occ left join " . DB_PREFIX . "layout_route ocl on occ.layout_id = ocl.layout_id where occ.category_id ='.$category_id.' LIMIT 1";
        $res = $tis->db->query($qry);
        return $res->rows[0]['route'];
    } 
    
    public static function getLayoutProductName($tis, $category_id){
        $qry = "SELECT route FROM `" . DB_PREFIX . "product_to_layout` occ left join " . DB_PREFIX . "layout_route ocl on occ.layout_id = ocl.layout_id where occ.product_id ='.$category_id.' LIMIT 1";
        $res = $tis->db->query($qry);
        return $res->rows[0]['route'];
    } 
    
    public static function replace($obj,$val){
        $tpl = $obj->config->get('theme_default_directory');
        $val = str_replace(array("\"img/","\"css/","\"js/"), array("\"catalog/view/theme/$tpl/img/","\"catalog/view/theme/$tpl/stylesheet/","\"catalog/view/theme/$tpl/js/"), $val);
        return $val;
    }
    
    public static function savedata($data){
        self::$saveddaata=$data;
    }
    public static function savevar($var,$name){
        self::$vals[$name] = $var;
    }
    public static function getvars($name){
        return self::$vals[$name];
    }
    
}?>