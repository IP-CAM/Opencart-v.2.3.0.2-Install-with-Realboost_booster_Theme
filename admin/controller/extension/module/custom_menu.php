<?php
class ControllerExtensionModuleCustomMenu extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/custom_menu');
		$this->load->model('extension/module');

		$this->document->setTitle($this->language->get('heading_title'));
		$this->document->addScript('view/javascript/jquery/cmenu/cmenu.js');

		if (!isset($this->request->get['module_id'])) {
			$data['apply_btn'] = false;
		} else {
			$data['apply_btn'] = true;
		}

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('custom_menu', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			if ($this->request->post['apply']) {
				$this->session->data['success'] = $this->language->get('text_apply');
				$this->response->redirect($this->url->link('extension/module/custom_menu', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true));
			} else {
				$this->session->data['success'] = $this->language->get('text_success');
				$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
			}
		}

		$data['heading_title'] = $this->language->get('heading_title');
		$data['default_store'] = $this->config->get('config_name');
		$data['version'] = 'v1.0.5';

		$data['text_author'] = $this->language->get('text_author');
		$data['text_author_link'] = $this->language->get('text_author_link');
		$data['text_support'] = $this->language->get('text_support');
		$data['text_more'] = $this->language->get('text_more');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_allcats'] = $this->language->get('text_allcats');
		$data['text_allprods'] = $this->language->get('text_allprods');
		$data['text_cat_select'] = $this->language->get('text_cat_select');
		$data['text_prod_select'] = $this->language->get('text_prod_select');
		$data['text_minimized'] = $this->language->get('text_minimized');
		$data['text_expanded'] = $this->language->get('text_expanded');
		$data['text_keep'] = $this->language->get('text_keep');
		$data['text_show'] = $this->language->get('text_show');
		$data['text_hide'] = $this->language->get('text_hide');
		$data['text_item'] = $this->language->get('text_item');
		$data['text_am'] = $this->language->get('text_am');
		$data['text_pm'] = $this->language->get('text_pm');
		$data['text_fm'] = $this->language->get('text_fm');
		$data['text_center'] = $this->language->get('text_center');
		$data['text_left'] = $this->language->get('text_left');
		$data['text_right'] = $this->language->get('text_right');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_categories'] = $this->language->get('entry_categories');
		$data['entry_products'] = $this->language->get('entry_products');
		$data['entry_status'] = $this->language->get('entry_status');

		$data['entry_iname'] = $this->language->get('entry_iname');
		$data['entry_iurl'] = $this->language->get('entry_iurl');
		$data['entry_itarget'] = $this->language->get('entry_itarget');
		$data['entry_iicon'] = $this->language->get('entry_iicon');
		$data['entry_iclass'] = $this->language->get('entry_iclass');

		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_menu_design'] = $this->language->get('entry_menu_design');
		$data['entry_view'] = $this->language->get('entry_view');
		$data['entry_column'] = $this->language->get('entry_column');
		$data['entry_toggle'] = $this->language->get('entry_toggle');
		$data['entry_icons'] = $this->language->get('entry_icons');
		$data['entry_img_position'] = $this->language->get('entry_img_position');
		$data['entry_content'] = $this->language->get('entry_content');

		$data['entry_box_class'] = $this->language->get('entry_box_class');
		$data['entry_title_class'] = $this->language->get('entry_title_class');
		$data['entry_content_class'] = $this->language->get('entry_content_class');
		$data['entry_css'] = $this->language->get('entry_css');

		$data['help_categories'] = $this->language->get('help_categories');
		$data['help_products'] = $this->language->get('help_products');
		$data['help_html'] = $this->language->get('help_html');

		$data['button_new'] = $this->language->get('button_new');
		$data['button_expand'] = $this->language->get('button_expand');
		$data['button_collapse'] = $this->language->get('button_collapse');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_apply'] = $this->language->get('button_apply');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['tab_setting'] = $this->language->get('tab_setting');
		$data['tab_menu_structure'] = $this->language->get('tab_menu_structure');
		$data['tab_menu_options'] = $this->language->get('tab_menu_options');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->get['module_id'])) {
			$data['module_id'] = $this->request->get['module_id'];
		} else {
			$data['module_id'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/custom_menu', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/custom_menu', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/custom_menu', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('extension/module/custom_menu', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
		$data['token'] = $this->session->data['token'];

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = 1;
		}

		if (isset($this->request->post['output'])) {
			$data['output'] = $this->request->post['output'];
		} elseif (!empty($module_info)) {
			$data['output'] = $module_info['output'];
		} else {
			$data['output'] = '[]';
		}

		if (isset($this->request->post['style'])) {
			$data['style'] = $this->request->post['style'];
		} elseif (!empty($module_info)) {
			$data['style'] = $module_info['style'];
		} else {
			$data['style'] = '';
		}

		$data['custom_menu'] = array();

		if (isset($this->request->post['custom_menu'])) {
			$data['custom_menu'] = $this->request->post['custom_menu'];
		} elseif (!empty($module_info)) {
			$data['custom_menu'] = $module_info['custom_menu'];
		} else {
			$data['custom_menu']['store_id'][] = 0;
			$data['custom_menu']['allcats'] = 1;
			$data['custom_menu']['allprods'] = 1;
			$data['custom_menu']['cat_invert'] = 1;
			$data['custom_menu']['prod_invert'] = 1;
		}

		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();
		$data['lang'] = $this->language->get('lang');

		$this->load->model('setting/store');
		$data['stores'] = $this->model_setting_store->getStores();

		$this->load->model('catalog/category');
		$this->load->model('catalog/product');

		$data['catlocs'] = array();

		if (!empty($this->request->post['custom_menu']['fcid'])) {
			$catlocs = $this->request->post['custom_menu']['fcid'];
		} elseif (!empty($module_info) && !empty($module_info['custom_menu']['fcid'])) {
			$catlocs = $module_info['custom_menu']['fcid'];
		} else {
			$catlocs = array();
		}

		foreach ($catlocs as $category) {
			$category_info = $this->model_catalog_category->getCategory($category);

			if ($category_info) {
				$data['catlocs'][] = array(
					'category_id' => $category_info['category_id'],
					'name'        => $category_info['path'] ? $category_info['path'] . ' - &gt; ' . $category_info['name'] : $category_info['name']
				);
			}
		}

		$data['prodlocs'] = array();

		if (!empty($this->request->post['custom_menu']['fpid'])) {
			$prodlocs = $this->request->post['custom_menu']['fpid'];
		} elseif (!empty($module_info) && !empty($module_info['custom_menu']['fpid'])) {
			$prodlocs = $module_info['custom_menu']['fpid'];
		} else {
			$prodlocs = array();
		}

		foreach ($prodlocs as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);

			if ($product_info) {
				$data['prodlocs'][] = array(
					'product_id' => $product_info['product_id'],
					'name'       => $product_info['name']
				);
			}
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/custom_menu', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/custom_menu')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		return !$this->error;
	}
}