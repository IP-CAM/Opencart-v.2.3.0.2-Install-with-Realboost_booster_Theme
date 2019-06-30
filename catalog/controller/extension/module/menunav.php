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


    public function index()
    {
        $status = $this->config->get('menunav_status');

        if ($status == 1) {
            // Load model
            $this->load->model('extension/module/menunav');

            $data['text']      = $this->model_extension_module_menunav->getText();

            if (file_exists(DIR_TEMPLATE.$this->config->get('config_template')
                .'/template/extension/module/menunav.tpl')
            ) {
                return $this->load->view($this->config->get('config_template')
                    .'/template/extension/module/menunav.tpl',
                    $data);
            } else {
                return $this->load->view('extension/module/menunav.tpl', $data);
            }
        }

        return false;
    }

}