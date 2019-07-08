<?php
class ControllerExtensionModuleSlidereview extends Controller {
	public function index($setting) {
		static $module = 0;		

		$this->load->model('design/slidereview');
		$this->load->model('tool/image');

		$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
		$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');

		$data['banners'] = array();

		

		
		$data['module'] = $module++;
		TemplateLoader::initLinks($this, $data);
		$review_total = $this->model_design_slidereview->getTotalReviews();
		
		foreach( $this->model_design_slidereview->getReviews() as $val){
		    $img = $this->model_design_slidereview->LoadUserImg( $val['author']);
		    $data['reviews'][] = array(
		        'title'=> $val['name'],
		        'author'=> $val['author'],
		        'rating'=> $val['rating'],
		        'photo'=> $img,
		        'date'=> $val['date_added'],
		        'text' => $val['text']
		    );
		    
		    $VCZCSDXVSXZCD=1;
		}
		return $this->load->view('extension/module/slidereview', $data);
	}
}
