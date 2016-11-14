<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<a href="<?php echo $back; ?>" data-toggle="tooltip" title="<?php echo $button_back; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
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
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <?php if ($success) { ?>
            <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>
        
        <style>
            .small_text_row {
                font-size: 10px;
                color: #aaa;
            }
            .small_text_row:hover {
                color:black;
            }
            #tab-documentation img{
                border: 1px solid #049f9d;
                margin-bottom: 10px;
            }
            thead td {
            background: #efefef;
            }
            table.table > tbody > tr > td{
                padding: 3px;
            }
            .btn-danger{
                padding: 3px;
                padding-left: 6px;
                padding-right: 6px;
            }
            
            .apply_any_am_ord_link{
                border-bottom: 1px dashed;
                font-size: 10px;
                cursor: pointer;
                color: #1e91cf;
            }
            
            .add_tbody select, .add_tbody input, .add_tbody textarea, table.add_tbody{
                height: 25px;
                padding: 3px 8px;
                font-size: 12px;
                color: #555;
                background-color: #fff;
                background-image: none;
                border: 1px solid #ccc;
                border-radius: 3px;
                -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
                box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
                -webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
                -o-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
                transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
            }
            .add_tbody tr td{
                padding: 8px !important;
            }
            .add_tbody select{

            }
            .add_tbody input[type="checkbox"]{
                width: 13px !important;
                height: 13px;
                padding: 3px 3px;
            }
            .hide_function{
                display:none;
            }
            .input-group.date{
                width: 100%;
            }
                
            .input-group.date button{
                height: 25px;
                width: 25px;
                padding: 0px;
            }
        </style>
        
        <div class="panel panel-default">
            <div class="panel-body"> 
            <ul class="nav nav-tabs">
                <li class="active"><a href="#tab-sales" data-toggle="tab"><?php echo $tab_sales; ?></a></li>
                <li><a href="#tab-complect" data-toggle="tab"><?php echo $tab_complect; ?></a></li>
                <li><a href="#tab-category" data-toggle="tab"><?php echo $tab_category; ?></a></li>
                <li><a href="#tab-manufacturer" data-toggle="tab"><?php echo $tab_manufacturer; ?></a></li>
                <li><a href="#tab-promo" data-toggle="tab"><?php echo $tab_promo; ?></a></li>
                <?php if($tab_documentation && FALSE){ ?>
                    <li><a href="#tab-documentation" data-toggle="tab"><?php echo $tab_documentation; ?></a></li>
                <?php } ?>
            </ul>
                
                <div class="tab-content">
                    <div class="tab-pane" id="tab-promo">
                        <div class="pull-right"><p><a onclick="$('#form-promo').submit();"   title="<?php echo $button_save; ?>" data-toggle="tooltip" class="btn btn-success"><i class="fa fa-save"></i> <?php echo $button_save; ?></a></p></div><br>
                        <div class="clearfix"></div>
                        <form action="<?php echo $action_promo; ?>" method="post" enctype="multipart/form-data" id="form-promo">
                            <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <tbody  class="add_tbody">
                                <tr>
                                    <td><?php echo $entry_promo_manufacturer; ?></td>
                                    <td>
                                        <select name="discountsales_promo[manufacturer][status]">
                                            <?php if (isset($discountsales_promo['manufacturer']['status']) && $discountsales_promo['manufacturer']['status']) {  ?>
                                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                            <?php } else { ?>
                                                <option value="1"><?php echo $text_enabled; ?></option>
                                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                            <?php } ?>
                                        </select> 
                                        </td>
                                        <td>
                                        <?php echo $entry_promo_manufacturer_position ?>:
                                        <select name="discountsales_promo[manufacturer][position]">
                                            <?php if (isset($discountsales_promo['manufacturer']['position']) && $discountsales_promo['manufacturer']['position']=='image') { ?>
                                                <option value="uph4"><?php echo $entry_promo_manufacturer_position_up_h4; ?></option>
                                                <option value="image" selected="selected"><?php echo $entry_promo_manufacturer_position_on_image; ?></option>
                                            <?php } else { ?>
                                                <option value="uph4" selected="selected"><?php echo $entry_promo_manufacturer_position_up_h4; ?></option>
                                                <option value="image" ><?php echo $entry_promo_manufacturer_position_on_image; ?></option>
                                            <?php } ?>
                                        </select>
                                        <input placeholder="<?php echo $entry_promo_manufacturer_text; ?>" value="<?php echo $discountsales_promo['manufacturer']['text'] ?>" name="discountsales_promo[manufacturer][text]" />
                                        <input placeholder="<?php echo $entry_promo_manufacturer_color; ?>" value="<?php echo $discountsales_promo['manufacturer']['colour'] ?>" name="discountsales_promo[manufacturer][colour]" />
                                    </td>
                                </tr>
                                <tr>
                                    <td><?php echo $entry_promo_category; ?></td>
                                    <td>
                                        <select name="discountsales_promo[category][status]">
                                            <?php if (isset($discountsales_promo['category']['status']) && $discountsales_promo['category']['status'] ) { ?>
                                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                            <?php } else { ?>
                                                <option value="1"><?php echo $text_enabled; ?></option>
                                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                            <?php } ?>
                                        </select> 
                                        </td>
                                        <td>
                                        <?php echo $entry_promo_manufacturer_position ?>:
                                        
                                        <select name="discountsales_promo[category][position]">
                                            <?php if (isset($discountsales_promo['category']['position']) && $discountsales_promo['category']['position']=='image') { ?>
                                                <option value="uph4" ><?php echo $entry_promo_manufacturer_position_up_h4; ?></option>
                                                <option value="image" selected="selected"><?php echo $entry_promo_manufacturer_position_on_image; ?></option>
                                            <?php } else { ?>
                                                <option value="uph4" selected="selected"><?php echo $entry_promo_manufacturer_position_up_h4; ?></option>
                                                <option value="image" ><?php echo $entry_promo_manufacturer_position_on_image; ?></option>
                                            <?php } ?>
                                        </select>
                                        <input placeholder="<?php echo $entry_promo_manufacturer_text; ?>" value="<?php echo $discountsales_promo['category']['text'] ?>" name="discountsales_promo[category][text]" />
                                        <input placeholder="<?php echo $entry_promo_manufacturer_color; ?>" value="<?php echo $discountsales_promo['category']['colour'] ?>" name="discountsales_promo[category][colour]" />
                                        <script type="text/javascript">// <![CDATA[
                                            ///ColorPicker($("input[name='discountsales_promo[category][colour]']"),document.getElementById('picker'),function(hex, hsv, rgb) {                       document.body.style.backgroundColor = hex;                     });
                                        // ]]></script>
                                    </td>
                                </tr>
                                <tr>
                                    <td><?php echo $entry_promo_discount; ?></td>
                                    <td>
                                        <select name="discountsales_promo[discount][status]">
                                            <?php if (isset($discountsales_promo['discount']['status']) && $discountsales_promo['discount']['status']) { ?>
                                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                            <?php } else { ?>
                                                <option value="1"><?php echo $text_enabled; ?></option>
                                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                            <?php } ?>
                                        </select> </td>
                                        <td>
                                        <?php echo $entry_promo_manufacturer_position ?>:
                                        <select name="discountsales_promo[discount][position]">
                                            <?php if (isset($discountsales_promo['discount']['position']) && $discountsales_promo['discount']['position']=='image') { ?>
                                                <option value="uph4" ><?php echo $entry_promo_manufacturer_position_up_h4; ?></option>
                                                <option value="image" selected="selected"><?php echo $entry_promo_manufacturer_position_on_image; ?></option>
                                            <?php } else { ?>
                                                <option value="uph4" selected="selected"><?php echo $entry_promo_manufacturer_position_up_h4; ?></option>
                                                <option value="image" ><?php echo $entry_promo_manufacturer_position_on_image; ?></option>
                                            <?php } ?>
                                        </select>
                                        <input placeholder="<?php echo $entry_promo_manufacturer_text; ?>" value="<?php echo $discountsales_promo['discount']['text'] ?>" name="discountsales_promo[discount][text]" />
                                        <input placeholder="<?php echo $entry_promo_manufacturer_color; ?>" value="<?php echo $discountsales_promo['discount']['colour'] ?>" name="discountsales_promo[discount][colour]" />
                                    </td>
                                </tr>
                                <tr>
                                    <td><?php echo $entry_promo_to_product; ?></td>
                                    <td>
                                        
                                        <select name="discountsales_promo[to_product][status]">
                                            <?php if (isset($discountsales_promo['to_product']['status']) && $discountsales_promo['to_product']['status']) { ?>
                                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                            <?php } else { ?>
                                                <option value="1"><?php echo $text_enabled; ?></option>
                                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                            <?php } ?>
                                        </select> </td>
                                        <td>
                                        <?php echo $entry_promo_manufacturer_position ?>:
                                        <select name="discountsales_promo[to_product][position]">
                                            <?php if (isset($discountsales_promo['to_product']['position']) && $discountsales_promo['to_product']['position']=='image') { ?>
                                                <option value="uph4" ><?php echo $entry_promo_manufacturer_position_up_h4; ?></option>
                                                <option value="image" selected="selected"><?php echo $entry_promo_manufacturer_position_on_image; ?></option>
                                            <?php } else { ?>
                                                <option value="uph4" selected="selected"><?php echo $entry_promo_manufacturer_position_up_h4; ?></option>
                                                <option value="image" ><?php echo $entry_promo_manufacturer_position_on_image; ?></option>
                                            <?php } ?>
                                        </select>
                                        <input placeholder="<?php echo $entry_promo_manufacturer_text; ?>" value="<?php echo $discountsales_promo['to_product']['text'] ?>" name="discountsales_promo[to_product][text]" />
                                        <input placeholder="<?php echo $entry_promo_manufacturer_color; ?>" value="<?php echo $discountsales_promo['to_product']['colour'] ?>" name="discountsales_promo[to_product][colour]" />
                                        
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                                <hr>
                                
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <td colspan="3"><span data-toggle="tooltip" title="" data-original-title="<?php echo $entry_disable_on_this_categories_info ?>"><?php echo $entry_disable_on_this_categories; ?></span></td>
                                        </tr>
                                    </thead>
                                <tbody  class="add_tbody">
                                <tr>
                                    <td width="15%">
                                        <input placeholder="<?php echo $entry_disable_on_this_categories_name; ?>" value="" name="discountsales_disable_data_categories[0][name]" />
                                    </td>
                                    <td colspan="2">
                                        <select onchange="addDisableDataRow('categories-disable-data0',0,'categories',this.value);">
                                                <option value="0"><?php echo $entry_select; ?></option>
                                                <?php foreach ($categories as $category) { ?>
                                                    <option value="<?php echo $category['category_id'].'_____'.$category['name']; ?>"><?php echo $category['name']; ?></option>
                                                <?php } ?>
                                        </select>
                                        <div id="categories-disable-data0" class="well well-sm" style="overflow: auto; max-height: 150px; margin-top: 3px; ">
                                            
                                        </div>
                                        
                                    </td>
                                </tr>
                                <?php if($discountsales_disable_data_categories){ ?>
                                <tr>
                                    <td colspan="3">
                                        <hr>
                                    </td>
                                </tr>
                                <?php } ?>
                                <?php if($discountsales_disable_data_categories){ ?>
                                    <?php foreach($discountsales_disable_data_categories as $disable_data_categories_id => $disable_data_categories){ ?>
                                        <tr id="disable_data_row_categories_data<?php echo $disable_data_categories_id ?>">
                                            <td>
                                                <input placeholder="<?php echo $entry_disable_on_this_categories_name; ?>" value="<?php echo $disable_data_categories['name'] ?>" name="discountsales_disable_data_categories[<?php echo $disable_data_categories_id; ?>][name]" />
                                            </td>
                                            <td>
                                                 <select onchange="addDisableDataRow('categories-disable-data<?php echo $disable_data_categories_id; ?>','<?php echo $disable_data_categories_id; ?>','categories',this.value);">
                                                        <option value="0"><?php echo $entry_select; ?></option>
                                                        <?php foreach ($categories as $category) { ?>
                                                            <option value="<?php echo $category['category_id'].'_____'.$category['name']; ?>"><?php echo $category['name']; ?></option>
                                                        <?php } ?>
                                                </select>
                                                <div id="categories-disable-data<?php echo $disable_data_categories_id; ?>" class="well well-sm" style="overflow: auto; max-height: 150px; margin-top: 3px; ">
                                                    <?php foreach($disable_data_categories['data'] as $disable_data_categories_row){ ?>
                                                        <?php if(isset($categories[$disable_data_categories_row]) && $disable_data_categories['data']){ ?>
                                                            <div id="categories-disable-data<?php echo $disable_data_categories_id.$disable_data_categories_row ?>">
                                                                <i onclick="delDisableDataRow('categories-disable-data<?php echo $disable_data_categories_id.$disable_data_categories_row ?>')" class="fa fa-minus-circle"></i> 
                                                                <input type="hidden" value="<?php echo $disable_data_categories_row ?>" name="discountsales_disable_data_categories[<?php echo $disable_data_categories_id ?>][data][<?php echo $disable_data_categories_row ?>]"><?php echo $categories[$disable_data_categories_row]['name']; ?>
                                                            </div>
                                                        <?php } ?>
                                                    <?php } ?>
                                                </div>
                                            </td>
                                            <td class="left">
                                                <a title="" onclick="$('#disable_data_row_categories_data<?php echo $disable_data_categories_id ?>').remove();" data-toggle="tooltip" class="btn btn-danger" data-original-title="Удалить"><i class="fa fa-trash-o"></i></a>
                                            </td>
                                        </tr>
                                    <?php } ?>
                                <?php } ?>
                                </tbody>
                                </table>
                        </div>
                    </form>
                    </div>
                    
                    
                    
                <?php if($tab_documentation){ ?>
                <div class="tab-pane" id="tab-documentation">
                    <h2>Скидка на сумму заказа</h2>
                    <p>Например, необходимо сделать скидку на сумму заказа в корзине, как в таблице</p>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <td>От</td>
                            <td>До</td>
                            <td>Размер скидки</td>
                            </thead>
                            <tr>
                            <td>0</td>
                            <td>100 (не включая 100 - до 100)</td>
                            <td>0% (не должно быть скидки)</td>
                        </tr>
                        <tr>
                            <td>100</td>
                            <td>500 (не включая 500 - до 500)</td>
                            <td>10%</td>
                        </tr>
                        <tr>
                            <td colspan="2">Свыше 500</td>
                            <td>15%</td>
                        </tr>
                    </table>
                    <p>1. Зайдите в закладку "Скидка на сумму заказа"</p>
                    <p>2. Нажмите "+" - добавить строку</p>
                    <img src="/admin/view/image/ocext/dspro/0001.jpg" />
                    <p>3. В поле "Cумма заказа, до которой применять скидку, в валюте по умолчанию" укажите - 100, а в поле "Наценка или скидка" - 0. Выбирите "Включено". Это означает, что при суммах заказа до 100 (не включая 100) скидка будет 0%, то есть не будет применяться</p>
                    <img src="/admin/view/image/ocext/dspro/0002.jpg" />
                    <p>4. Снова нажмите "+" - добавить строку</p>
                    <img src="/admin/view/image/ocext/dspro/0001.jpg" />
                    <p>5. В поле "Cумма заказа, до которой применять скидку, в валюте по умолчанию" укажите - 500, а в поле "Наценка или скидка" - минус 10%. Выбирите "Включено". Это означает, что при суммах заказа до 500 (не включая 500) скидка будет 15%. Сначала скрипт увидит диапазон до 100, но если сумма перевалит за 100, включится второй диапазон до 500 (не включая 500)</p>
                    <img src="/admin/view/image/ocext/dspro/0003.jpg" />
                    <p>6. Снова нажмите "+" - добавить строку</p>
                    <img src="/admin/view/image/ocext/dspro/0001.jpg" />
                    <p>7. В поле "Cумма заказа, до которой применять скидку, в валюте по умолчанию" укажите любое большое число, например - 1000000, а в поле "Наценка или скидка" - минус 15%. Выбирите "Включено". Это означает, что при суммах заказа до 100, от 100 до 500 будут применяться диапазоны заданные выше. Но, как только сумма перевалит за 500, то будет применяться скидка 15%</p>
                    <img src="/admin/view/image/ocext/dspro/0004.jpg" />
                    <p>8. Нажмите Сохранить</p>
                </div>
                <?php } ?>
                    <div class="tab-pane active" id="tab-sales">
                    <div class="pull-right"><p><a onclick="$('#form').submit();"   title="<?php echo $button_save; ?>" data-toggle="tooltip" class="btn btn-success"><i class="fa fa-save"></i> <?php echo $button_save; ?></a></p></div><br>
                    
                    <?php if($expamples && FALSE){ ?>
                    
                    <p><a style="border-bottom: 1px dashed; cursor: pointer" onclick="$('#examples').show(150);"><?php echo $text_examples; ?></a></p>
                    <div id="examples" style="display: none; background: #F5F5F5;">
                        <p><?php echo $text_examples_1_an; ?></p>
                        <div class="table-responsive">
                        <table id="discounts" class="table table-bordered table-hover">
                            <thead>
                              <tr>
                                <td class="left"><?php echo $entry_payment; ?></td>
                                <td class="left"><?php echo $entry_tax_class; ?></td>
                                <td class="left"><?php echo $entry_sales_limitation; ?>
                                <?php echo $text_examples_1_des; ?>    
                                </td>
                                <td class="left"><?php echo $entry_delta; ?></td>
                                <td></td>
                              </tr>
                            </thead>
                            <tr>
                                    <td class="left">
                                        <select>
                                            <option value="0">PayPal</option></select>
                                    </td>
                                    <td class="left">
                                        <select>
                                            <option value="0"> - </option></select>
                                    </td>
                                    <td class="left">
                                        <input style="color: red;" value="1000000" >
                                    </td>
                                    <td class="left">
                                        <select>
                                                <option value="0"><?php echo $text_plus; ?></option></select>
                                        <input value="5" style="width: 50px;">
                                        <select>
                                            <option value="1" selected="selected">%</option>
                                                                              </select>
                                    </td>
                                    <td>
                                        <select>
                                            <option value="1" selected="selected"><?php echo $text_enable; ?></option>
                                        </select>
                                    </td>
                                </tr>
                        </table>
                        </div>
                        <hr>
                        <p><?php echo $text_examples_2_an; ?></p>
                        <div class="table-responsive">
                        <table id="discounts" class="table table-bordered table-hover">
                            <thead>
                              <tr>
                                <td class="left"><?php echo $entry_payment; ?></td>
                                <td class="left"><?php echo $entry_tax_class; ?></td>
                                <td class="left"><?php echo $entry_sales_limitation; ?>
                                    <?php echo $text_examples_2_des; ?>
                                </td>
                                <td class="left"><?php echo $entry_delta; ?></td>
                                <td></td>
                              </tr>
                            </thead>
                            <tr>
                                    <td class="left">
                                        <select>
                                            <option value="0"><?php echo $text_none_all_payments; ?></option></select>
                                    </td>
                                    <td class="left">
                                        <select>
                                            <option value="0"> -</option></select>
                                    </td>
                                    <td class="left">
                                        <input style="color: red;" value="3000" >
                                    </td>
                                    <td class="left">
                                        <select>
                                                <option value="0"><?php echo $text_minus; ?></option></select>
                                        <input value="0" style="width: 50px;color: red;">
                                        <select>
                                            <option value="1" selected="selected">%</option>
                                                                              </select>
                                    </td>
                                    <td>
                                        <select>
                                            <option value="1" selected="selected"><?php echo $text_enable; ?></option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left">
                                        <select>
                                            <option value="0"><?php echo $text_none_all_payments; ?></option></select>
                                    </td>
                                    <td class="left">
                                        <select>
                                            <option value="0"> - </option></select>
                                    </td>
                                    <td class="left">
                                        <input style="color: red;" value="1000000" >
                                    </td>
                                    <td class="left">
                                        <select>
                                                <option value="0"><?php echo $text_minus; ?></option></select>
                                        <input value="12" style="width: 50px;color: red;">
                                        <select>
                                            <option value="1" selected="selected">%</option>
                                                                              </select>
                                    </td>
                                    <td>
                                        <select>
                                            <option value="1" selected="selected"><?php echo $text_enable; ?></option>
                                        </select>
                                    </td>
                                </tr>
                        </table>
                        </div>
                        </div>
                        <?php } ?>
                    <hr style="margin-bottom: 20px">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover add_tbody">
                                <tr>
                                    <td><?php echo $entry_status_all; ?></td>
                                    <td>
                                        <select name="discountsales_status">
                                        <?php if ($discountsales_status) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                        <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                        <?php } ?>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><?php echo $entry_status; ?></td>
                                    <td>
                                        <select name="discountsales_discount_status">
                                        <?php if ($discountsales_discount_status) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                        <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                        <?php } ?>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><?php echo $entry_sort_order; ?></td>
                                    <td>
                                        <input type="text" name="discountsales_sort_order" value="<?php echo $discountsales_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td><?php echo $entry_status_together; ?></td>
                                    <td>
                                        <select name="discountsales_status_together">
                                        <?php if ($discountsales_status_together) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $entry_status_together_disabled; ?></option>
                                        <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $entry_status_together_disabled; ?></option>
                                        <?php } ?>
                                        </select>
                                    </td>
                                </tr>
                             </table>
                        </div>

                        <div class="table-responsive">
                            <table id="discounts" class="table table-bordered table-hover add_tbody">
                                <thead>
                                  <tr>
                                    <td class="left"><?php echo $entry_payment; ?></td>
                                    <td class="left"><?php echo $entry_tax_class; ?></td>
                                    <td class="left"><span data-toggle="tooltip" title="" data-original-title="<?php echo $entry_sales_limitation_info ?>"><?php echo $entry_sales_limitation; ?></span></td>
                                    <td class="left"><?php echo $entry_delta; ?></td>
                                    
                                    <td><?php echo $entry_date_start; ?></td>
                                    <td><?php echo $entry_date_finish; ?></td>
                                    <td><?php echo $entry_disable_on_this_categories; ?></td>
                                    <td><?php echo $entry_status; ?></td>
                                    <td></td>
                                  </tr>
                                </thead>
                                <?php $discount_row = 0; ?>
                                <?php foreach ($discountsales_discount as $discount) { ?>
                                <tbody id="discount-row<?php echo $discount_row; ?>" class="add_tbody" style="border-left: 5px solid #<?php echo $discount['id_container'] ?>">
                                      <tr>
                                        <td class="left">
                                            <select name="discountsales_discount[<?php echo $discount_row; ?>][payment_code]">
                                                <option value="0"><?php echo $text_none_all_payments; ?></option>
                                                <?php foreach ($payments as $payment) { ?>
                                                <?php if ($payment['code'] == $discount['payment_code']) { ?>
                                                <option value="<?php echo $payment['code']; ?>" selected="selected"><?php echo $payment['title']; ?></option>
                                                <?php } else { ?>
                                                <option value="<?php echo $payment['code']; ?>"><?php echo $payment['title']; ?></option>
                                                <?php } ?>
                                                <?php } ?>
                                            </select>
                                        </td>
                                        <td class="left">
                                            <select name="discountsales_discount[<?php echo $discount_row; ?>][tax_class_id]">
                                                <option value="0"><?php echo $text_none; ?></option>
                                                <?php foreach ($tax_classes as $tax_class) { ?>
                                                <?php if ($tax_class['tax_class_id'] == $discount['tax_class_id']) { ?>
                                                <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                                                <?php } else { ?>
                                                <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                                                <?php } ?>
                                                <?php } ?>
                                            </select>
                                        </td>
                                        <td class="left">
                                            <!--<img style="display: none" src="<?php echo HTTP_SERVER; ?>/view/image/ocext/cart_ds.png" /> <input value="<?php echo $discount['sales_limitation'] ?>" name="discountsales_discount[<?php echo $discount_row; ?>][sales_limitation]" />-->
                                            <div>
                                            <?php if($discount['sales_limitation'] && $discount['sales_limitation']==1000000000){ ?>
                                                    
                                                    <input placeholder="<?php echo $entry_sales_limit_input ?>" type="hidden" value="<?php echo $discount['sales_limitation'] ?>" name="discountsales_discount[<?php echo $discount_row; ?>][sales_limitation]" />
                                                    <input onclick="getBigNumTo('discountsales_discount[<?php echo $discount_row; ?>][sales_limitation]')" type="checkbox" checked="" /> <?php echo $entry_apply_any_am_ord_link ?>
                                            
                                            <?php }else{ ?>
                                                    
                                                    <input placeholder="<?php echo $entry_sales_limit_input ?>" value="<?php echo $discount['sales_limitation'] ?>" name="discountsales_discount[<?php echo $discount_row; ?>][sales_limitation]" />
                                                    <input onclick="getBigNumTo('discountsales_discount[<?php echo $discount_row; ?>][sales_limitation]')" type="checkbox" /> <?php echo $entry_apply_any_am_ord_link ?>
                                            
                                            <?php } ?>
                                            </div>
                                        </td>
                                        <td class="left">
                                            <select name="discountsales_discount[<?php echo $discount_row; ?>][above_zero]">
                                              <?php if ($discount['above_zero']) { ?>
                                              <option value="0" ><?php echo $text_plus; ?></option>
                                              <option value="1" selected="selected"><?php echo $text_minus; ?></option>
                                              <?php } else { ?>
                                              <option value="0" selected="selected"><?php echo $text_plus; ?></option>
                                              <option value="1" ><?php echo $text_minus; ?></option>
                                              <?php } ?>
                                            </select>
                                            <input name="discountsales_discount[<?php echo $discount_row; ?>][value_data]" value="<?php echo $discount['value_data']; ?>" style="width: 50px;"/>
                                            <select name="discountsales_discount[<?php echo $discount_row; ?>][type_data]">
                                              <?php if ($discount['type_data']) { ?>
                                              <option value="0"><?php echo $text_money; ?></option>
                                              <option value="1" selected="selected"><?php echo $text_percent; ?></option>
                                              <?php } else { ?>
                                              <option value="0" selected="selected"><?php echo $text_money; ?></option>
                                              <option value="1"><?php echo $text_percent; ?></option>
                                              <?php } ?>
                                            </select>
                                        </td>
                                        
                                        <td style="width: 180px;" class="left">
                                            <div class="input-group date">
                                            <?php if (isset($discount['date_start']) && $discount['date_start']) { ?>
                                                <input type="text" name="discountsales_discount[<?php echo $discount_row; ?>][date_start]" value="<?php echo $discount['date_start']; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                                            <?php } else { ?>
                                                <input type="text" name="discountsales_discount[<?php echo $discount_row; ?>][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                                            <?php } ?>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                                </span>
                                            </div>
                                        </td>
                                        
                                        <td style="width: 180px;" class="left">
                                            <div class="input-group date">
                                            <?php if (isset($discount['date_finish']) && $discount['date_finish']) { ?>
                                                <input width="" type="text" name="discountsales_discount[<?php echo $discount_row; ?>][date_finish]" value="<?php echo $discount['date_finish']; ?>" placeholder="<?php echo $entry_date_finish; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                                            <?php } else { ?>
                                                <input type="text" name="discountsales_discount[<?php echo $discount_row; ?>][date_finish]" value="" placeholder="<?php echo $entry_date_finish; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                                            <?php } ?>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                                </span>
                                            </div>
                                        </td>
                                        
                                        <td>
                                            <?php if($discountsales_disable_data_categories){ ?>
                                                
                                                <select name="discountsales_discount[<?php echo $discount_row; ?>][disable_categories]">
                                                    <option value="0"><?php echo $text_disabled; ?></option>
                                                    <?php foreach($discountsales_disable_data_categories as $disable_data_categories_row_id=>$disable_data_categories_row){ ?>
                                                        <?php if (isset($discount['disable_categories']) && $discount['disable_categories'] && $disable_data_categories_row_id==$discount['disable_categories']) { ?>
                                                            <option value="<?php echo $disable_data_categories_row_id ?>" selected="selected"><?php echo $disable_data_categories_row['name'] ?></option>
                                                        <?php } else { ?>
                                                            <option value="<?php echo $disable_data_categories_row_id ?>" ><?php echo $disable_data_categories_row['name'] ?></option>
                                                        <?php } ?>
                                                    <?php } ?>
                                               </select>
                                            
                                            <?php }else{
                                                echo $entry_disable_need_create;
                                            } ?>
                                        </td>
                                        
                                        <td>
                                            <select name="discountsales_discount[<?php echo $discount_row; ?>][status]">
                                            <?php if ($discount['status']) { ?>
                                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                            <option value="0" ><?php echo $text_disabled; ?></option>
                                            <?php } else { ?>
                                            <option value="1"><?php echo $text_enabled; ?></option>
                                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                            <?php } ?>
                                           </select>
                                        </td>
                                        <td class="left">
                                            <a title="<?php echo $button_remove; ?>" onclick="$('#discount-row<?php echo $discount_row; ?>').remove();" data-toggle="tooltip" class="btn btn-danger"><i class="fa fa-trash-o"></i></a>
                                        </td>
                                      </tr>
                                </tbody>
                                <?php $discount_row++; ?>
                                <?php } ?>
                                <tfoot>
                                  <tr>
                                      <td colspan="9" class="right">
                                          <a onclick="addDiscountSalesRow();" title="<?php echo $button_add_discount; ?>" data-toggle="tooltip" class="btn btn-primary"><i class="fa fa-plus"></i></a>
                                      </td>
                                  </tr>
                                </tfoot>
                            </table>
                        </div>
                    </form>
            
                    </div>
                    
                    <div class="tab-pane" id="tab-complect">
                        <div class="pull-right"><p><a onclick="$('#form-complect').submit();"   title="<?php echo $button_save; ?>" data-toggle="tooltip" class="btn btn-success"><i class="fa fa-save"></i> <?php echo $button_save; ?></a></p></div><br>
                        <div class="clearfix"></div>
                        <form action="<?php echo $action_complect; ?>" method="post" enctype="multipart/form-data" id="form-complect">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover add_tbody">
                                <tr>
                                    <td><?php echo $entry_status; ?></td>
                                    <td>
                                        <select name="discountsales_complect_status">
                                            <?php if ($discountsales_complect_status) { ?>
                                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                            <?php } else { ?>
                                                <option value="1"><?php echo $text_enabled; ?></option>
                                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                            <?php } ?>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><?php echo $entry_sort_order; ?></td>
                                    <td>
                                        <input type="text" name="discountsales_complect_sort_order" value="<?php echo $discountsales_complect_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td><?php echo $entry_status_together; ?></td>
                                    <td>
                                        <select name="discountsales_complect_status_together">
                                        <?php if ($discountsales_complect_status_together) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $entry_status_together_disabled; ?></option>
                                        <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $entry_status_together_disabled; ?></option>
                                        <?php } ?>
                                        </select>
                                    </td>
                                </tr>
                             </table>
                        </div>

                        <div class="table-responsive">
                            <table id="discounts-complect" class="table table-bordered table-hover">
                                <thead>
                                  <tr>
                                    <td class="left"><?php echo $entry_complect; ?></td>
                                    <td class="left"><span data-toggle="tooltip" title="" data-original-title="<?php echo $entry_complect_quantity_info ?>"><?php echo $entry_complect_quantity; ?></span></td>
                                    <td class="left"><?php echo $entry_tax_class; ?></td>
                                    <td class="left hide_function"><span data-toggle="tooltip" title="" data-original-title="<?php echo $entry_sales_limitation_info ?>"><?php echo $entry_sales_limitation; ?></span></td>
                                    <td class="left"><?php echo $entry_delta; ?></td>
                                    
                                    <td><?php echo $entry_date_start; ?></td>
                                    <td><?php echo $entry_date_finish; ?></td>
                                    <td><?php echo $entry_complect_disable_other_discount; ?></td>
                                    <td><?php echo $entry_status; ?></td>
                                  </tr>
                                </thead>
                                <?php $discount_complect_row = 0; ?>
                                <?php foreach ($discountsales_complect_discount as $discount) { ?>
                                <tbody  class="add_tbody" id="discount-row-complect<?php echo $discount_complect_row; ?>" style="border-left: 0px solid #<?php echo $discount['id_container'] ?>">
                                    <tr>
                                        <td colspan="8">
                                            <?php echo $entry_name_complect; ?>: <input style="width:50%" value="<?php echo $discount['name_complect'] ?>" name="discountsales_complect_discount[<?php echo $discount_complect_row; ?>][name_complect]" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="left" width="12%">
                                            <input onkeypress="autoCompliteComplects('#input-complect<?php echo $discount_complect_row; ?>',<?php echo $discount_complect_row; ?>)" type="text" name="complect" value="" placeholder="<?php echo $entry_complect_product; ?>" id="input-complect<?php echo $discount_complect_row; ?>" class="form-control" />
                                            <div id="product-complect<?php echo $discount_complect_row; ?>" class="well well-sm" style="overflow: auto; max-height: 150px; ">
                                              <?php if(isset($discount['products']) && $discount['products']){
                                              foreach ($discount['products'] as $product_complect_row) { ?>
                                              <div id="product-complect<?php echo $discount_complect_row; ?><?php echo $product_complect_row['product_id']; ?>"><i  onclick="delComplectProduct(<?php echo $discount_complect_row; ?>,<?php echo $product_complect_row['product_id']; ?>)" class="fa fa-minus-circle"></i> <?php echo $product_complect_row['name']; ?>
                                                <input type="hidden" name="discountsales_complect_discount[<?php echo $discount_complect_row; ?>][products][<?php echo $product_complect_row['product_id']; ?>][product_id]" value="<?php echo $product_complect_row['product_id']; ?>" />
                                                <input type="hidden" name="discountsales_complect_discount[<?php echo $discount_complect_row; ?>][products][<?php echo $product_complect_row['product_id']; ?>][name]" value="<?php echo $product_complect_row['name']; ?>" />
                                              </div>
                                              <?php } ?>
                                              <?php } ?>
                                            </div>
                                        </td>
                                        <td class="left">
                                            
                                            <div id="product-quantity<?php echo $discount_complect_row; ?>" class="well well-sm" style="max-height: 150px; overflow: auto;">
                                            <?php if(isset($discount['product_quantity']) && $discount['product_quantity']){
                                            foreach ($discount['product_quantity'] as $product_id_quantity => $product_quantity) { ?>
                                                <div id="product-quantity<?php echo $discount_complect_row; ?><?php echo $product_id_quantity; ?>">
                                                    <div><?php echo $product_quantity['name']; ?>:</div>
                                                    <input placeholder="<?php echo $text_quantity_products ?>" name="discountsales_complect_discount[<?php echo $discount_complect_row; ?>][product_quantity][<?php echo $product_id_quantity; ?>][quantity]"  style="width: 80px;"  value="<?php echo $product_quantity['quantity']; ?>" />
                                                    <input placeholder="<?php echo $text_new_price ?>" name="discountsales_complect_discount[<?php echo $discount_complect_row; ?>][product_quantity][<?php echo $product_id_quantity; ?>][new_price]"  style="width: 80px;"  value="<?php echo $product_quantity['new_price']; ?>" />
                                                    <input name="discountsales_complect_discount[<?php echo $discount_complect_row; ?>][product_quantity][<?php echo $product_id_quantity; ?>][name]" value="<?php echo $product_quantity['name']; ?>" type="hidden" />
                                                    <hr style="margin-bottom: 2px; margin-top: 5px;">
                                                </div>
                                            <?php } ?>
                                            <?php } ?>
                                            </div>
                                            
                                        </td>
                                        <td class="left">
                                            <select name="discountsales_complect_discount[<?php echo $discount_complect_row; ?>][tax_class_id]">
                                                <option value="0"><?php echo $text_none; ?></option>
                                                <?php foreach ($tax_classes as $tax_class) { ?>
                                                <?php if ($tax_class['tax_class_id'] == $discount['tax_class_id']) { ?>
                                                <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                                                <?php } else { ?>
                                                <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                                                <?php } ?>
                                                <?php } ?>
                                            </select>
                                        </td>
                                        <td class="left hide_function">
                                            <!--<img style="display: none" src="<?php echo HTTP_SERVER; ?>/view/image/ocext/cart_ds.png" /> <input value="<?php echo $discount['sales_limitation'] ?>" name="discountsales_complect_discount[<?php echo $discount_complect_row; ?>][sales_limitation]" />-->
                                            <div>
                                            <?php if($discount['sales_limitation'] && $discount['sales_limitation']==1000000000){ ?>
                                                    
                                                    <input placeholder="<?php echo $entry_sales_limit_input ?>" type="hidden" value="<?php echo $discount['sales_limitation'] ?>" name="discountsales_complect_discount[<?php echo $discount_complect_row; ?>][sales_limitation]" />
                                                    <input onclick="getBigNumTo('discountsales_complect_discount[<?php echo $discount_complect_row; ?>][sales_limitation]')" type="checkbox" checked="" /> <?php echo $entry_apply_any_am_ord_link ?>
                                            
                                            <?php }else{ ?>
                                                    
                                                    <input placeholder="<?php echo $entry_sales_limit_input ?>" value="<?php echo $discount['sales_limitation'] ?>" name="discountsales_complect_discount[<?php echo $discount_complect_row; ?>][sales_limitation]" />
                                                    <input onclick="getBigNumTo('discountsales_complect_discount[<?php echo $discount_complect_row; ?>][sales_limitation]')" type="checkbox" /> <?php echo $entry_apply_any_am_ord_link ?>
                                            
                                            <?php } ?>
                                            </div>
                                        </td>
                                        <td class="left">
                                            <select name="discountsales_complect_discount[<?php echo $discount_complect_row; ?>][above_zero]">
                                              <?php if ($discount['above_zero']) { ?>
                                              <option value="0" ><?php echo $text_plus; ?></option>
                                              <option value="1" selected="selected"><?php echo $text_minus; ?></option>
                                              <?php } else { ?>
                                              <option value="0" selected="selected"><?php echo $text_plus; ?></option>
                                              <option value="1" ><?php echo $text_minus; ?></option>
                                              <?php } ?>
                                            </select>
                                            <input name="discountsales_complect_discount[<?php echo $discount_complect_row; ?>][value_data]" value="<?php echo $discount['value_data']; ?>" style="width: 50px;"/>
                                            <select name="discountsales_complect_discount[<?php echo $discount_complect_row; ?>][type_data]">
                                              <?php if ($discount['type_data']) { ?>
                                              <option value="0"><?php echo $text_money; ?></option>
                                              <option value="1" selected="selected"><?php echo $text_percent; ?></option>
                                              <?php } else { ?>
                                              <option value="0" selected="selected"><?php echo $text_money; ?></option>
                                              <option value="1"><?php echo $text_percent; ?></option>
                                              <?php } ?>
                                            </select>
                                        </td>
                                        <td style="width: 180px;" class="left">
                                            <div class="input-group date">
                                            <?php if (isset($discount['date_start']) && $discount['date_start']) { ?>
                                                <input type="text" name="discountsales_complect_discount[<?php echo $discount_complect_row; ?>][date_start]" value="<?php echo $discount['date_start']; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                                            <?php } else { ?>
                                                <input type="text" name="discountsales_complect_discount[<?php echo $discount_complect_row; ?>][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                                            <?php } ?>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                                </span>
                                            </div>
                                        </td>
                                        
                                        <td style="width: 180px;" class="left">
                                            <div class="input-group date">
                                            <?php if (isset($discount['date_finish']) && $discount['date_finish']) { ?>
                                                <input width="" type="text" name="discountsales_complect_discount[<?php echo $discount_complect_row; ?>][date_finish]" value="<?php echo $discount['date_finish']; ?>" placeholder="<?php echo $entry_date_finish; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                                            <?php } else { ?>
                                                <input type="text" name="discountsales_complect_discount[<?php echo $discount_complect_row; ?>][date_finish]" value="" placeholder="<?php echo $entry_date_finish; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                                            <?php } ?>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                                </span>
                                            </div>
                                        </td>
                                        
                                        <td>
                                            <select name="discountsales_complect_discount[<?php echo $discount_complect_row; ?>][other_discount]">
                                            <?php if (isset($discount['other_discount']) && $discount['other_discount']) { ?>
                                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                            <option value="0" ><?php echo $text_disabled; ?></option>
                                            <?php } else { ?>
                                            <option value="1"><?php echo $text_enabled; ?></option>
                                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                            <?php } ?>
                                           </select>
                                        </td>
                                        
                                        <td>
                                            <select name="discountsales_complect_discount[<?php echo $discount_complect_row; ?>][status]">
                                            <?php if ($discount['status']) { ?>
                                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                            <option value="0" ><?php echo $text_disabled; ?></option>
                                            <?php } else { ?>
                                            <option value="1"><?php echo $text_enabled; ?></option>
                                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                            <?php } ?>
                                           </select>
                                        </td>
                                        <td class="left">
                                            <a title="<?php echo $button_remove; ?>" onclick="$('#discount-row-complect<?php echo $discount_complect_row; ?>').remove();" data-toggle="tooltip" class="btn btn-danger"><i class="fa fa-trash-o"></i></a>
                                        </td>
                                      </tr>
                                </tbody>
                                <?php $discount_complect_row++; ?>
                                <?php } ?>
                                <tfoot>
                                  <tr>
                                      <td colspan="8" class="right">
                                          <a onclick="addDiscountComplectsRow();" title="<?php echo $button_add_discount; ?>" data-toggle="tooltip" class="btn btn-primary"><i class="fa fa-plus"></i></a>
                                      </td>
                                  </tr>
                                </tfoot>
                            </table>
                        </div>
                    </form>
                        
                        
                        
                    
                        
                        
                        
                        
                        
                        
                        
                        
                    </div>
                    
                    <div class="tab-pane" id="tab-category">
                        
                        
                        <div class="pull-right"><p><a onclick="$('#form-category').submit();"   title="<?php echo $button_save; ?>" data-toggle="tooltip" class="btn btn-success"><i class="fa fa-save"></i> <?php echo $button_save; ?></a></p></div><br>
                        <div class="clearfix"></div>
                        <form action="<?php echo $action_category; ?>" method="post" enctype="multipart/form-data" id="form-category">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover add_tbody">
                                <tr>
                                    <td><?php echo $entry_status; ?></td>
                                    <td>
                                        <select name="discountsales_category_status">
                                            <?php if ($discountsales_category_status) { ?>
                                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                            <?php } else { ?>
                                                <option value="1"><?php echo $text_enabled; ?></option>
                                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                            <?php } ?>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><?php echo $entry_sort_order; ?></td>
                                    <td>
                                        <input type="text" name="discountsales_category_sort_order" value="<?php echo $discountsales_category_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td><?php echo $entry_status_together; ?></td>
                                    <td>
                                        <select name="discountsales_category_status_together">
                                        <?php if ($discountsales_category_status_together) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $entry_status_together_disabled; ?></option>
                                        <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $entry_status_together_disabled; ?></option>
                                        <?php } ?>
                                        </select>
                                    </td>
                                </tr>
                             </table>
                        </div>

                        <div class="table-responsive">
                            <table id="discounts-category" class="table table-bordered table-hover">
                                <thead>
                                  <tr>
                                    <td class="left"><?php echo $entry_category; ?></td>
                                    <td class="left"><?php echo $entry_tax_class; ?></td>
                                    <td class="left hide_function"><span data-toggle="tooltip" title="" data-original-title="<?php echo $entry_sales_limitation_info ?>"><?php echo $entry_sales_limitation; ?></span></td>
                                    <td class="left"><?php echo $entry_delta; ?></td>
                                    
                                    <td><?php echo $entry_date_start; ?></td>
                                    <td><?php echo $entry_date_finish; ?></td>
                                    <td></td>
                                    <td></td>
                                  </tr>
                                </thead>
                                <?php $discount_category_row = 0; ?>
                                <?php foreach ($discountsales_category_discount as $discount) { ?>
                                <tbody  class="add_tbody" id="discount-row-category<?php echo $discount_category_row; ?>" style="border-left: 0px solid #<?php echo $discount['id_container'] ?>">
                                      <tr>
                                        <td class="left">
                                            <select style="width: 200px !important" name="discountsales_category_discount[<?php echo $discount_category_row; ?>][category_id]">
                                                <option value="0"><?php echo $entry_select; ?></option>
                                                <?php foreach ($categories as $category) { ?>
                                                <?php if ($category['category_id'] == $discount['category_id']) { ?>
                                                <option value="<?php echo $category['category_id']; ?>" selected="selected"><?php echo $category['name']; ?></option>
                                                <?php } else { ?>
                                                <option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
                                                <?php } ?>
                                                <?php } ?>
                                            </select>
                                        </td>
                                        <td class="left">
                                            <select name="discountsales_category_discount[<?php echo $discount_category_row; ?>][tax_class_id]">
                                                <option value="0"><?php echo $text_none; ?></option>
                                                <?php foreach ($tax_classes as $tax_class) { ?>
                                                <?php if ($tax_class['tax_class_id'] == $discount['tax_class_id']) { ?>
                                                <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                                                <?php } else { ?>
                                                <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                                                <?php } ?>
                                                <?php } ?>
                                            </select>
                                        </td>
                                        <td class="left hide_function">
                                            <!--<img style="display: none" src="<?php echo HTTP_SERVER; ?>/view/image/ocext/cart_ds.png" /> <input value="<?php echo $discount['sales_limitation'] ?>" name="discountsales_category_discount[<?php echo $discount_category_row; ?>][sales_limitation]" />-->
                                            <div>
                                            <?php if($discount['sales_limitation'] && $discount['sales_limitation']==1000000000){ ?>
                                                    
                                                    <input placeholder="<?php echo $entry_sales_limit_input ?>" type="hidden" value="<?php echo $discount['sales_limitation'] ?>" name="discountsales_category_discount[<?php echo $discount_category_row; ?>][sales_limitation]" />
                                                    <input onclick="getBigNumTo('discountsales_category_discount[<?php echo $discount_category_row; ?>][sales_limitation]')" type="checkbox" checked="" /> <?php echo $entry_apply_any_am_ord_link ?>
                                            
                                            <?php }else{ ?>
                                                    
                                                    <input placeholder="<?php echo $entry_sales_limit_input ?>" value="<?php echo $discount['sales_limitation'] ?>" name="discountsales_category_discount[<?php echo $discount_category_row; ?>][sales_limitation]" />
                                                    <input onclick="getBigNumTo('discountsales_category_discount[<?php echo $discount_category_row; ?>][sales_limitation]')" type="checkbox" /> <?php echo $entry_apply_any_am_ord_link ?>
                                            
                                            <?php } ?>
                                            </div>
                                        </td>
                                        <td class="left">
                                            <select name="discountsales_category_discount[<?php echo $discount_category_row; ?>][above_zero]">
                                              <?php if ($discount['above_zero']) { ?>
                                              <option value="0" ><?php echo $text_plus; ?></option>
                                              <option value="1" selected="selected"><?php echo $text_minus; ?></option>
                                              <?php } else { ?>
                                              <option value="0" selected="selected"><?php echo $text_plus; ?></option>
                                              <option value="1" ><?php echo $text_minus; ?></option>
                                              <?php } ?>
                                            </select>
                                            <input name="discountsales_category_discount[<?php echo $discount_category_row; ?>][value_data]" value="<?php echo $discount['value_data']; ?>" style="width: 50px;"/>
                                            <select name="discountsales_category_discount[<?php echo $discount_category_row; ?>][type_data]">
                                              <?php if ($discount['type_data']) { ?>
                                              <option value="0"><?php echo $text_money; ?></option>
                                              <option value="1" selected="selected"><?php echo $text_percent; ?></option>
                                              <?php } else { ?>
                                              <option value="0" selected="selected"><?php echo $text_money; ?></option>
                                              <option value="1"><?php echo $text_percent; ?></option>
                                              <?php } ?>
                                            </select>
                                        </td>
                                        
                                        
                                        
                                        <td style="width: 180px;" class="left">
                                            <div class="input-group date">
                                            <?php if (isset($discount['date_start']) && $discount['date_start']) { ?>
                                                <input type="text" name="discountsales_category_discount[<?php echo $discount_category_row; ?>][date_start]" value="<?php echo $discount['date_start']; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                                            <?php } else { ?>
                                                <input type="text" name="discountsales_category_discount[<?php echo $discount_category_row; ?>][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                                            <?php } ?>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                                </span>
                                            </div>
                                        </td>
                                        
                                        <td style="width: 180px;" class="left">
                                            <div class="input-group date">
                                            <?php if (isset($discount['date_finish']) && $discount['date_finish']) { ?>
                                                <input width="" type="text" name="discountsales_category_discount[<?php echo $discount_category_row; ?>][date_finish]" value="<?php echo $discount['date_finish']; ?>" placeholder="<?php echo $entry_date_finish; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                                            <?php } else { ?>
                                                <input type="text" name="discountsales_category_discount[<?php echo $discount_category_row; ?>][date_finish]" value="" placeholder="<?php echo $entry_date_finish; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                                            <?php } ?>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                                </span>
                                            </div>
                                        </td>
                                        
                                        
                                        <td>
                                            <select name="discountsales_category_discount[<?php echo $discount_category_row; ?>][status]">
                                            <?php if ($discount['status']) { ?>
                                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                            <option value="0" ><?php echo $text_disabled; ?></option>
                                            <?php } else { ?>
                                            <option value="1"><?php echo $text_enabled; ?></option>
                                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                            <?php } ?>
                                           </select>
                                        </td>
                                        <td class="left">
                                            <a title="<?php echo $button_remove; ?>" onclick="$('#discount-row-category<?php echo $discount_category_row; ?>').remove();" data-toggle="tooltip" class="btn btn-danger"><i class="fa fa-trash-o"></i></a>
                                        </td>
                                      </tr>
                                </tbody>
                                <?php $discount_category_row++; ?>
                                <?php } ?>
                                <tfoot>
                                  <tr>
                                      <td colspan="6" class="right">
                                          <a onclick="addDiscountCategoriesRow();" title="<?php echo $button_add_discount; ?>" data-toggle="tooltip" class="btn btn-primary"><i class="fa fa-plus"></i></a>
                                      </td>
                                  </tr>
                                </tfoot>
                            </table>
                        </div>
                    </form>
                        
                        
                        
                    </div>
                    
                    <div class="tab-pane" id="tab-manufacturer">
                        <div class="pull-right"><p><a onclick="$('#form-manufacturer').submit();"   title="<?php echo $button_save; ?>" data-toggle="tooltip" class="btn btn-success"><i class="fa fa-save"></i> <?php echo $button_save; ?></a></p></div><br>
                        <div class="clearfix"></div>
                        <form action="<?php echo $action_manufacturer; ?>" method="post" enctype="multipart/form-data" id="form-manufacturer">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover add_tbody">
                                <tr>
                                    <td><?php echo $entry_status; ?></td>
                                    <td>
                                        <select name="discountsales_manufacturer_status">
                                            <?php if ($discountsales_manufacturer_status) { ?>
                                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                                <option value="0"><?php echo $text_disabled; ?></option>
                                            <?php } else { ?>
                                                <option value="1"><?php echo $text_enabled; ?></option>
                                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                            <?php } ?>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><?php echo $entry_sort_order; ?></td>
                                    <td>
                                        <input type="text" name="discountsales_manufacturer_sort_order" value="<?php echo $discountsales_manufacturer_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td><?php echo $entry_status_together; ?></td>
                                    <td>
                                        <select name="discountsales_manufacturer_status_together">
                                        <?php if ($discountsales_manufacturer_status_together) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $entry_status_together_disabled; ?></option>
                                        <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $entry_status_together_disabled; ?></option>
                                        <?php } ?>
                                        </select>
                                    </td>
                                </tr>
                             </table>
                        </div>

                        <div class="table-responsive">
                            <table id="discounts-manufacturer" class="table table-bordered table-hover">
                                <thead>
                                  <tr>
                                    <td class="left"><?php echo $entry_manufacturer; ?></td>
                                    <td class="left"><?php echo $entry_tax_class; ?></td>
                                    <td class="left hide_function"><span data-toggle="tooltip" title="" data-original-title="<?php echo $entry_sales_limitation_info ?>"><?php echo $entry_sales_limitation; ?></span></td>
                                    <td class="left"><?php echo $entry_delta; ?></td>
                                    
                                    <td><?php echo $entry_date_start; ?></td>
                                    <td><?php echo $entry_date_finish; ?></td>
                                    <td><?php echo $entry_disable_on_this_categories; ?></td>
                                    <td><?php echo $entry_status; ?></td>
                                    <td></td>
                                  </tr>
                                </thead>
                                <?php $discount_manufacturer_row = 0; ?>
                                <?php foreach ($discountsales_manufacturer_discount as $discount) { ?>
                                <tbody  class="add_tbody" id="discount-row-manufacturer<?php echo $discount_manufacturer_row; ?>"  style="border-left: 0px solid #<?php echo $discount['id_container'] ?>">
                                      <tr>
                                        <td class="left">
                                            <select name="discountsales_manufacturer_discount[<?php echo $discount_manufacturer_row; ?>][manufacturer_id]">
                                                <option value="0"><?php echo $entry_select; ?></option>
                                                <?php foreach ($manufacturers as $manufacturer) { ?>
                                                <?php if ($manufacturer['manufacturer_id'] == $discount['manufacturer_id']) { ?>
                                                <option value="<?php echo $manufacturer['manufacturer_id']; ?>" selected="selected"><?php echo $manufacturer['name']; ?></option>
                                                <?php } else { ?>
                                                <option value="<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo $manufacturer['name']; ?></option>
                                                <?php } ?>
                                                <?php } ?>
                                            </select>
                                        </td>
                                        <td class="left">
                                            <select name="discountsales_manufacturer_discount[<?php echo $discount_manufacturer_row; ?>][tax_class_id]">
                                                <option value="0"><?php echo $text_none; ?></option>
                                                <?php foreach ($tax_classes as $tax_class) { ?>
                                                <?php if ($tax_class['tax_class_id'] == $discount['tax_class_id']) { ?>
                                                <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                                                <?php } else { ?>
                                                <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                                                <?php } ?>
                                                <?php } ?>
                                            </select>
                                        </td>
                                        <td class="left hide_function">
                                            
                                            <div>
                                            <?php if($discount['sales_limitation'] && $discount['sales_limitation']==1000000000){ ?>
                                                    
                                                    <input placeholder="<?php echo $entry_sales_limit_input ?>" type="hidden" value="<?php echo $discount['sales_limitation'] ?>" name="discountsales_manufacturer_discount[<?php echo $discount_manufacturer_row; ?>][sales_limitation]" />
                                                    <input onclick="getBigNumTo('discountsales_manufacturer_discount[<?php echo $discount_manufacturer_row; ?>][sales_limitation]')" type="checkbox" checked="" /> <?php echo $entry_apply_any_am_ord_link ?>
                                            
                                            <?php }else{ ?>
                                                    
                                                    <input placeholder="<?php echo $entry_sales_limit_input ?>" value="<?php echo $discount['sales_limitation'] ?>" name="discountsales_manufacturer_discount[<?php echo $discount_manufacturer_row; ?>][sales_limitation]" />
                                                    <input onclick="getBigNumTo('discountsales_manufacturer_discount[<?php echo $discount_manufacturer_row; ?>][sales_limitation]')" type="checkbox" /> <?php echo $entry_apply_any_am_ord_link ?>
                                            
                                            <?php } ?>
                                            </div>
                                                
                                        </td>
                                        <td class="left">
                                            <select name="discountsales_manufacturer_discount[<?php echo $discount_manufacturer_row; ?>][above_zero]">
                                              <?php if ($discount['above_zero']) { ?>
                                              <option value="0" ><?php echo $text_plus; ?></option>
                                              <option value="1" selected="selected"><?php echo $text_minus; ?></option>
                                              <?php } else { ?>
                                              <option value="0" selected="selected"><?php echo $text_plus; ?></option>
                                              <option value="1" ><?php echo $text_minus; ?></option>
                                              <?php } ?>
                                            </select>
                                            <input name="discountsales_manufacturer_discount[<?php echo $discount_manufacturer_row; ?>][value_data]" value="<?php echo $discount['value_data']; ?>" style="width: 50px;"/>
                                            <select name="discountsales_manufacturer_discount[<?php echo $discount_manufacturer_row; ?>][type_data]">
                                              <?php if ($discount['type_data']) { ?>
                                              <option value="0"><?php echo $text_money; ?></option>
                                              <option value="1" selected="selected"><?php echo $text_percent; ?></option>
                                              <?php } else { ?>
                                              <option value="0" selected="selected"><?php echo $text_money; ?></option>
                                              <option value="1"><?php echo $text_percent; ?></option>
                                              <?php } ?>
                                            </select>
                                        </td>
                                        
                                        
                                        <td style="width: 180px;" class="left">
                                            <div class="input-group date">
                                            <?php if (isset($discount['date_start']) && $discount['date_start']) { ?>
                                                <input type="text" name="discountsales_manufacturer_discount[<?php echo $discount_manufacturer_row; ?>][date_start]" value="<?php echo $discount['date_start']; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                                            <?php } else { ?>
                                                <input type="text" name="discountsales_manufacturer_discount[<?php echo $discount_manufacturer_row; ?>][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                                            <?php } ?>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                                </span>
                                            </div>
                                        </td>
                                        
                                        <td style="width: 180px;" class="left">
                                            <div class="input-group date">
                                            <?php if (isset($discount['date_finish']) && $discount['date_finish']) { ?>
                                                <input width="" type="text" name="discountsales_manufacturer_discount[<?php echo $discount_manufacturer_row; ?>][date_finish]" value="<?php echo $discount['date_finish']; ?>" placeholder="<?php echo $entry_date_finish; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                                            <?php } else { ?>
                                                <input type="text" name="discountsales_manufacturer_discount[<?php echo $discount_manufacturer_row; ?>][date_finish]" value="" placeholder="<?php echo $entry_date_finish; ?>" data-date-format="YYYY-MM-DD" class="form-control" />
                                            <?php } ?>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                                </span>
                                            </div>
                                        </td>
                                        
                                        
                                        <td>
                                            <?php if($discountsales_disable_data_categories){ ?>
                                                
                                                <select name="discountsales_manufacturer_discount[<?php echo $discount_manufacturer_row; ?>][disable_categories]">
                                                    <option value="0"><?php echo $text_disabled; ?></option>
                                                    <?php foreach($discountsales_disable_data_categories as $disable_data_categories_row_id=>$disable_data_categories_row){ ?>
                                                        <?php if (isset($discount['disable_categories']) && $discount['disable_categories'] && $disable_data_categories_row_id==$discount['disable_categories']) { ?>
                                                            <option value="<?php echo $disable_data_categories_row_id ?>" selected="selected"><?php echo $disable_data_categories_row['name'] ?></option>
                                                        <?php } else { ?>
                                                            <option value="<?php echo $disable_data_categories_row_id ?>" ><?php echo $disable_data_categories_row['name'] ?></option>
                                                        <?php } ?>
                                                    <?php } ?>
                                               </select>
                                            
                                            <?php }else{
                                                echo $entry_disable_need_create;
                                            } ?>
                                        </td>
                                        
                                        <td>
                                            <select name="discountsales_manufacturer_discount[<?php echo $discount_manufacturer_row; ?>][status]">
                                            <?php if ($discount['status']) { ?>
                                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                            <option value="0" ><?php echo $text_disabled; ?></option>
                                            <?php } else { ?>
                                            <option value="1"><?php echo $text_enabled; ?></option>
                                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                            <?php } ?>
                                           </select>
                                        </td>
                                        <td class="left">
                                            <a title="<?php echo $button_remove; ?>" onclick="$('#discount-row-manufacturer<?php echo $discount_manufacturer_row; ?>').remove();" data-toggle="tooltip" class="btn btn-danger"><i class="fa fa-trash-o"></i></a>
                                        </td>
                                      </tr>
                                </tbody>
                                <?php $discount_manufacturer_row++; ?>
                                <?php } ?>
                                <tfoot>
                                  <tr>
                                      <td colspan="8" class="right">
                                          <a onclick="addDiscountManufacturersRow();" title="<?php echo $button_add_discount; ?>" data-toggle="tooltip" class="btn btn-primary"><i class="fa fa-plus"></i></a>
                                      </td>
                                  </tr>
                                </tfoot>
                            </table>
                        </div>
                    </form>
                        
                        
                        
                    
                        
                        
                        
                        
                    </div>
                    
                </div>
            </div>
        </div>
        <hr>
        <?php if ((!$error_warning) && (!$success)) { ?>
        <div id="ocext_notification" class="alert alert-info"><i class="fa fa-info-circle"></i>
                <div id="ocext_loading"><img src="<?php echo HTTP_SERVER; ?>/view/image/ocext/loading.gif" /><?php echo $text_loading_notifications; ?></div>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
    </div>
</div>
<script type="text/javascript"><!--
var row = <?php echo $discount_row; ?>;
var row_category = <?php echo $discount_category_row; ?>;
var row_manufacturer = <?php echo $discount_manufacturer_row; ?>;
var row_complect = <?php echo $discount_complect_row; ?>;

function delComplectProduct(num_row,product_id){
    $('#product-complect' + num_row + '' + product_id).remove();
    $('#product-quantity' + num_row + '' + product_id).remove();
}


function getBigNumTo(nameInput){
    
    
    var elParent = $("input[name='"+nameInput+"']").parent('div');
    
    if(elParent.children("input[type='checkbox']").prop('checked')){
        
        elParent.children("input[name='"+nameInput+"']").attr('type','hidden');
        elParent.children("input[name='"+nameInput+"']").attr('value',1000000000);
        
    }else{
        
        elParent.children("input[name='"+nameInput+"']").attr('type','text');
        elParent.children("input[name='"+nameInput+"']").val('');
        
    }

}

function autoCompliteComplects(selectorInput,thisRowComplect){
    $(selectorInput).autocomplete({
            'source': function(request, response) {
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
            'select': function(item) {
                    $(selectorInput).val('');

                    $('#product-complect' + thisRowComplect + item['value']).remove();
                    $('#product-quantity' + thisRowComplect + item['value']).remove();

                    $('#product-complect' + thisRowComplect).append('<div id="product-complect' + thisRowComplect + item['value'] + '"><i onclick="delComplectProduct('+thisRowComplect+','+item['value']+')" class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="discountsales_complect_discount[' + thisRowComplect + '][products][' + item['value'] + '][product_id]" value="' + item['value'] + '" /><input type="hidden" name="discountsales_complect_discount[' + thisRowComplect + '][products][' + item['value'] + '][name]" value="' + item['label'] + '" /></div>');	
                    $('#product-quantity' + thisRowComplect).append('<div id="product-quantity' + thisRowComplect + item['value'] + '"><div>' + item['label'] + ':</div><input  placeholder="<?php echo $text_quantity_products ?>" style="width: 80px;"   name="discountsales_complect_discount[' + thisRowComplect + '][product_quantity][' + item['value'] + '][quantity]" value="" /> <input   placeholder="<?php echo $text_new_price ?>"   style="width: 80px;"   name="discountsales_complect_discount[' + thisRowComplect + '][product_quantity][' + item['value'] + '][new_price]" value="" /><input name="discountsales_complect_discount[' + thisRowComplect + '][product_quantity][' + item['value'] + '][name]" value="' + item['label'] +  '" type="hidden" /><hr style="margin-bottom: 2px; margin-top: 5px;">');	
            }	
    });
}

function addDisableDataRow(idWell,idWellNum,type,valueData){
    var row = valueData.split('_____');
    if(typeof row[0] == 'undefined' || typeof row[1] == 'undefined'){
        return;
    }
    var name_data = row[1];
    var id_data = row[0];
    var html = '';
    html += '<div id="'+ idWell + id_data +'">';
    html += '<i onclick="delDisableDataRow(\''+ idWell + id_data +'\')" class="fa fa-minus-circle"></i> ';
    html += '<input type="hidden" value="' + id_data + '" name="discountsales_disable_data_'+type+'[' + idWellNum + '][data][' + id_data + ']" />';
    html += name_data + '</div>';
    $("#"+idWell).append(html);
}

function delDisableDataRow(id_row){
    $('#' + id_row).remove();
}

function addDiscountCategoriesRow(){
    html  = '<tbody class="add_tbody" id="discount-row-category' + row_category + '"><tr><td class="left">';
    html += '<select  style="width: 200px !important" name="discountsales_category_discount[' + row_category + '][category_id]"><option value="0"><?php echo $entry_select; ?></option>';
    <?php foreach ($categories as $category) { ?>
        html += '<option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>';
    <?php } ?>
    html += '</select>';
    html += '</td><td class="left">';
    html += '<select name="discountsales_category_discount[' + row_category + '][tax_class_id]">';
    html += '<option value="0"><?php echo $text_none; ?></option>';
    <?php foreach ($tax_classes as $tax_class) { ?>
        html += '<option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>';
    <?php } ?>
    html += '</select>';
    html += '</td><td class="left hide_function">';
    html += '<div><input placeholder="<?php echo $entry_sales_limit_input ?>" type="hidden" value="1000000000" name="discountsales_category_discount[' + row_category + '][sales_limitation]" /> <input onclick="getBigNumTo(\'discountsales_category_discount[' + row_category + '][sales_limitation]\')" type="checkbox" checked="" /> <?php echo $entry_apply_any_am_ord_link ?></div>';
    html += '</td><td class="left">';
    html += '<select name="discountsales_category_discount[' + row_category + '][above_zero]">';
    html += '<option value="0" selected="selected"><?php echo $text_plus; ?></option>';
    html += '<option value="1" ><?php echo $text_minus; ?></option>';
    html += '</select>';
    html += '<input name="discountsales_category_discount[' + row_category + '][value_data]" value="" />';
    html += '<select name="discountsales_category_discount[' + row_category + '][type_data]">';
    html += '<option value="0" selected="selected"><?php echo $text_money; ?></option>';
    html += '<option value="1"><?php echo $text_percent; ?></option>';
    html += '</select>';
    html += '</td><td style="width: 180px;" class="left">';
    html += '<div class="input-group date">';
    html += '        <input type="text" name="discountsales_category_discount[' + row_category + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />';
    html += '        <span class="input-group-btn">';
    html += '            <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>';
    html += '         </span>';
    html += '    </div>';
    html += '</td><td style="width: 180px;" class="left">';
    html += '    <div class="input-group date">';
    html += '        <input type="text" name="discountsales_category_discount[' + row_category + '][date_finish]" value="" placeholder="<?php echo $entry_date_finish; ?>" data-date-format="YYYY-MM-DD" class="form-control" />';
    html += '        <span class="input-group-btn">';
    html += '            <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>';
    html += '        </span>';
    html += '    </div>';
    html += '</td><td class="left">';
    html += '<select name="discountsales_category_discount[' + row_category + '][status]">';
    html += '<option value="1"><?php echo $text_enabled; ?></option>';
    html += '<option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
    html += '</select>';
    html += '</td><td class="left">'
    html += '<a title="<?php echo $button_remove; ?>" onclick="$(\'#discount-row-category' + row_category + '\').remove();" data-toggle="tooltip" class="btn btn-danger"><i class="fa fa-trash-o"></i></a>';
    html += '</td></tr></tbody>';
    $('#discounts-category tfoot').before(html);
    row_category++;
    $('.date').datetimepicker({
        pickTime: false
    });
}

function addDiscountManufacturersRow(){
    html  = '<tbody class="add_tbody" id="discount-row-manufacturer' + row_manufacturer + '"><tr><td class="left">';
    html += '<select name="discountsales_manufacturer_discount[' + row_manufacturer + '][manufacturer_id]"><option value="0"><?php echo $entry_select; ?></option>';
    <?php foreach ($manufacturers as $manufacturer) { ?>
        html += '<option value="<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo $manufacturer['name']; ?></option>';
    <?php } ?>
    html += '</select>';
    html += '</td><td class="left">';
    html += '<select name="discountsales_manufacturer_discount[' + row_manufacturer + '][tax_class_id]">';
    html += '<option value="0"><?php echo $text_none; ?></option>';
    <?php foreach ($tax_classes as $tax_class) { ?>
        html += '<option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>';
    <?php } ?>
    html += '</select>';
    html += '</td><td class="left hide_function">';
    html += '<div><input placeholder="<?php echo $entry_sales_limit_input ?>" type="hidden" value="1000000000"  name="discountsales_manufacturer_discount[' + row_manufacturer + '][sales_limitation]" /> <input onclick="getBigNumTo(\'discountsales_manufacturer_discount[' + row_manufacturer + '][sales_limitation]\')" type="checkbox" checked="" /> <?php echo $entry_apply_any_am_ord_link ?></div>';
    html += '</td><td class="left">';
    html += '<select name="discountsales_manufacturer_discount[' + row_manufacturer + '][above_zero]">';
    html += '<option value="0" selected="selected"><?php echo $text_plus; ?></option>';
    html += '<option value="1" ><?php echo $text_minus; ?></option>';
    html += '</select>';
    html += '<input name="discountsales_manufacturer_discount[' + row_manufacturer + '][value_data]" value="" />';
    html += '<select name="discountsales_manufacturer_discount[' + row_manufacturer + '][type_data]">';
    html += '<option value="0" selected="selected"><?php echo $text_money; ?></option>';
    html += '<option value="1"><?php echo $text_percent; ?></option>';
    html += '</select>';
    html += '</td><td style="width: 180px;" class="left">';
    html += '<div class="input-group date">';
    html += '        <input type="text" name="discountsales_manufacturer_discount[' + row_manufacturer + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />';
    html += '        <span class="input-group-btn">';
    html += '            <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>';
    html += '         </span>';
    html += '    </div>';
    html += '</td><td style="width: 180px;" class="left">';
    html += '    <div class="input-group date">';
    html += '        <input type="text" name="discountsales_manufacturer_discount[' + row_manufacturer + '][date_finish]" value="" placeholder="<?php echo $entry_date_finish; ?>" data-date-format="YYYY-MM-DD" class="form-control" />';
    html += '        <span class="input-group-btn">';
    html += '            <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>';
    html += '        </span>';
    html += '    </div>';
    
    html += '</td><td class="left">';
        <?php if($discountsales_disable_data_categories){ ?>
            html += '<select name="discountsales_manufacturer_discount[' + row_manufacturer + '][disable_categories]">';
                html += '<option value="0"><?php echo $text_disabled; ?></option>';
                <?php foreach($discountsales_disable_data_categories as $disable_data_categories_row_id=>$disable_data_categories_row){ ?>
                    <?php if (isset($discount['disable_categories']) && $discount['disable_categories'] && $disable_data_categories_row_id==$discount['disable_categories']) { ?>
                        html += '<option value="<?php echo $disable_data_categories_row_id ?>" selected="selected"><?php echo $disable_data_categories_row['name'] ?></option>';
                    <?php } else { ?>
                        html += '<option value="<?php echo $disable_data_categories_row_id ?>" ><?php echo $disable_data_categories_row['name'] ?></option>';
                    <?php } ?>
                <?php } ?>
           html += '</select>';
        <?php }else{ ?>
        html += '<?php echo $entry_disable_need_create ?>';
        <?php } ?>
    html += '</td><td class="left">';
    html += '<select name="discountsales_manufacturer_discount[' + row_manufacturer + '][status]">';
    html += '<option value="1"><?php echo $text_enabled; ?></option>';
    html += '<option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
    html += '</select>';
    html += '</td><td class="left">'
    html += '<a title="<?php echo $button_remove; ?>" onclick="$(\'#discount-row-manufacturer' + row_manufacturer + '\').remove();" data-toggle="tooltip" class="btn btn-danger"><i class="fa fa-trash-o"></i></a>';
    html += '</td></tr></tbody>';
    $('#discounts-manufacturer tfoot').before(html);
    row_manufacturer++;
    $('.date').datetimepicker({
        pickTime: false
    });
}

function addDiscountSalesRow() {
    html  = '<tbody class="add_tbody" id="discount-row' + row + '"><tr><td class="left">';
    html += '<select name="discountsales_discount[' + row + '][payment_code]"><option value="0"><?php echo $text_none_all_payments; ?></option>';
    <?php foreach ($payments as $payment) { ?>
        html += '<option value="<?php echo $payment['code']; ?>"><?php echo $payment['title']; ?></option>';
    <?php } ?>
    html += '</select>';
    html += '</td><td class="left">';
    html += '<select name="discountsales_discount[' + row + '][tax_class_id]">';
    html += '<option value="0"><?php echo $text_none; ?></option>';
    <?php foreach ($tax_classes as $tax_class) { ?>
        html += '<option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>';
    <?php } ?>
    html += '</select>';
    html += '</td><td class="left">';
    html += '<div><input placeholder="<?php echo $entry_sales_limit_input ?>" type="hidden"  value="1000000000" name="discountsales_discount[' + row + '][sales_limitation]" /> <input onclick="getBigNumTo(\'discountsales_discount[' + row + '][sales_limitation]\')" type="checkbox" checked="" /> <?php echo $entry_apply_any_am_ord_link ?></div>';
    html += '</td><td class="left">';
    html += '<select name="discountsales_discount[' + row + '][above_zero]">';
    html += '<option value="0" selected="selected"><?php echo $text_plus; ?></option>';  
    html += '<option value="1" ><?php echo $text_minus; ?></option>';
    html += '</select>';
    html += '<input name="discountsales_discount[' + row + '][value_data]" value="" />';
    html += '<select name="discountsales_discount[' + row + '][type_data]">';
    html += '<option value="0" selected="selected"><?php echo $text_money; ?></option>';
    html += '<option value="1"><?php echo $text_percent; ?></option>';
    html += '</select>';
    html += '</td><td style="width: 180px;" class="left">';
    html += '<div class="input-group date">';
    html += '        <input type="text" name="discountsales_discount[' + row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />';
    html += '        <span class="input-group-btn">';
    html += '            <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>';
    html += '         </span>';
    html += '    </div>';
    html += '</td><td style="width: 180px;" class="left">';
    html += '    <div class="input-group date">';
    html += '        <input type="text" name="discountsales_discount[' + row + '][date_finish]" value="" placeholder="<?php echo $entry_date_finish; ?>" data-date-format="YYYY-MM-DD" class="form-control" />';
    html += '        <span class="input-group-btn">';
    html += '            <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>';
    html += '        </span>';
    html += '    </div>';
    html += '</td><td class="left">';
        <?php if($discountsales_disable_data_categories){ ?>
            html += '<select name="discountsales_discount[' + row + '][disable_categories]">';
                html += '<option value="0"><?php echo $text_disabled; ?></option>';
                <?php foreach($discountsales_disable_data_categories as $disable_data_categories_row_id=>$disable_data_categories_row){ ?>
                    <?php if (isset($discount['disable_categories']) && $discount['disable_categories'] && $disable_data_categories_row_id==$discount['disable_categories']) { ?>
                        html += '<option value="<?php echo $disable_data_categories_row_id ?>" selected="selected"><?php echo $disable_data_categories_row['name'] ?></option>';
                    <?php } else { ?>
                        html += '<option value="<?php echo $disable_data_categories_row_id ?>" ><?php echo $disable_data_categories_row['name'] ?></option>';
                    <?php } ?>
                <?php } ?>
           html += '</select>';
        <?php }else{ ?>
        html += '<?php echo $entry_disable_need_create ?>';
        <?php } ?>
    html += '</td><td class="left">';
    html += '<select name="discountsales_discount[' + row + '][status]">';
    html += '<option value="1"><?php echo $text_enabled; ?></option>';
    html += '<option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
    html += '</select>';
    html += '</td><td class="left">'
    html += '<a title="<?php echo $button_remove; ?>" onclick="$(\'#discount-row' + row + '\').remove();" data-toggle="tooltip" class="btn btn-danger"><i class="fa fa-trash-o"></i></a>';
    html += '</td></tr></tbody>';
    $('#discounts tfoot').before(html);
    row++;
    $('.date').datetimepicker({
        pickTime: false
    });
}


function addDiscountComplectsRow(){
    html  = '<tbody class="add_tbody" id="discount-row-complect' + row_complect + '"><tr><td colspan="7">';
    html  += '<?php echo $entry_name_complect; ?>: <input style="width:50%" value="" name="discountsales_complect_discount[' + row_complect + '][name_complect]" />';                           
    html += '</td></tr><tr><td class="left">';
    html += '<input type="text" name="complect" value="" placeholder="<?php echo $entry_complect_product; ?>" id="input-complect' + row_complect + '" onkeypress="autoCompliteComplects(\'#input-complect' + row_complect + '\',' + row_complect + ')" class="form-control" />';
    html += '<div id="product-complect' + row_complect + '" class="well well-sm" style="height: 65px; overflow: auto;">';
    html += '</div>';
    html += '</td><td class="left">';
    html += '<div id="product-quantity' + row_complect + '" class="well well-sm" style="height: 100px; overflow: auto;">';
    html += '</div>';
    html += '</td><td class="left">';
    html += '<select name="discountsales_complect_discount[' + row_complect + '][tax_class_id]">';
    html += '<option value="0"><?php echo $text_none; ?></option>';
    <?php foreach ($tax_classes as $tax_class) { ?>
        html += '<option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>';
    <?php } ?>
    html += '</select>';
    html += '</td><td class="left hide_function">';
    html += '<div><input placeholder="<?php echo $entry_sales_limit_input ?>" type="hidden"  value="1000000000" name="discountsales_complect_discount[' + row_complect + '][sales_limitation]" /> <input onclick="getBigNumTo(\'discountsales_complect_discount[' + row_complect + '][sales_limitation]\')" type="checkbox" checked="" /> <?php echo $entry_apply_any_am_ord_link ?></div>';
    html += '</td><td class="left">';
    html += '<select name="discountsales_complect_discount[' + row_complect + '][above_zero]">';
    html += '<option value="0" selected="selected"><?php echo $text_plus; ?></option>';
    html += '<option value="1" ><?php echo $text_minus; ?></option>';
    html += '</select>';
    html += '<input name="discountsales_complect_discount[' + row_complect + '][value_data]" value="" />';
    html += '<select name="discountsales_complect_discount[' + row_complect + '][type_data]">';
    html += '<option value="0" selected="selected"><?php echo $text_money; ?></option>';
    html += '<option value="1"><?php echo $text_percent; ?></option>';
    html += '</select>';
    html += '</td><td style="width: 180px;" class="left">';
    html += '<div class="input-group date">';
    html += '        <input type="text" name="discountsales_complect_discount[' + row_complect + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" />';
    html += '        <span class="input-group-btn">';
    html += '            <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>';
    html += '         </span>';
    html += '    </div>';
    html += '</td><td style="width: 180px;" class="left">';
    html += '    <div class="input-group date">';
    html += '        <input type="text" name="discountsales_complect_discount[' + row_complect + '][date_finish]" value="" placeholder="<?php echo $entry_date_finish; ?>" data-date-format="YYYY-MM-DD" class="form-control" />';
    html += '        <span class="input-group-btn">';
    html += '            <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>';
    html += '        </span>';
    html += '    </div>';
    html += '</td><td class="left">';
    html += '<select name="discountsales_complect_discount[' + row_complect + '][other_discount]">';
    html += '<option value="1"><?php echo $text_enabled; ?></option>';
    html += '<option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
    html += '</select>';
    html += '</td><td class="left">';
    html += '<select name="discountsales_complect_discount[' + row_complect + '][status]">';
    html += '<option value="1"><?php echo $text_enabled; ?></option>';
    html += '<option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
    html += '</select>';
    html += '</td><td class="left">'
    html += '<a title="<?php echo $button_remove; ?>" onclick="$(\'#discount-row-complect' + row_complect + '\').remove();" data-toggle="tooltip" class="btn btn-danger"><i class="fa fa-trash-o"></i></a>';
    html += '</td></tr></tbody>';
    $('#discounts-complect tfoot').before(html);
    row_complect++;
    $('.date').datetimepicker({
        pickTime: false
    });
}



function getNotifications() {
	$.ajax({
            type: 'GET',
            url: 'index.php?route=total/discountsales/getNotifications&token=<?php echo $token; ?>',
            dataType: 'json',
            success: function(json) {
                    if (json['error']) {
                            $('#ocext_notification').html('<i class="fa fa-info-circle"></i><button type="button" class="close" data-dismiss="alert">&times;</button> '+json['error']+' <span style="cursor:pointer;font-weight:bold;text-decoration:underline;float:right;" onclick="getNotifications();"></span>');
                    } else if (json['message'] && json['message']!='' ) {
                            $('#ocext_notification').html('<i class="fa fa-info-circle"></i><button type="button" class="close" data-dismiss="alert">&times;</button> '+json['message']);
                    }else{
                        $('#ocext_notification').remove();
                    }
            },
            failure: function(){
                    $('#ocext_notification').remove();
            },
            error: function() {
                    $('#ocext_notification').remove();
            }
    });
}
getNotifications();


$('.date').datetimepicker({
    pickTime: false
});

//JQUERY COLOR PICKER 

//--></script>


<?php echo $footer; ?> 