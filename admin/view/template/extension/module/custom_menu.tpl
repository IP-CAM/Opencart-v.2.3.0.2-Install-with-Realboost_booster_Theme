<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<style type="text/css">
html
{
  overflow-y: scroll;
}
#content,
#content .form-control,
#content .btn,
#content .input-group-addon
{
  font-size: 11px;
}
#content .fa + span
{
  margin-left: 8px;
}
.form-control,
.btn
{
  height: 34px;
}
.form-group
{
  padding-top: 12px;
  padding-bottom: 12px;
}
.nav a
{
  outline: none;
}
input[type='radio'],
input[type='checkbox']
{
  margin: 0 5px 3px 0;
}
.form-horizontal input
{
  vertical-align: middle;
}
.form-horizontal .checkbox,
.form-horizontal .radio
{
  min-height: 18px;
  padding: 0;
}
.form-horizontal .well
{
  overflow: auto;

  min-height: 75px;
  margin-bottom: 0;

  background-color: #fafafa;
}
.form-horizontal textarea
{
  min-height: 80px;
}
.form-horizontal .well .checkbox,
.form-horizontal .well .radio
{
  margin-top: 4px;
}
.form-horizontal .well .fa
{
  margin-right: 7px;
}
.form-horizontal .checkbox-inline
{
  min-height: 18px;
  margin-bottom: 9px;
  padding-left: 24px;
}
.radio label,
.checkbox label
{
  padding-left: 24px;
}
.control-label
{
  font-weight: normal;
}
.input-group + .input-group
{
  margin-top: 15px;
}
label.btn-default.active,
label.btn-default.active:hover
{
  color: #fff;
  border-color: #1978ab;
  background-color: #1e91cf;
}
label.btn-default:hover
{
  color: #555;
  border-color: #ccc;
  background-color: #f7f7f7;
}
label.btn-default:active,
label.btn-default:active:hover
{
  color: #555;
  border-color: #ccc;
  background-color: #f7f7f7;
}

