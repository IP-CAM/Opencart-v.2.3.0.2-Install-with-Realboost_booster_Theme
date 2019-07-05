<?php
/**
 * Class ControllerExtensionModuleMenunav
 *
 * @module   CustomMenu
 * @author   catcherochek
 * @created  30.06.2019 07:22
 */

class ControllerExtensionModuleMenunav extends Controller
{
    public static $types;

    private $error = array();
       
    public function index()
    {
        
        $data = $this->load->language('extension/module/menunav');
        $this->document->setTitle($data['heading_title']);
        
        $this->load->model('setting/setting');
        $this->load->model('extension/module/menunav');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

            $this->model_setting_setting->editSetting('menunav', $this->request->post);
            $this->session->data['success'] = $data['text_success'];
            if (isset($this->request->post['arr_menu'])&($this->request->post['menunav_status'])){
                $this->save($this->request->post);}
            
            $this->response->redirect($this->url->link('extension/module/menunav',
            'token='.$this->session->data['token'], 'SSL'));
        }
        
        
        $data['demoData'] = $this->model_extension_module_menunav->getDemoData();


        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];

            unset($this->error['warning']);
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }


        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home', 'token='.$this->session->data['token'], 'SSL'),
            'separator' => false,
        );

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_module'),
            'href'      => $this->url->link('extension/extension', 'token='.$this->session->data['token'], 'SSL'),
            'separator' => ' :: ',
        );

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->url->link('extension/module/menunav', 'token='.$this->session->data['token'], 'SSL'),
            'separator' => ' :: ',
        );

        $data['action'] = $this->url->link('extension/module/menunav', 'token='.$this->session->data['token'], 'SSL');
        $data['cancel'] = $this->url->link('extension/extension', 'token='.$this->session->data['token'], 'SSL');


        if (isset($this->request->post['menunav_status'])) {
            $data['menunav_status'] = $this->request->post['menunav_status'];
        } else {
            $data['menunav_status'] = $this->config->get('menunav_status');
        }
        
        if (isset($this->request->post['menunav_override'])) {
            $data['menunav_override'] = $this->request->post['menunav_override'];
        } else {
            $data['menunav_override'] = $this->config->get('menunav_override');
        }
        $data['menunav_override_values'] = $this->model_extension_module_menunav->getTypeText();
        $data['menunav_custom_data']= $this->model_extension_module_menunav->GetCustomMenuData();
        $data['menunav_maxval']=count($data['menunav_custom_data'])+1;

        $this->load->model('design/layout');
        $data['layouts'] = $this->model_design_layout->getLayouts();

        $data['header']      = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer']      = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/module/menunav.tpl', $data));
    }
    
    public function save($settings){
        if (isset($settings['arr_menu'])){
           $this->db->query("delete from `".DB_PREFIX."custom_menu`;");
           foreach ($settings['arr_menu'] as $v) {
               $this->db->query("INSERT INTO  `".DB_PREFIX."custom_menu` (`link_id`, `parent_id`, `link_realpath`, `link_name`, `link_seo`, `sort_order`) VALUES ('".$v['link_id']."', '".$v['parent_id']."', '".$v['link_realpath']."', '".$v['link_name']."', '".$v['link_seo']."', '".$v['sort_order']."')");
               
           }
        }
        
    }
    
    /**
     * @return bool
     */
    protected function validate()
    {

        // Block to check the user permission to manipulate the module
        if ( ! $this->user->hasPermission('modify', 'extension/module/menunav')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        // Block returns true if no error is found, else false if any error detected
        if ( ! $this->error) {
            return true;
        } else {
            return false;
        }
    }

    public function install()
    {
        $this->db->query("DROP TABLE IF EXISTS `".DB_PREFIX."custom_menu`");
        //CREATE TABLE `boost`.`oc_custom_menu` ( `link_id` INT NOT NULL AUTO_INCREMENT , `link_realpath` VARCHAR(255) NULL , `link_name` VARCHAR(255) NULL , `link_seo` VARCHAR(255) NOT NULL , PRIMARY KEY (`link_id`)) ENGINE = MyISAM;
        $this->db->query("CREATE TABLE IF NOT EXISTS `".DB_PREFIX."custom_menu` 
                        ( `link_id` INT NOT NULL AUTO_INCREMENT , 
                           `parent_id` INT NOT NULL DEFAULT 0 , 
                           `link_realpath` VARCHAR(255) NULL , 
                           `link_name` VARCHAR(255) NULL , 
                           `link_seo` VARCHAR(255) NOT NULL ,
                           `sort_order` INT NOT NULL DEFAULT 0 ,
                           PRIMARY KEY (`link_id`)) ENGINE = MyISAM;");
        //test demo case 
        //TODO Delete after
        $this->db->query("INSERT INTO `".DB_PREFIX."custom_menu` (`link_id`, `parent_id`, `link_realpath`, `link_name`, `link_seo`, `sort_order`) VALUES ('4', '0', 'cust-1', 'cust-1name', 'cust-1seo', '0');");
        $this->db->query("INSERT INTO `".DB_PREFIX."custom_menu` (`link_id`, `parent_id`, `link_realpath`, `link_name`, `link_seo`, `sort_order`) VALUES ('5', '4', 'cust-1-1', 'cust-1-1name', 'cust-1-1seo', '5');");
        $this->db->query("INSERT INTO `".DB_PREFIX."custom_menu` (`link_id`, `parent_id`, `link_realpath`, `link_name`, `link_seo`, `sort_order`) VALUES ('6', '4', 'cust-1-2', 'cust-1-2link', 'cust-1-2seo', '0');");
        $this->db->query("INSERT INTO `".DB_PREFIX."custom_menu` (`link_id`, `parent_id`, `link_realpath`, `link_name`, `link_seo`, `sort_order`) VALUES ('3', '0', 'cust-2', 'cust-2', 'cust-2', '1');");
        $this->db->query("INSERT INTO `".DB_PREFIX."custom_menu` (`link_id`, `parent_id`, `link_realpath`, `link_name`, `link_seo`, `sort_order`) VALUES ('2', '3', 'cust-2-1', 'cust-2-1name', 'cust-2-2seo', '2');");
        
        //получим все значения текущего меню
        
    }
    
    public function uninstall()
    {
        $this->db->query("DROP TABLE `".DB_PREFIX."custom_menu`");
    }




}