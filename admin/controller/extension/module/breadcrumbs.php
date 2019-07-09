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

    private $error = array();

    public function index()
    {
        $data = $this->load->language('extension/module/breadcrumbs');
        $this->document->setTitle($data['heading_title']);

        $this->load->model('setting/setting');
        $this->load->model('extension/module/breadcrumbs');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

            $this->model_setting_setting->editSetting('breadcrumbs', $this->request->post);
            $this->session->data['success'] = $data['text_success'];
            $this->response->redirect($this->url->link('extension/module/breadcrumbs',
                'token='.$this->session->data['token'], 'SSL'));
        }

        $data['demoData'] = $this->model_extension_module_breadcrumbs->getDemoData();


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
            'href'      => $this->url->link('extension/module/breadcrumbs', 'token='.$this->session->data['token'], 'SSL'),
            'separator' => ' :: ',
        );

        $data['action'] = $this->url->link('extension/module/breadcrumbs', 'token='.$this->session->data['token'], 'SSL');
        $data['cancel'] = $this->url->link('extension/extension', 'token='.$this->session->data['token'], 'SSL');


        if (isset($this->request->post['breadcrumbs_status'])) {
            $data['breadcrumbs_status'] = $this->request->post['breadcrumbs_status'];
        } else {
            $data['breadcrumbs_status'] = $this->config->get('breadcrumbs_status');
        }

        $this->load->model('design/layout');
        $data['layouts'] = $this->model_design_layout->getLayouts();

        $data['header']      = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer']      = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/module/breadcrumbs.tpl', $data));
    }

    /**
     * @return bool
     */
    protected function validate()
    {

        // Block to check the user permission to manipulate the module
        if ( ! $this->user->hasPermission('modify', 'extension/module/breadcrumbs')) {
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
    }

    public function uninstall()
    {
    }

}