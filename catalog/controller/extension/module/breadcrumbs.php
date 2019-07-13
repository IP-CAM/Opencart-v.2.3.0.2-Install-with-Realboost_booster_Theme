<?php
/**
 * Class ControllerExtensionModuleBreadcrumbs
 *
 * @module   BreadCrumbs
 * @author   catcherochek
 * @created  09.07.2019 03:39
 */

class ControllerExtensionModuleBreadcrumbs extends Controller
{


    public function index()
    {
        
        
        
        
        
        
        $data['title'] = $this->document->getTitle();
        $status = $this->config->get('breadcrumbs_status');

        if ($status == 1) {
            // Load model
            $this->load->model('extension/module/breadcrumbs');
            $this->model_extension_module_breadcrumbs->getText();
            $data['breadcrumbs'] = $this->model_extension_module_breadcrumbs->getSeoParts($this->request->get);
            //$data=TemplateLoader::getvars('data');
            $data['text']      = $this->model_extension_module_breadcrumbs->getText();

            if (file_exists(DIR_TEMPLATE.$this->config->get('config_template')
                .'/template/extension/module/breadcrumbs.tpl')
            ) {
                return $this->load->view($this->config->get('config_template')
                    .'/template/extension/module/breadcrumbs.tpl',
                    $data);
            } else {
                return $this->load->view('extension/module/breadcrumbs.tpl', $data);
            }
        }

        return false;
    }

}