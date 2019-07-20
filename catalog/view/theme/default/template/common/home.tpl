<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
  </div>
 <script>
  
  
  
  
  
  var arrayWidth  = [
		{name:'Herald',val:150,img:'<?php  echo $img_path; ?>rank-icon/rank1_1.png'},
		{name:'Herald',val:300,img:'<?php  echo $img_path; ?>rank-icon/rank1_2.png'},
		{name:'Herald',val:450,img:'<?php  echo $img_path; ?>rank-icon/rank1_3.png'},
		{name:'Herald',val:600,img:'<?php  echo $img_path; ?>rank-icon/rank1_4.png'},
		{name:'Herald',val:750,img:'<?php  echo $img_path; ?>rank-icon/rank1_5.png'},
		{name:'Guardian',val:900,img:'<?php  echo $img_path; ?>rank-icon/rank2_1.png'},
		{name:'Guardian',val:1050,img:'<?php  echo $img_path; ?>rank-icon/rank2_2.png'},
		{name:'Guardian',val:1200,img:'<?php  echo $img_path; ?>rank-icon/rank2_3.png'},
		{name:'Guardian',val:1350,img:'<?php  echo $img_path; ?>rank-icon/rank2_4.png'},
		{name:'Guardian',val:1500,img:'<?php  echo $img_path; ?>rank-icon/rank2_5.png'},
		{name:'Crusader',val:1750,img:'<?php  echo $img_path; ?>rank-icon/rank3_1.png'},
		{name:'Crusader',val:1900,img:'<?php  echo $img_path; ?>rank-icon/rank3_2.png'},
		{name:'Crusader',val:2050,img:'<?php  echo $img_path; ?>rank-icon/rank3_3.png'},
		{name:'Crusader',val:2200,img:'<?php  echo $img_path; ?>rank-icon/rank3_4.png'},
		{name:'Crusader',val:2400,img:'<?php  echo $img_path; ?>rank-icon/rank3_5.png'},
		{name:'Archon',val:2650,img:'<?php  echo $img_path; ?>rank-icon/rank4_1.png'},
		{name:'Archon',val:2800,img:'<?php  echo $img_path; ?>rank-icon/rank4_2.png'},
		{name:'Archon',val:2950,img:'<?php  echo $img_path; ?>rank-icon/rank4_3.png'},
		{name:'Archon',val:3050,img:'<?php  echo $img_path; ?>rank-icon/rank4_4.png'},
		{name:'Archon',val:3200,img:'<?php  echo $img_path; ?>rank-icon/rank4_5.png'},
		{name:'Legend',val:3350,img:'<?php  echo $img_path; ?>rank-icon/rank5_1.png'},
		{name:'Legend',val:3550,img:'<?php  echo $img_path; ?>rank-icon/rank5_2.png'},
		{name:'Legend',val:3750,img:'<?php  echo $img_path; ?>rank-icon/rank5_3.png'},
		{name:'Legend',val:3900,img:'<?php  echo $img_path; ?>rank-icon/rank5_4.png'},
		{name:'Legend',val:4050,img:'<?php  echo $img_path; ?>rank-icon/rank5_5.png'},
		{name:'Ancient',val:4250,img:'<?php  echo $img_path; ?>rank-icon/rank6_1.png'},
		{name:'Ancient',val:4400,img:'<?php  echo $img_path; ?>rank-icon/rank6_2.png'},
		{name:'Ancient',val:4650,img:'<?php  echo $img_path; ?>rank-icon/rank6_3.png'},
		{name:'Ancient',val:4800,img:'<?php  echo $img_path; ?>rank-icon/rank6_4.png'},
		{name:'Ancient',val:4950,img:'<?php  echo $img_path; ?>rank-icon/rank6_5.png'},
		{name:'Divine',val:5100,img:'<?php  echo $img_path; ?>rank-icon/rank7_1.png'},
		{name:'Divine',val:5350,img:'<?php  echo $img_path; ?>rank-icon/rank7_2.png'},
		{name:'Divine',val:5500,img:'<?php  echo $img_path; ?>rank-icon/rank7_3.png'},
		{name:'Divine',val:5650,img:'<?php  echo $img_path; ?>rank-icon/rank7_4.png'},
		{name:'Divine',val:5800,img:'<?php  echo $img_path; ?>rank-icon/rank7_5.png'},
		{name:'SuperMan',val:10000,img:'<?php  echo $img_path; ?>rank-icon/rank8_0.png'},
			];
var imgDecorator = function(
		classUnderStr,//класс  над которым   рисуем
		classWithPriceStr, // класс с ценой, на который вешается наблюдатель, с помощью которого отслеживается цена
		timeForShow,//время,   сколько времени показывать
		table//опорный массив с данными
		 
		){
	let elementStyle = 'position: absolute;top: 50px;right: 0px;';
	let classUnderNode = document.querySelector(classUnderStr);
	let classWithPriceNode = document.querySelector(classWithPriceStr);
	//let price = classWithPriceNode.innerHTML;
	let anElement = '';
	let config = { attributes: true, childList: true, subtree: true };
	
	
	let handler = function(mutationsList, observer){
		for(var mutation of mutationsList) {
	        if (mutation.type == 'childList') {
	        	
	        }
	        else if (mutation.type == 'attributes') {
	        	
	        	let theSpan = document.createElement("span"); 
	        	let price = classWithPriceNode.innerText.replace(/\W+/g, '');
	        	if (price==""){
	        	price = classWithPriceNode.textContent.replace(/\W+/g, '');
		        };
				theSpan.innerText = price
				let found = table.find((val)=>{return val['val']>price;});
				theSpan.innerHTML= '<img width="80px"  src = "'+found['img']+'"></img>';
				theSpan.style = elementStyle;
				classUnderNode.appendChild(theSpan);
				
	        }
	    }
			
			
		}
	var observer = new MutationObserver(handler);
	observer.observe(classWithPriceNode, config);
		
};
window.onload = function(){ 
imgDecorator('.irs-from','.irs-from',100,arrayWidth);
imgDecorator('.irs-to','.irs-to',100,arrayWidth);}




</script>
</div>
 <?php echo $content_top; ?>
 <?php echo $content_bottom; ?>
 <?php echo $column_right; ?>
<?php echo $footer; ?>