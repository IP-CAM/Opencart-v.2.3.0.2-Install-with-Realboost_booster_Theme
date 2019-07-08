<?php
class ModelDesignSlidereview extends Model {
	public function getBanner($banner_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "banner b LEFT JOIN " . DB_PREFIX . "banner_image bi ON (b.banner_id = bi.banner_id) WHERE b.banner_id = '" . (int)$banner_id . "' AND b.status = '1' AND bi.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY bi.sort_order ASC");
		return $query->rows;
	}
	
	public function getReviews($data = array()) {
	    $sql = "SELECT r.review_id, pd.name, r.author, r.rating, r.status, r.date_added, r.text FROM " . DB_PREFIX . "review r LEFT JOIN " . DB_PREFIX . "product_description pd ON (r.product_id = pd.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
	    
	    if (!empty($data['filter_product'])) {
	        $sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_product']) . "%'";
	    }
	    
	    if (!empty($data['filter_author'])) {
	        $sql .= " AND r.author LIKE '" . $this->db->escape($data['filter_author']) . "%'";
	    }
	    
	    if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
	        $sql .= " AND r.status = '" . (int)$data['filter_status'] . "'";
	    }
	    
	    if (!empty($data['filter_date_added'])) {
	        $sql .= " AND DATE(r.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
	    }
	    
	    $sort_data = array(
	        'pd.name',
	        'r.author',
	        'r.rating',
	        'r.status',
	        'r.date_added'
	    );
	    
	    if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
	        $sql .= " ORDER BY " . $data['sort'];
	    } else {
	        $sql .= " ORDER BY r.date_added";
	    }
	    
	    if (isset($data['order']) && ($data['order'] == 'DESC')) {
	        $sql .= " DESC";
	    } else {
	        $sql .= " ASC";
	    }
	    
	    if (isset($data['start']) || isset($data['limit'])) {
	        if ($data['start'] < 0) {
	            $data['start'] = 0;
	        }
	        
	        if ($data['limit'] < 1) {
	            $data['limit'] = 20;
	        }
	        
	        $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
	    }
	    
	    $query = $this->db->query($sql);
	    
	    return $query->rows;
	}
	
	public function getTotalReviews($data = array()) {
	    $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review r LEFT JOIN " . DB_PREFIX . "product_description pd ON (r.product_id = pd.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
	    
	    if (!empty($data['filter_product'])) {
	        $sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_product']) . "%'";
	    }
	    
	    if (!empty($data['filter_author'])) {
	        $sql .= " AND r.author LIKE '" . $this->db->escape($data['filter_author']) . "%'";
	    }
	    
	    if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
	        $sql .= " AND r.status = '" . (int)$data['filter_status'] . "'";
	    }
	    
	    if (!empty($data['filter_date_added'])) {
	        $sql .= " AND DATE(r.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
	    }
	    
	    $query = $this->db->query($sql);
	    
	    return $query->row['total'];
	}
	
	
	public function LoadUserImg($name){
	    $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "user` WHERE username = '" . $this->db->escape($name) . "' limit 1");
	    $img = '';
	    if ($query->num_rows)
	    {
	        if ($query->rows[0]['image']){
	            $img = TemplateLoader::getPathToImgFolder().$query->rows[0]['image'];
	        }else{
	            $img = TemplateLoader::getNoImage();
	        }
	           
	    }else{
	        $img = TemplateLoader::getNoImage();
	    }
	    
	    return $img;
    }
}
