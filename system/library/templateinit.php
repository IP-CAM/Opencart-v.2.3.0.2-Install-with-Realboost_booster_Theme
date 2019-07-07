<?php class TemplateLoader{
    
    public static function initLinks($obj,&$data){
        $tpl = $obj->config->get('theme_default_directory');
        $data['img_path'] = "catalog/view/theme/$tpl/img/";
        $data['js_path'] = "catalog/view/theme/$tpl/js/";
        $data['css_path'] = "catalog/view/theme/$tpl/stylesheet/";
    }
    public static function noimage(){
        return DIR_IMAGE . 'no_image';
    }
    public static function getimage($namefromdb){
        return DIR_IMAGE . $namefromdb;
    }
}?>