/*ITEM LIST*/
.cm
{
  position: relative;

  margin: 0;
  padding: 0;
}
.cm-list
{
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  width: 100%;
  margin: 0;
  padding: 0;

  list-style: none;
}
.cm-list .cm-list
{
  padding-left: 2.5em;
}
.cm-item-blueprint
{
  display: none;
}
.cm-new-item
{
  font-size: 12px;
  line-height: 1.42857;

  display: inline-block;

  padding: 8px 13px;

  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  text-align: center;
  vertical-align: middle;
  white-space: nowrap;

  color: #fff;
  border: 1px solid #459c45;
  border-radius: 3px;
  outline: none;
  background: #5cb85c;
  text-shadow: 1px 1px #4cae4c;

  touch-action: manipulation;
}
.cm-new-item:hover
{
  border-color: #459c45;
  background-color: #51b251;
}
.cm-edit-box
{
  position: relative;

  display: none;
}
.cm-collapsed .cm-list
{
  display: none;
}
.cm-item,
.cm-empty,
.cm-placeholder
{
  line-height: 1.618em;

  position: relative;

  display: block;
  float: none;

  margin: 0;
  padding: 0;

  border: none;
  background: transparent;
  text-shadow: 0 1px 0 #fff;
}
.cm-handle
{
  display: block;

  -moz-box-sizing: border-box;
  box-sizing: border-box;
  margin: 5px 0;
  padding: 8px 10px;

  cursor: move;

  -webkit-border-radius: 3px;
  border-radius: 3px;
}
.cm-handle:hover
{
  color: #2ea8e5;
  background: #fff;
}
.cm-item > button
{
  font-size: 14px;
  line-height: 1;

  position: relative;

  display: inline-block;
  float: left;
  overflow: hidden;

  width: 24px;
  height: 26px;
  margin: 5px 5px 5px 36px;
  padding: 0;

  cursor: pointer;
  text-align: center;
  white-space: nowrap;

  color: #999;
  border: 0;
  outline: none;
  background: transparent;
}
.cm-item .cm-button-container button
{
  padding: 4px 8px;

  cursor: pointer;

  border: 1px solid transparent;
  border-radius: 2px;
  outline: none;
  background: transparent;
}
.cm-item > button:before
{
  position: absolute;

  display: block;

  width: 100%;

  text-align: center;
  text-indent: 0;
}
.cm-item .cm-button-container button:hover,
.cm-item .cm-button-container button.active,
.cm-item .cm-button-container button.open
{
  border: 1px solid #ddd;
  background: #fff;
}
.cm-item .cm-button-container .item-add:hover
{
  color: #5cb85c;
}
.cm-item .cm-button-container .item-edit:hover,
.cm-item .cm-button-container .item-edit.open
{
  color: #2aabd2;
}
.cm-item .cm-button-container .item-remove:hover
{
  color: #d9534f;
}
.cm-item .cm-button-container .item-remove-confirm,
.cm-item .cm-button-container .item-remove-confirm:hover
{
  transition: background-color .5s;

  color: #fff;
  background-color: #d9534f;
}
.cm-item .cm-button-container
{
  position: absolute;
  top: 4px;
  right: 0;

  overflow: visible;

  padding: 0 4px;
}
.cm-placeholder,
.cm-empty
{
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  min-height: 30px;
  margin: 5px 0;
  padding: 0;

  border: 1px dashed #6c9ab1;
  background: #d6f2ff;
}
.cm-empty
{
  min-height: 100px;

  border: 1px dashed #bbb;
  background-color: #e5e5e5;
  background-position: 0 0, 30px 30px;
  background-size: 60px 60px;
}
.cm-dragel
{
  position: absolute;
  z-index: 9999;

  height: 60px;

  pointer-events: none;
}
.cm-dragel > .cm-item .cm-handle
{
  margin-top: 0;
}
.cm-dragel .cm-handle
{
  -webkit-box-shadow: 2px 4px 6px 0 rgba(0, 0, 0, .1);
  box-shadow: 2px 4px 6px 0 rgba(0, 0, 0, .1);
}
.cm3-content
{
  font-weight: bold;

  display: block;

  -moz-box-sizing: border-box;
  box-sizing: border-box;
  height: 100%;
  margin: 3px 0;
  padding: 8px 10px 8px 40px;

  text-decoration: none;

  border: 1px solid #ddd;
  -webkit-border-radius: 3px;
  border-radius: 3px;
  background: #fff;
}
.cm3-content:hover
{
  background: #f7f7f7;
}
.cm-dragel > .cm3-item > .cm3-content
{
  margin: 0;
}
.cm3-handle
{
  position: absolute;
  top: 0;
  left: 0;

  overflow: hidden;

  width: 30px;
  margin: 0;

  cursor: move;
  white-space: nowrap;
  text-indent: 100%;

  border: 1px solid #777;
  border-top-right-radius: 0;
  border-bottom-right-radius: 0;
  background: #777;
  text-shadow: 0 1px 0 #777;
}
.cm3-handle:before
{
  font-size: 20px;
  font-weight: normal;

  position: absolute;
  top: 6px;
  left: 0;

  display: block;

  width: 100%;

  content: '\2263';
  text-align: center;
  text-indent: 0;

  color: #fff;
}
.cm3-handle:hover
{
  background: #555;
}
.options-panel
{
  margin-bottom: 20px;
  padding: 15px;

  border: 1px solid #ddd;
  background-color: #fafafa;
}
.options-panel:before,
.options-panel:after
{
  display: table;

  content: ' ';
}
.options-panel:after
{
  clear: both;
}
.note-editor
{
  background: #fff;
}
</style>

  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <?php if ($apply_btn) { ?>
        <a onclick="$('#apply').val('1'); $('#cm-form').submit();" class="btn btn-success" data-toggle="tooltip" title="<?php echo $button_apply; ?>" role="button"><i class="fa fa-check"></i> <span class="hidden-sm"> <?php echo $button_apply; ?></span></a>
        <?php } ?>
        <button type="submit" form="cm-form" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i> <span class="hidden-sm"> <?php echo $button_save; ?></span></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil-square-o"></i>
        <?php echo $text_edit; ?>
        <?php if (!empty($name)) { ?>
        <?php echo '"'. $name .'"'; ?>
        <?php } ?>
        </h3>
        <?php if ($success) { ?>
        <div class="cm-apply text-success pull-right"><i class="fa fa-check"></i> <?php echo $success; ?></div>
        <?php } ?>
        <?php if ($error_name) { ?>
        <div class="text-danger pull-right"><?php echo $error_name; ?></div>
        <?php } ?>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="cm-form" class="form-horizontal">
          <ul id="settingTab" class="nav nav-tabs" role="tablist">
            <li><a href="#tab-module-setting" role="tab" data-toggle="tab"><i class="fa fa-puzzle-piece" aria-hidden="true"></i><span><?php echo $tab_setting; ?></span></a></li>
            <li><a href="#tab-menu-options" role="tab" data-toggle="tab"><i class="fa fa-cog" aria-hidden="true"></i><span><?php echo $tab_menu_options; ?></span></a></li>
            <li><a href="#tab-menu-structure" role="tab" data-toggle="tab"><i class="fa fa-bars" aria-hidden="true"></i><span><?php echo $tab_menu_structure; ?></span></a></li>
          </ul>
          <div class="tab-content">
            <div id="tab-module-setting" class="tab-pane">
              <div class="row">
                <div class="col-lg-6">
                  <div class="form-group required">
                    <label class="col-sm-4 control-label"><?php echo $entry_name; ?></label>
                    <div class="col-sm-8">
                      <input type="text" name="name" value="<?php echo $name; ?>" class="form-control" />
                      <?php if ($error_name) { ?>
                      <div class="text-danger"><?php echo $error_name; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-4 control-label"><?php echo $entry_status; ?></label>
                    <div class="col-sm-8">
                      <div class="btn-group btn-group-justified" data-toggle="buttons">
                        <label class="btn btn-default">
                          <input type="radio" name="status" value="1" <?php echo isset($status) ? 'checked="checked"' : ''; ?> />
                          <?php echo $text_enabled; ?> </label>
                        <label class="btn btn-default">
                          <input type="radio" name="status" value="0" <?php echo empty($status) ? 'checked="checked"' : ''; ?> />
                          <?php echo $text_disabled; ?> </label>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-4 control-label"><?php echo $entry_box_class; ?></label>
                    <div class="col-sm-8">
                      <input type="text" name="custom_menu[box_class]" value="<?php echo !empty($custom_menu['box_class']) ? $custom_menu['box_class'] : 'panel panel-default'; ?>" class="form-control" />
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-4 control-label"><?php echo $entry_title_class; ?></label>
                    <div class="col-sm-8">
                      <input type="text" name="custom_menu[title_class]" value="<?php echo !empty($custom_menu['title_class']) ? $custom_menu['title_class'] : 'panel-heading'; ?>" class="form-control" />
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-4 control-label"><?php echo $entry_content_class; ?></label>
                    <div class="col-sm-8">
                      <input type="text" name="custom_menu[content_class]" value="<?php echo isset($custom_menu['content_class']) ? $custom_menu['content_class'] : 'menu-body'; ?>" class="form-control" />
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-4 control-label"><?php echo $entry_css; ?></label>
                    <div class="col-sm-8">
                      <select name="custom_menu[style_status]" class="form-control">
                        <?php if (!empty($custom_menu['style_status'])) { ?>
                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                        <option value="0"><?php echo $text_disabled; ?></option>
                        <?php } else { ?>
                        <option value="1"><?php echo $text_enabled; ?></option>
                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                        <?php } ?>
                      </select>
                      <textarea  name="style" class="form-control"><?php echo $style; ?></textarea>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6">
                  <div class="form-group">
                    <label class="col-sm-4 control-label"><?php echo $entry_store; ?></label>
                    <div class="col-sm-8">
                      <div class="well well-sm">
                        <div class="checkbox">
                          <label>
                            <input type="checkbox" name="custom_menu[store_id][]" value="0" <?php echo isset($custom_menu['store_id']) && in_array(0, $custom_menu['store_id']) ? 'checked="checked" ' : ''; ?> />
                            <?php echo $default_store; ?>
                          </label>
                        </div>
                        <?php foreach ($stores as $store) { ?>
                        <div class="checkbox">
                          <label>
                            <input type="checkbox" name="custom_menu[store_id][]" value="<?php echo $store['store_id']; ?>" <?php echo isset($custom_menu['store_id']) && in_array($store['store_id'], $custom_menu['store_id']) ? 'checked="checked" ' : ''; ?> />
                            <?php echo $store['name']; ?>
                          </label>
                        </div>
                        <?php } ?>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-4 control-label"><span data-toggle="tooltip" title="<?php echo $help_categories; ?>"><?php echo $entry_categories; ?></span></label>
                    <div class="col-sm-8">
                      <input type="text" name="custom_menu[fcid]" value="" placeholder="<?php echo $text_cat_select; ?>" class="form-control" />
                      <div id="cat-loc" class="well well-sm" style="max-height:230px;">
                        <div class="checkbox">
                          <label>
                            <input type="checkbox" name="custom_menu[allcats]" value="1" <?php echo isset($custom_menu['allcats']) ? 'checked="checked"' : ''; ?> />
                            <?php echo $text_allcats; ?> </label>
                        </div>
                        <?php foreach ($catlocs as $category) { ?>
                        <div id="cat-loc-<?php echo $category['category_id']; ?>" style="margin: 2px 6px;"><i class="fa fa-minus-circle"></i> <?php echo $category['name']; ?>
                          <input type="hidden" name="custom_menu[fcid][]" value="<?php echo $category['category_id']; ?>" />
                        </div>
                        <?php } ?>
                      </div>
                      <select name="custom_menu[cat_invert]" class="form-control" style="margin-top: -1px">
                        <?php if ($custom_menu['cat_invert']) { ?>
                        <option value="1" selected="selected"><?php echo $text_show; ?></option>
                        <option value="0"><?php echo $text_hide; ?></option>
                        <?php } else { ?>
                        <option value="1"><?php echo $text_show; ?></option>
                        <option value="0" selected="selected"><?php echo $text_hide; ?></option>
                        <?php } ?>
                      </select>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-4 control-label"><span data-toggle="tooltip" title="<?php echo $help_products; ?>"><?php echo $entry_products; ?></span></label>
                    <div class="col-sm-8">
                      <input type="text" name="custom_menu[fpid]" value="" placeholder="<?php echo $text_prod_select; ?>" class="form-control" />
                      <div id="prod-loc" class="well well-sm" style="max-height:230px;">
                        <div class="checkbox">
                          <label>
                            <input type="checkbox" name="custom_menu[allprods]" value="1" <?php echo isset($custom_menu['allprods']) ? 'checked="checked"' : ''; ?> />
                            <?php echo $text_allprods; ?> </label>
                        </div>
                        <?php foreach ($prodlocs as $product) { ?>
                        <div id="prod-loc-<?php echo $product['product_id']; ?>" style="margin: 2px 6px;"><i class="fa fa-minus-circle"></i> <?php echo $product['name']; ?>
                          <input type="hidden" name="custom_menu[fpid][]" value="<?php echo $product['product_id']; ?>" />
                        </div>
                        <?php } ?>
                      </div>
                      <select name="custom_menu[prod_invert]" class="form-control" style="margin-top: -1px">
                        <?php if ($custom_menu['prod_invert']) { ?>
                        <option value="1" selected="selected"><?php echo $text_show; ?></option>
                        <option value="0"><?php echo $text_hide; ?></option>
                        <?php } else { ?>
                        <option value="1"><?php echo $text_show; ?></option>
                        <option value="0" selected="selected"><?php echo $text_hide; ?></option>
                        <?php } ?>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div id="tab-menu-options" class="tab-pane">
              <div class="row">
                <div class="col-lg-6">
                  <div class="form-group">
                    <label class="col-sm-4 control-label"><span data-toggle="tooltip" title="<?php echo $help_html; ?>"><?php echo $entry_title; ?></span></label>
                    <div class="col-sm-8">
                      <?php foreach ($languages as $language) { ?>
                      <div class="input-group"> <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                        <input type="text" name="custom_menu[<?php echo $language['language_id']; ?>][title]" value='<?php echo isset($custom_menu[$language['language_id']]['title']) ? $custom_menu[$language['language_id']]['title'] : '<h3 class="panel-title">Menu title</h3>'; ?>' class="form-control" />
                        <span class="input-group-btn" data-toggle="buttons">
                          <label class="btn btn-default">
                          <input type="checkbox" name="custom_menu[<?php echo $language['language_id']; ?>][title_status]" value="1" <?php echo isset($custom_menu[$language['language_id']]['title_status']) ? 'checked="checked"' : ''; ?> onchange="if ($(this).prop('checked')) { $(this).parent().find('span').html('<i class=\'fa fa-check\' aria-hidden=\'true\'></i>');} else { $(this).parent().find('span').html('<i class=\'fa fa-times\' aria-hidden=\'true\'></i>');}" />
                          <span><?php echo isset($custom_menu[$language['language_id']]['title_status']) ? '<i class="fa fa-check" aria-hidden="true"></i>' : '<i class="fa fa-times" aria-hidden="true"></i>'; ?></span>
                          </label>
                        </span>
                      </div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-4 control-label"><?php echo $entry_menu_design; ?></label>
                    <div class="col-sm-8">
                      <select name="custom_menu[menu_design]" class="form-control" onchange="if ($(this).val()=='am') {$('#accordion-config').show(); $('#flyout-config').hide();} else if ($(this).val()=='fm') {$('#flyout-config').show(); $('#accordion-config').hide();} else {$('#accordion-config,#flyout-config').hide();}">
                        <?php if (isset($custom_menu['menu_design']) && $custom_menu['menu_design'] == 'am') { ?>
                        <option value="am" selected="selected"><?php echo $text_am; ?></option>
                        <?php } else { ?>
                        <option value="am"><?php echo $text_am; ?></option>
                        <?php } ?>
                        <?php if (isset($custom_menu['menu_design']) && $custom_menu['menu_design'] == 'fm') { ?>
                        <option value="fm" selected="selected"><?php echo $text_fm; ?></option>
                        <?php } else { ?>
                        <option value="fm"><?php echo $text_fm; ?></option>
                        <?php } ?>
                        <?php if (isset($custom_menu['menu_design']) && $custom_menu['menu_design'] == 'pm') { ?>
                        <option value="pm" selected="selected"><?php echo $text_pm; ?></option>
                        <?php } else { ?>
                        <option value="pm"><?php echo $text_pm; ?></option>
                        <?php } ?>
                      </select>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-4 control-label"><?php echo $entry_view; ?></label>
                    <div class="col-sm-8">
                      <select name="custom_menu[minimized]" class="form-control">
                        <?php if (!empty($custom_menu['minimized'])) { ?>
                        <option value="1" selected="selected"><?php echo $text_minimized; ?></option>
                        <option value="0"><?php echo $text_expanded; ?></option>
                        <?php } else { ?>
                        <option value="1"><?php echo $text_minimized; ?></option>
                        <option value="0" selected="selected"><?php echo $text_expanded; ?></option>
                        <?php } ?>
                      </select>
                      <div class="checkbox">
                        <label style="margin-top:12px;">
                          <input type="checkbox" name="custom_menu[save_view]" value="1" <?php echo isset($custom_menu['save_view']) ? 'checked="checked"' : ''; ?> />
                          <?php echo $text_keep; ?> </label>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-4 control-label"><?php echo $entry_icons; ?></label>
                    <div class="col-sm-8">
                      <select name="custom_menu[icon]" class="form-control">
                        <?php if (!empty($custom_menu['icon'])) { ?>
                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                        <option value="0"><?php echo $text_disabled; ?></option>
                        <?php } else { ?>
                        <option value="1"><?php echo $text_enabled; ?></option>
                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                        <?php } ?>
                      </select>
                    </div>
                  </div>
                  <div id="accordion-config" <?php echo empty($custom_menu['menu_design']) || $custom_menu['menu_design'] == 'am' ? '' : 'style="display:none;"'; ?>>
                    <div class="form-group" style="border-top: 1px solid #ededed;">
                      <label class="col-sm-4 control-label"><?php echo $entry_toggle; ?></label>
                      <div class="col-sm-8">
                        <select name="custom_menu[toggle]" class="form-control">
                          <?php if (!empty($custom_menu['toggle'])) { ?>
                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                          <option value="0"><?php echo $text_disabled; ?></option>
                          <?php } else { ?>
                          <option value="1"><?php echo $text_enabled; ?></option>
                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                          <?php } ?>
                        </select>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6"></div>
              </div>
            </div>
            <div id="tab-menu-structure" class="tab-pane">
              <div class="row">
                <div class="col-lg-6">
                  <div id="items" class="cm">
                    <div class="row">
                      <div class="col-sm-6 col-md-7">
                      <button type="button" class="cm-new-item btn-block"> <strong><?php echo $button_new; ?></strong></button>
                      </div>
                      <div class="col-sm-6 col-md-5 text-right">
                        <button type="button" class="btn btn-default" data-action="expand-all"><?php echo $button_expand; ?></button>
                        <button type="button" class="btn btn-default" data-action="collapse-all"><?php echo $button_collapse; ?></button>
                      </div>
                    </div>
                    <br>
                    <li class="cm-item-blueprint">
                      <button type="button" class="collapse" data-action="collapse" type="button" style="display: none;"><i class="fa fa-minus"></i></button>
                      <button type="button" class="expand" data-action="expand" type="button" style="display: none;"><i class="fa fa-plus"></i></button>
                      <div class="item-wrapper">
                        <div class="cm-handle cm3-handle">&nbsp;</div>
                        <div class="cm3-content">
                          <span class="item-name">[item_name]</span>
                          <div class="cm-button-container">
                            <button type="button" class="item-edit"><i class="fa fa-pencil" aria-hidden="true"></i></button>
                            <button type="button" class="item-add"><i class="fa fa-plus" aria-hidden="true"></i></button>
                            <button type="button" class="item-remove" data-confirm-class="item-remove-confirm"><i class="fa fa-times" aria-hidden="true"></i></button>
                          </div>
                        </div>
                      </div>
                      <div class="cm-edit-box">
                        <div class="options-panel">
                          <ul class="lang-nav nav nav-tabs">
                            <?php foreach ($languages as $language) { ?>
                            <li><a href="#lang-<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                            <?php } ?>
                          </ul>
                          <div class="tab-content">
                            <?php foreach ($languages as $language) { ?>
                            <div class="tab-pane" id="lang-<?php echo $language['language_id']; ?>">
                              <div>
                                <label><?php echo $entry_iname; ?></label>
                                <textarea  name="iname<?php echo $language['language_id']; ?>" data-default-value="<?php echo $text_item ?>" class="item-content form-control" rows="3"></textarea>
                                <br>
                              </div>
                              <div class="row">
                                <div class="col-sm-7">
                                  <label><?php echo $entry_iurl; ?></label>
                                  <div class="input-group"> <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                  <input type="text" name="iurl<?php echo $language['language_id']; ?>" value="" class="form-control" />
                                  </div>
                                </div>
                                <div class="col-sm-5">
                                  <label><?php echo $entry_itarget; ?></label>
                                  <div class="input-group"> <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                    <select name="itarget<?php echo $language['language_id']; ?>" class="form-control">
                                      <option value="_self" selected="selected">_self</option>
                                      <option value="_blank">_blank</option>
                                    </select>
                                  </div>
                                </div>
                              </div>
                              <br>
                              <div class="row">
                                <div class="col-sm-7">
                                  <label><?php echo $entry_iicon; ?></label>
                                  <div class="row">
                                    <div class="col-sm-6">
                                      <div class="input-group"> <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                        <select name="icontype<?php echo $language['language_id']; ?>" class="form-control" onchange="if($(this).val() == 'html') {$(this).parent().parent().parent().find('.html-icon-<?php echo $language['language_id']; ?>').show().next().hide();} else {$(this).parent().parent().parent().find('.html-icon-<?php echo $language['language_id']; ?>').hide().next().show();}">
                                          <option value="html" selected="selected">html</option>
                                          <option value="image">image</option>
                                        </select>
                                      </div>
                                    </div>
                                    <div class="col-sm-6 html-icon-<?php echo $language['language_id']; ?>">
                                      <input type="text" name="htmlicon<?php echo $language['language_id']; ?>" class="form-control" />
                                    </div>
                                    <div class="col-sm-6 img-icon-<?php echo $language['language_id']; ?>" style="display: none;">
                                      <a href="" data-toggle="image" class="img-upload-<?php echo $language['language_id']; ?>">
                                        <img src="../image/no_image.png" alt="" style="height:32px" class="img-thumbnail" />
                                      </a>
                                      <input type="hidden" name="iicon<?php echo $language['language_id']; ?>" />
                                    </div>
                                  </div>
                                </div>
                                <div class="col-sm-5">
                                  <label><?php echo $entry_iclass; ?></label>
                                  <div class="input-group"> <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span>
                                  <input type="text" name="iclass<?php echo $language['language_id']; ?>" class="form-control" />
                                  </div>
                                </div>
                             </div>
                           </div>
                           <?php } ?>
                         </div>
                         <hr>
                         <button type="button" class="item-edit btn btn-default"><?php echo $button_cancel; ?></button>
                         <button type="button" class="end-edit btn btn-primary pull-right"><?php echo $button_save; ?></button>
                       </div>
                     </div>
                   </li>
                   <ol class="cm-list"></ol>
                 </div>
                 <div><input type="hidden" name="output" id="output" value="" /></div>
                </div>
              </div>
            </div>
          </div>
          <input type="hidden" name="apply" id="apply" value="0" />
        </form>
      </div>
    </div>
    <div class="footer">
      <ul class="list-inline pull-right">
        <li><a href="mailto:info@idiy.club"><?php echo $text_support; ?></a></li>
        <li><a href="<?php echo $text_author_link; ?>" onclick="return !window.open(this.href)"><?php echo $text_more; ?></a></li>
      </ul>
      <p>2016 © <?php echo $text_author; ?> <a href="<?php echo $text_author_link; ?>" onclick="return !window.open(this.href)">iDiY</a>. <?php echo $heading_title; ?> <?php echo $version; ?></p>
    </div>
  </div>

  <script type="text/javascript"><!--
    $('.lang-nav a:first').tab('show');
    $('.cm-apply').delay(5000).fadeOut(300);

    $('input[name=\'custom_menu[fcid]\']').autocomplete({
      source: function(request, response) {
        $.ajax({
          url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
          dataType: 'json',
          success: function(json) {
            response($.map(json, function(item) {
              return {
                label: item['name'],
                value: item['category_id']
              }
            }));
          }
        });
      },
      select: function(item) {
        $('input[name=\'custom_menu[fcid]\']').val('');
        $('#cat-loc-' + item['value']).remove();
        $('#cat-loc').append('<div id="cat-loc-' + item['value'] + '" style="margin: 2px 6px;"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="custom_menu[fcid][]" value="' + item['value'] + '" /></div>');
      }
    });

    $('#cat-loc').delegate('.fa-minus-circle', 'click', function() {
      $(this).parent().remove();
    });

    $('input[name=\'custom_menu[fpid]\']').autocomplete({
      source: function(request, response) {
        $.ajax({
          url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
          dataType: 'json',
          success: function(json) {
            response($.map(json, function(item) {
              return {
                label: item['name'],
                value: item['product_id']
              }
            }));
          }
        });
      },
      select: function(item) {
        $('input[name=\'custom_menu[fpid]\']').val('');
        $('#prod-loc-' + item['value']).remove();
        $('#prod-loc').append('<div id="prod-loc-' + item['value'] + '" style="margin: 2px 6px;"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="custom_menu[fpid][]" value="' + item['value'] + '" /></div>');  
      }
    });

    $('#prod-loc').delegate('.fa-minus-circle', 'click', function() {
      $(this).parent().remove();
    });

    $('label.btn input').each(function() {
      if ($(this).prop('checked')) {
        $(this).parent('.btn').addClass('active');
      };
    });
  //--></script>
  <script type="text/javascript"><!--
    var $menu = $('#items'), menu = $('#items').domenu(), $jsonOutput = $('#output');
    $menu.domenu({
      maxDepth: 50,
      data: '<?php echo htmlspecialchars_decode(addslashes($output)); ?>'
    })
    .onCreateItem(function(item) {
      var edit = $(item).find('.item-edit');
      edit.click(function() {
        opt(item, edit);
      });

      var id = item.data('id');
      item.find('.lang-nav a').each(function(){
        $(this).attr('href', $(this).attr('href')+'-'+id);
      });
      item.find('.tab-pane').each(function(){
        $(this).attr('id', $(this).attr('id')+'-'+id);
      });

    <?php foreach ($languages as $language) { ?>
      item.find('a.img-upload-<?php echo $language['language_id']; ?>').attr('id', 'icon-<?php echo $language['language_id']; ?>'+'-'+id).next('input').attr('id', 'input-icon-<?php echo $language['language_id']; ?>'+'-'+id);

      var icontype<?php echo $language['language_id']; ?> = item.data('icontype<?php echo $language['language_id']; ?>');
      if (icontype<?php echo $language['language_id']; ?> == 'html') {
        item.find('.html-icon-<?php echo $language['language_id']; ?>').show().next().hide();
      } else {
        item.find('.html-icon-<?php echo $language['language_id']; ?>').hide().next().show();
      }

      var imgicon<?php echo $language['language_id']; ?> = item.data('iicon<?php echo $language['language_id']; ?>');
      if (imgicon<?php echo $language['language_id']; ?>) {
        var src = '../image/'+imgicon<?php echo $language['language_id']; ?>;
        item.find('a.img-upload-<?php echo $language['language_id']; ?> > img').attr('src', src);
      }
    <?php } ?>
    })
    .onItemStartEdit(function(item) {
      <?php foreach ($languages as $language) { ?>
        $(item).find('.img-icon-<?php echo $language['language_id']; ?>').on('click', function(e){
          var target = $(e.target);
          if (target.hasClass('btn-danger')) {
            item.find('a.img-upload-<?php echo $language['language_id']; ?> > img').attr('src','../image/no_image.png');
            item.data('iicon<?php echo $language['language_id']; ?>','');
          }
        });
      <?php } ?>
    })
    .onItemEndEdit(function(item) {
      var input = $(item).find('> .cm-edit-box .form-control');
      $(input).each(function() {
        var val = $(this).val();
        item.data($(this).attr('name'),val);
      });
    })
    .parseJson()
    .on(['onItemCollapsed', 'onItemExpanded', 'onItemAdded', 'onSaveEditBoxInput', 'onItemDrop', 'onItemDrag', 'onItemRemoved', 'onItemEndEdit'], function(a,b,c) {
      $jsonOutput.val(menu.toJson());
    });
    $jsonOutput.val(menu.toJson());

    function opt(item,el) {
      var opt = el.closest('.item-wrapper').next('div');
      el.toggleClass('open')
      opt.slideToggle(300);
    }

    $('#items').on('click', function(e){
      var target = $(e.target),
      action = target.data('action');
      if (action === 'expand-all') {
        menu.expandAll();
      }
      if (action === 'collapse-all') {
        menu.collapseAll();
      }
    });

    <?php if ($module_id) { ?>
    $('#settingTab a').on('click', function(){
      sessionStorage.setItem('activetab<?php echo $module_id; ?>', $(this).attr('href'));
    });
    <?php } ?>
    if (!sessionStorage.getItem('activetab<?php echo $module_id; ?>')) {
      $('#settingTab a:first').tab('show');
    } else {
      $('#settingTab a[href=\'' + sessionStorage.getItem('activetab<?php echo $module_id; ?>') + '\']').tab('show');
    }
  //--></script>
</div>
<?php echo $footer; ?>