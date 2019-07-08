<?php /**
       * @author John
       *
       *класс для помощи  с интеграцией шаблона
       */
      class TemplateLoader{
    
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
   
}?>