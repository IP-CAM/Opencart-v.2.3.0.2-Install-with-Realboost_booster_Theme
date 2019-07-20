<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-w1" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary">
                    <i class="fa fa-save"></i> <?php echo $button_save; ?>
                </button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default">
                    <i class="fa fa-reply"></i> <?php echo $button_cancel; ?>
                </a>
            </div>
            <h1><?php echo $headingTitle; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li>
                        <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                    </li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($errorWarning || !empty($errorPhpVersion)) { ?>
            <div class="alert alert-danger">
                <i class="fa fa-exclamation-circle"></i> <?php echo (!empty($errorPhpVersion) ? $errorPhpVersion : $errorWarning) ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    <i class="fa fa-pencil"></i> <?php echo $titleEdit; ?>
                </h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-pp-express" class="form-horizontal">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab_info" data-toggle="tab"><?php echo $textTabInfo; ?></a></li>
                        <li><a href="#tab_api" data-toggle="tab"><?php echo $textTabApi; ?></a></li>
                        <li><a href="#tab_dop_api" data-toggle="tab"><?php echo $textTabDopApi; ?></a></li>
                        <li><a href="#tab_order_status" data-toggle="tab"><?php echo $textTabStatusOrder; ?></a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab_info">
                            <div class="media">
                                <div class="media-left">
                                  <a href="#">
                                    <img class="media-object" src="/walletone/img/w1_logo.png" alt="Wallet One Единая касса">
                                  </a>
                                  <p>Универсальный платежный агрегатор, предлагающий более 100 способов приема платежей.</p>
                                  <ul class="list-characteristic">
                                      <li><i>&#10004;</i>Быстрое подключение</li>
                                        <li><i>&#10004;</i>Простая интеграция</li>
                                        <li><i>&#10004;</i>Наглядная аналитика</li>
                                        <li><i>&#10004;</i>Круглосуточная служба поддержки</li>
                                  </ul>
                                </div>
                                <div class="media-body">
                                    <blockquote>
                                      <p><span>Быстрая настройка</span></p>
                                      <ul class="list-settings-ul">
                                          <li><div class="circle-fgnghn">1</div><span>Зарегистрироваться в кассе на <a target="_blank" href="https://www.walletone.com/ru/merchant/">сайте</a></span></li>
                                          <li><div class="circle-fgnghn">2</div><span>Заполнить все обязательные поля из раздела "Настройки".</span></li>
                                          <li><div class="circle-fgnghn">3</div><span>Для вывода определенных способов оплаты, заполните поля в разделе "Доп. настройки".</span></li>
                                      </ul>
                                      <ul class="app_links">
                                          <li><a href="https://itunes.apple.com/ru/app/merchant-w1/id925378607?mt=8" class="app_link"></a></li>
                                          <li><a href="https://play.google.com/store/apps/details?id=com.w1.merchant.android" class="app_link __android"></a></li>
                                      </ul>
                                      <div class="clearfix"></div>
                                    </blockquote>
                                </div>
                              </div>
                        </div>
                        <div class="tab-pane" id="tab_api">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="w1Status"><?php echo $textStatus; ?></label>
                                <div class="col-sm-10">
                                  <select name="w1_status" id="ww1_status" class="form-control">
                                    <?php if ($w1_status) { ?>
                                        <option value="1" selected="selected"><?php echo $textEnabled; ?></option>
                                        <option value="0"><?php echo $textDisabled; ?></option>
                                    <?php } 
                                    else { ?>
                                        <option value="1"><?php echo $textEnabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $textDisabled; ?></option>
                                    <?php } ?>
                                  </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="w1GeoZone"><?php echo $textGeoZone; ?></label>
                                <div class="col-sm-10">
                                    <select name="w1GeoZone" id="w1GeoZone" class="form-control">
                                        <option value="0"><?php echo $textAllZones; ?></option>
                                        <?php foreach ($geoZones as $zone) { ?>
                                            <?php if ($zone['geo_zone_id'] == $w1GeoZone) { ?>
                                                <option value="<?php echo $zone['geo_zone_id']; ?>" selected="selected"><?php echo $zone['name']; ?></option>
                                            <?php } else { ?>
                                                <option value="<?php echo $zone['geo_zone_id']; ?>"><?php echo $zone['name']; ?></option>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="w1_sort_order"><?php echo $textSortOrder; ?></label>
                                <div class="col-sm-10">
                                  <input type="text" name="w1_sort_order" value="<?php echo (isset($w1_sort_order) ? $w1_sort_order : '') ?>" 
                                         placeholder="<?php echo $textSortOrder; ?>" id="input-sort-order" class="form-control" />
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="w1MerchantId">
                                    <span data-toggle="tooltip" title="<?php echo $textMerchantIdDesc; ?>"><?php echo $textMerchantId; ?></span>
                                </label>
                                <div class="col-sm-10">
                                    <input type="text" name="w1MerchantId" value="<?php echo (isset($w1MerchantId) ? $w1MerchantId : ''); ?>" 
                                           placeholder="<?php echo $textMerchantId; ?>" id="w1MerchantId" class="form-control" />
                                    <?php if ($errorMerchantId) { ?>
                                        <div class="text-danger"><?php echo $errorMerchantId; ?></div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="w1CurrencyId"><?php echo $textCurrencyId; ?></label>
                                <div class="col-sm-10">
                                    <select name="w1CurrencyId" id="w1CurrencyId" class="form-control">
                                        <?php foreach ($currencies as $key => $currency) { ?>
                                            <?php if (isset($w1CurrencyId) && $key == $w1CurrencyId) { ?>
                                                <option value="<?php echo $key; ?>" selected="selected"><?php echo $currency; ?></option>
                                            <?php } else { ?>
                                                <option value="<?php echo $key; ?>"><?php echo $currency; ?></option>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                    <?php if ($errorCurrencyId) { ?>
                                        <div class="text-danger"><?php echo $errorCurrencyId; ?></div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="w1CurrencyDefault">
                                    <span data-toggle="tooltip" title="<?php echo $textCurrencyDefaultDesc; ?>"><?php echo $textCurrencyDefault; ?></span>
                                </label>
                                <div class="col-sm-10">
                                    <input type="checkbox" value="1" name="w1CurrencyDefault"
                                           <?php echo (!empty($w1CurrencyDefault) && $w1CurrencyDefault == 1 ? ' checked' : '')?>>
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="w1Signature">
                                    <span data-toggle="tooltip" title="<?php echo $textSignatureDesc; ?>"><?php echo $textSignature; ?></span>
                                </label>
                                <div class="col-sm-10">
                                    <input type="text" name="w1Signature" value="<?php echo (isset($w1Signature) ? $w1Signature : ''); ?>" 
                                           placeholder="<?php echo $textSignature; ?>" id="w1Signature" class="form-control" />
                                    <?php if ($errorSignature) { ?>
                                        <div class="text-danger"><?php echo $errorSignature; ?></div>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="w1ReturnUrl"><?php echo $textReturnUrl; ?></label>
                                <div class="col-sm-10">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-link"></i></span>
                                        <input type="text" readonly="readonly" value="<?php echo $w1ReturnUrl; ?>" id="w1ReturnUrl" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="w1CultureId"><?php echo $textCultureId; ?></label>
                                <div class="col-sm-10">
                                    <select name="w1CultureId" id="w1CultureId" class="form-control">
                                        <?php foreach ($cultures as $key => $culture) { ?>
                                            <?php if (isset($w1CultureId) && $key == $w1CultureId) { ?>
                                                <option value="<?php echo $key; ?>" selected="selected"><?php echo $culture; ?></option>
                                            <?php } else { ?>
                                                <option value="<?php echo $key; ?>"><?php echo $culture; ?></option>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                    <?php if ($errorCultureId) { ?>
                                        <div class="text-danger"><?php echo $errorCultureId; ?></div>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab_dop_api">
                            <div class="form-group">
                                <label class="col-sm-2 control-label"><?php echo $textPtenabled; ?></label>
                                <div class="col-sm-10">
                                    <div class="well well-sm list-paysystem">
                                        <?php echo $listPtenabled;?>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label"><?php echo $textPtdisabled; ?></label>
                                <div class="col-sm-10">
                                    <div class="well well-sm list-paysystem">
                                        <?php echo $listPtdisabled;?>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab_order_status">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-processed-status"><?php echo $textStatusOrderProcessed; ?></label>
                                <div class="col-sm-10">
                                    <select name="w1OrderStatusProcessed" id="input-processed-status" class="form-control">
                                        <?php foreach ($orderStatuses as $status) { ?>
                                            <?php if ($status['order_status_id'] == $w1OrderStatusProcessed) { ?>
                                                <option value="<?php echo $status['order_status_id']; ?>" selected="selected"><?php echo $status['name']; ?></option>
                                            <?php } else { ?>
                                                <option value="<?php echo $status['order_status_id']; ?>"><?php echo $status['name']; ?></option>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="w1OrderStatusWaiting"><?php echo $textStatusOrderWaiting; ?></label>
                                <div class="col-sm-10">
                                    <select name="w1OrderStatusWaiting" id="w1OrderStatusWaiting" class="form-control">
                                        <?php foreach ($orderStatuses as $status) { ?>
                                            <?php if ($status['order_status_id'] == $w1OrderStatusWaiting) { ?>
                                                <option value="<?php echo $status['order_status_id']; ?>" selected="selected"><?php echo $status['name']; ?></option>
                                            <?php } else { ?>
                                                <option value="<?php echo $status['order_status_id']; ?>"><?php echo $status['name']; ?></option>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="w1OrderStatusSuccess"><?php echo $textStatusOrderSuccess; ?></label>
                                <div class="col-sm-10">
                                    <select name="w1OrderStatusSuccess" id="w1OrderStatusSuccess" class="form-control">
                                        <?php foreach ($orderStatuses as $status) { ?>
                                            <?php if ($status['order_status_id'] == $w1OrderStatusSuccess) { ?>
                                                <option value="<?php echo $status['order_status_id']; ?>" selected="selected"><?php echo $status['name']; ?></option>
                                            <?php } else { ?>
                                                <option value="<?php echo $status['order_status_id']; ?>"><?php echo $status['name']; ?></option>
                                            <?php } ?>
                                            <?php } ?>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<link rel="stylesheet" type="text/css" href="<?php echo $linkToCss?>">
<?php echo $footer; ?> 