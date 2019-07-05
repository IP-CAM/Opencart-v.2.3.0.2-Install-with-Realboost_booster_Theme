<?php echo $header; ?>
<?php echo $column_left; ?>

<div id="content">

	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-popup" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
				<button type="button" data-toggle="tooltip" title="" class="btn btn-danger" onclick="confirm('Данное действие необратимо. Вы уверены?') ? RemoveBlocks() : false;" data-original-title="Удалить"><i class="fa fa-trash-o"></i></button>
				<a onclick="AddBlock();" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Добавить"><i class="fa fa-plus"></i></a>
			</div>
			<h1><?php echo $heading_title; ?></h1>

			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>


	<div class="container-fluid">
		<?php if ($error_warning) { ?>
			<div class="alert alert-danger">
				<i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>

        <?php if ($success) { ?>
            <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
			</div>

			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-popup" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-status"><?php echo $t_status; ?></label>
						<div class="col-sm-10">
							<select name="menunav_status" id="input-status" class="form-control">
								<?php if ($menunav_status) { ?>
									<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
									<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
									<option value="1"><?php echo $text_enabled; ?></option>
									<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
							
						</div>
						<br/>
						<label style = "margin-top: 10px;" class="col-sm-2 control-label" for="input-override"><?php echo $t_override; ?></label>
						<div style = "margin-top: 10px;"  class="col-sm-10">
							<select name="menunav_override" id="input-override" class="form-control">
								<?php 
								    $i=0;
								    foreach ($menunav_override_values as $key=>$val){?>
								    <option value="<?php echo $key;?>" <?php echo  ($menunav_override == $key)?"selected":""; ?>><?php echo $val; ?></option>
								    <?php } ?>
															
							</select>
							
						</div>
			    	    <table class="table table-bordered table-hover">
            <thead>
              <tr>
              	<td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);"></td>
                <td class="text-left">Name</td>
                <td class="text-left">Id</td>
                <td class="text-left">ParentID(Name)</td>
                <td class="text-left">RealPath</td>
                <td class="text-left">SeoPath</td>
                <td class="text-right">Sort Order</a>
                  </td>
                <td class="text-right">Status</td>
              </tr>
            </thead>
            <tbody>
            <?php foreach ($menunav_custom_data as $k=>$v):?>
             <tr style = " opacity: 1; -webkit-transition: opacity 1000ms linear; transition: all 1000ms linear;">
             	<td class="text-center"><input type="checkbox" name="selected[]" value="<?php echo $v['link_id'];?>"> </td>
                <td class="text-right"><input type="text" name="arr_menu[<?php echo $k;?>][link_name]" value="<?php echo $v['link_name'];?>" size="4" class="form-control"></td>
                <td class="text-right"><input type="text" name="arr_menu[<?php echo $k;?>][link_id]" value="<?php echo $v['link_id'];?>" size="4" class="form-control"></td>
                <td class="text-right"><input type="text" name="arr_menu[<?php echo $k;?>][parent_id]" value="<?php echo $v['parent_id'];?>" size="4" class="form-control"><p>(<?php echo $v['parent_name']; ?> )</p></td>
                <td class="text-right"><input type="text" name="arr_menu[<?php echo $k;?>][link_realpath]" value="<?php echo $v['link_realpath'];?>" size="4" class="form-control"></td>
                <td class="text-right"><input type="text" name="arr_menu[<?php echo $k;?>][link_seo]" value="<?php echo $v['link_seo'];?>" size="4" class="form-control"></td>
                <td class="text-right"><input type="text" name="arr_menu[<?php echo $k;?>][sort_order]" value="<?php echo $v['sort_order'];?>" size="4" class="form-control"></td>
                <td class="text-right">Enabled</td>
                
              </tr>
            <?php endforeach;?>  
             
            </tbody>
          </table>
					</div>
					
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function RemoveBlocks(){
	var selected = document.getElementsByName('selected[]');
	
	selected.forEach(function(element) {
		  if (element.checked){
			  let el = element.parentNode.parentNode;
			  el.style.opacity = '0';
			  setTimeout(function(){el.remove();}, 1000);
			  
			  }
	});

}

function AddBlock(){
	var ii =0;
	var selected = document.querySelector('#form-popup > div > table > tbody');
	let str = ' <tr style = " opacity: 1; -webkit-transition: opacity 1000ms linear; transition: all 1000ms linear;"><td class="text-center"><input type="checkbox" name="selected[]" value=""> </td>'+
    '<td class="text-right"><input type="text" name="arr_menu[<?php echo $menunav_maxval;?>+ii][link_name]" value="" size="4" class="form-control"></td>'+
    '<td class="text-right"><input type="text" name="arr_menu[<?php echo $menunav_maxval;?>+ii][link_id]" value="" size="4" class="form-control"></td>'+
    '<td class="text-right"><input type="text" name="arr_menu[<?php echo $menunav_maxval;?>+ii][parent_id]" value="0" size="4" class="form-control"><p>(главная )</p></td>'+
    '<td class="text-right"><input type="text" name="arr_menu[<?php echo $menunav_maxval;?>+ii][link_realpath]" value="" size="4" class="form-control"></td>'+
    '<td class="text-right"><input type="text" name="arr_menu[<?php echo $menunav_maxval;?>+ii][link_seo]" value="" size="4" class="form-control"></td>'+
    '<td class="text-right"><input type="text" name="arr_menu[<?php echo $menunav_maxval;?>+ii][sort_order]" value="" size="4" class="form-control"></td>'+
    '<td class="text-right">Enabled</td></tr>';
    console.log(str);
    selected.innerHTML =selected.innerHTML+str ;
   ii++;
	

}

</script>
<style>

.animate
{
    height: 0px;//or anything you need
    transition: height 1s;
}


</style>
<?php echo $footer; ?>