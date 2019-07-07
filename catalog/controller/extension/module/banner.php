<?php
class ControllerExtensionModuleBanner extends Controller {
	public function index($setting) {
		static $module = 0;

		$this->load->model('design/banner');
		$this->load->model('tool/image');

		$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
		$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.transitions.css');
		$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');

		$data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);
		
		$tplname = ($results[0]['suffix'])?$results[0]['suffix']:$setting['name'];
		
		$defaultname = $this->config->get('theme_default_directory');
		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['banners'][] = array(
				    'title' => str_replace(array('&lt;','&gt;'), array('<','>'), $result['title']),
					'link'  => $result['link'],
					'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']),
				    'image2' =>  'image/'.$result['image'],
				    'descr' => str_replace(array('&lt;','&gt;'), array('<','>'), $result['descr'])
				);
			}
		}
		//Обучение &lt;br&gt;&lt;b&gt;от бустеров&lt;/b&gt;
		$data['module'] = $module++;
		TemplateLoader::initLinks($this, $data);
		if (file_exists('catalog/view/theme/default/template/extension/module/banner_'.$tplname.'.tpl')){
		    return $this->load->view('extension/module/banner_'.$tplname, $data);
		}else{return $this->load->view('extension/module/banner', $data);}
	}
}