<?php
class ControllerExtensionModuleCustomMenu extends Controller {
	public function index($setting) {
		static $module = 1;
		$this->load->model('tool/image');

		if (!isset($setting['custom_menu']['store_id']) || !in_array($this->config->get('config_store_id'), $setting['custom_menu']['store_id'])) {return;}

		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		if ($setting['custom_menu']['cat_invert']) {
			if (!isset($setting['custom_menu']['allcats']) && isset($this->request->get['path'])) {
				if (empty($setting['custom_menu']['fcid']) || !in_array((int)end($parts), $setting['custom_menu']['fcid'])) {return;}
			}
		} else {
			if (isset($this->request->get['path'])) {
				if (isset($setting['custom_menu']['allcats']) || !empty($setting['custom_menu']['fcid']) && in_array((int)end($parts), $setting['custom_menu']['fcid'])) {return;}
			}
		}

		if ($setting['custom_menu']['prod_invert']) {
			if (!isset($setting['custom_menu']['allprods']) && isset($this->request->get['product_id'])) {
				if (empty($setting['custom_menu']['fpid']) || !in_array($this->request->get['product_id'], $setting['custom_menu']['fpid'])) {return;}
			}
		} else {
			if (isset($this->request->get['product_id'])) {
				if (isset($setting['custom_menu']['allprods']) || !empty($setting['custom_menu']['fpid']) && in_array($this->request->get['product_id'], $setting['custom_menu']['fpid'])) {return;}
			}
		}

		$data['minimized'] = $setting['custom_menu']['minimized'];
		$data['save_view'] = !empty($setting['custom_menu']['save_view']) ? $setting['custom_menu']['save_view'] : 0;

		if (!empty($setting['custom_menu'][$this->config->get('config_language_id')]['title_status']) && !empty($setting['custom_menu'][$this->config->get('config_language_id')]['title'])) {
			$data['title'] = html_entity_decode($setting['custom_menu'][$this->config->get('config_language_id')]['title'], ENT_QUOTES, 'UTF-8');
		} elseif ($data['minimized']) {
			$data['title'] = '<h3 class="panel-title">Menu title</h3>';
		} else {
			$data['title'] = '';
		}

		$data['menu_design'] = $setting['custom_menu']['menu_design'];

		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/yo/custom/cm-' . $data['menu_design'] . '.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/yo/custom/cm-' . $data['menu_design'] . '.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/yo/custom/cm-' . $data['menu_design'] . '.css');
		}

		if ($data['menu_design'] == 'fm') {
			$this->document->addScript('catalog/view/javascript/jquery/yo/custom/menuaim.js');
		}

		$data['box_class'] = !empty($setting['custom_menu']['box_class']) ? $setting['custom_menu']['box_class'] : 'panel panel-default';
		$data['title_class'] = !empty($setting['custom_menu']['title_class']) ? $setting['custom_menu']['title_class'] : 'panel-heading';
		$data['content_class'] = $setting['custom_menu']['content_class'];
		$data['style_status'] = $setting['custom_menu']['style_status'];
		$data['style'] = isset($setting['style']) ? html_entity_decode($setting['style']) : '';

		if ($data['style_status'] && $data['style']) {
			$style = fopen('catalog/view/theme/default/stylesheet/yo/custom/cm-'.$module.'.css', 'w+');
			fwrite ($style, $data['style']);
			fclose ($style);
			$this->document->addStyle('catalog/view/theme/default/stylesheet/yo/custom/cm-'.$module.'.css');
		}

		$list = htmlspecialchars_decode($setting['output']);
		$items = json_decode($list, true);

		$toggle = $data['menu_design'] == 'am' ? $setting['custom_menu']['toggle'] : '';
		$icon = $setting['custom_menu']['icon'];
		$design = $setting['custom_menu']['menu_design'];

		$data['menu'] = $this->makeCustomMenu($items,$toggle,$icon,$design);
		$data['module'] = $module++;

		if ($data['menu']) {
			return $this->load->view('extension/module/yo/custom/cm_' . $data['menu_design'], $data);
		}
	}
	public function makeCustomMenu($items,$toggle,$icon,$design) {
		if(!is_null($items) && count($items) > 0) {
			$output = '';
			foreach($items as $item) {
				$name = html_entity_decode($item['iname'.$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
				$alt = substr(strip_tags($name), 0, 50);

				$output .= '<li';
				if ($item['iclass'.$this->config->get('config_language_id')]) {
					$output .= ' class="'.$item['iclass'.$this->config->get('config_language_id')].'"';
				}
				$output .= '>';
				if ($item['iurl'.$this->config->get('config_language_id')]) {
					$output .= '<a href="'.$item['iurl'.$this->config->get('config_language_id')].'" target="'.$item['itarget'.$this->config->get('config_language_id')].'" class="item-wrapper';
				} else {
					$output .= '<div class="item-wrapper';
				}
				if (isset($item['children']) && !$toggle) {
					$output .= ' item-toggle';
				}
				$output .= '">';
				if ($icon) {
					if ($item['icontype'.$this->config->get('config_language_id')] == 'html' && $item['htmlicon'.$this->config->get('config_language_id')]) {
						$output .= '<div class="item-icon">'.$item['htmlicon'.$this->config->get('config_language_id')].'</div>';
					} else if ($item['icontype'.$this->config->get('config_language_id')] == 'image' && $item['iicon'.$this->config->get('config_language_id')]) {
						$output .= '<div class="item-icon"><img src="image/'.$item['iicon'.$this->config->get('config_language_id')].'" alt="'.$alt.'"></div>';
					}
				}
				$output .= '<div class="item-title';
				if ($icon && !$item['iicon'.$this->config->get('config_language_id')] && !$item['htmlicon'.$this->config->get('config_language_id')] || !$icon) {
					$output .= ' item-arrow';
				}
				$output .= '">';
				$output .= $name.'</div>';
				if ($design == 'am' && $toggle && isset($item['children'])) {
					$output .= '<div class="btn-toggle"><span></span></div>';
				}
				if ($item['iurl'.$this->config->get('config_language_id')]) {
					$output .= '</a>';
				} else {
					$output .= '</div>';
				}
				if (isset($item['children'])) {
					$output .= '<ul>';
					if ($design == 'pm') {
						$output .= '<li class="active">';
						$output .= '<a class="item-wrapper pm-prev item-toggle">';
						if ($icon) {
							if ($item['icontype'.$this->config->get('config_language_id')] == 'html' && $item['htmlicon'.$this->config->get('config_language_id')]) {
								$output .= '<div class="item-icon">'.$item['htmlicon'.$this->config->get('config_language_id')].'</div>';
							} else if ($item['icontype'.$this->config->get('config_language_id')] == 'image' && $item['iicon'.$this->config->get('config_language_id')]) {
								$output .= '<div class="item-icon"><img src="image/'.$item['iicon'.$this->config->get('config_language_id')].'" alt="'.$alt.'"></div>';
							}
						}
						$output .= '<div class="item-title">'.$name.'</div>';
						$output .= '</a>';
						$output .= '</li>';
					}
					if ($design == 'fm') {
						$output .= '<div>';
					}
					$output .= $this->makeCustomMenu($item['children'],$toggle,$icon,$design);
					if ($design == 'fm') {
						$output .= '</div>';
					}
					$output .= '</ul>';
				}
				$output .= '</li>';
			}
			return $output;
		}
	}
}