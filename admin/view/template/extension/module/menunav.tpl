<?php echo $header; ?>
<?php echo $column_left; ?>

<div id="content">

	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-popup" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
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
                <td class="text-left">                  <a href="http://demo.opencart.my/cmenu2/admin/index.php?route=extension/module/myoccmenu&amp;token=Rj1LF5o4OVM67P8WUdJU7L2hvQWxfGXF&amp;sort=cd.name&amp;order=DESC" class="asc">Name</a>
                  </td>
                <td class="text-right">                  <a href="http://demo.opencart.my/cmenu2/admin/index.php?route=extension/module/myoccmenu&amp;token=Rj1LF5o4OVM67P8WUdJU7L2hvQWxfGXF&amp;sort=c.sort_order&amp;order=DESC">Sort Order</a>
                  </td>
                <td class="text-right">Status</td>
                <td class="text-right">Action</td>
              </tr>
            </thead>
            <tbody>
            <?php foreach ($menunav_custom_data as $k=>$v):?>
             <tr>
                <td class="text-left"><?php echo $v['link_name'];?></td>
                <td class="text-right"><input type="text" name="cmenu[<?php echo $k;?>][sort_order]" value="<?php echo $v['sort_order'];?>" size="4" class="form-control"></td>
                <td class="text-right">Enabled</td>
                <td class="text-right"><a href="http://demo.opencart.my/cmenu2/admin/index.php?route=extension/module/myoccmenu/edit&amp;token=Rj1LF5o4OVM67P8WUdJU7L2hvQWxfGXF&amp;cmenu_id=1" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Edit"><i class="fa fa-pencil"></i></a></td>
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
<?php echo $footer; ?>