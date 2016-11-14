<?php
class ControllerPaymentKaznachey extends Controller {
	
	public $paymentKaznacheyUrl = "http://payment.kaznachey.net/api/PaymentInterface/";
	
	public function index() {
		$data['button_confirm'] = $this->language->get('button_confirm');

		$this->load->model('checkout/order');

		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

		$data['action'] = $this->url->link('payment/kaznachey/pay', '', 'SSL');

		$cc_types = $this->GetMerchnatInfo();
		if(isset($cc_types)){
			$data['cc_type'] = '<select name="cc_type" id="cc_type">';
			if(isset($cc_types["PaySystems"]))
			{
				foreach ($cc_types["PaySystems"] as $paysystem)
				{
					$data['cc_type'] .= '<option value="'.$paysystem['Id'].'">'.$paysystem['PaySystemName'].'</option>';
				}
			}
			$data['cc_type'] .= '</select>';
			$data['cc_agreed'] = " <input type='checkbox' class='form-checkbox' name='cc_agreed' id='cc_agreed' checked><label for='edit-panes-payment-details-cc-agreed'><a href='$cc_types[TermToUse]'  target='_blank' >Согласен с условиями использования</a></label>";
			
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/kaznachey.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/payment/kaznachey.tpl', $data);
		} else {
			return $this->load->view('default/template/payment/kaznachey.tpl', $data);
		}
	}

 	public function callback() {
		$request_json = file_get_contents('php://input');
		$request = json_decode($request_json, true);

		$request_sign = md5($request["ErrorCode"].
			$request["OrderId"].
			$request["MerchantInternalPaymentId"]. 
			$request["MerchantInternalUserId"]. 
			number_format($request["OrderSum"],2,".",""). 
			number_format($request["Sum"],2,".",""). 
			strtoupper($request["Currency"]). 
			$request["CustomMerchantInfo"]. 
			strtoupper($this->config->get('kaznachey_merchnatSecretKey')));
		
			if($request['SignatureEx'] == $request_sign) {
				$this->load->model('checkout/order');
				$this->model_checkout_order->addOrderHistory($request["MerchantInternalPaymentId"], $this->config->get('config_order_status_id'));
			}
	} 
	
	public function success() {
	if(isset($_GET['Result']))
	{
		if ($_GET['Result'] == 'success'){
			$this->response->redirect($this->url->link('checkout/success', '', 'SSL'));
		}		
		
		if ($_GET['Result'] == 'deferred'){
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/kaznachey_deferred.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/payment/kaznachey_deferred.tpl', $data);
			} else {
				return $this->load->view('default/template/payment/kaznachey_deferred.tpl', $data);
			}
		}
	}
  }
	
  public function pay(){
  
    if(isset($this->session->data['order_id'])){
		$order_id = $this->session->data['order_id'];
	}else {
		return false;
	}
	
	$this->load->model('checkout/order');

	$order_info = $this->model_checkout_order->getOrder($order_id);

	$request["MerchantGuid"] = $this->config->get('kaznachey_merchant');
	$request['SelectedPaySystemId'] = isset($this->request->post['cc_type']) ? $this->request->post['cc_type'] : $this->GetMerchnatInfo(false, true);
	$request['Currency'] = (isset($order_info['currency_code'])) ? $order_info['currency_code'] : 'UAH';
	$request['Language'] = $this->language->get('code');
	
	if (!$this->cart->hasProducts() || $this->cart->hasProducts() == 0) {
		$this->session->data['error'] = 'ERROR:no products in cart';
		$this->response->redirect($this->url->link('checkout/cart', '', 'SSL'));
	}

	$sum=$qty=0;
	foreach ($this->cart->getProducts() as $product) {
		$request['Products'][] = array(
			"ProductId" => $product['model'],
			"ProductName" => $product['name'],
			"ProductPrice" => $product['price'],
			"ProductItemsNum" => $product['quantity'],
			"ImageUrl" => (isset($product['image']))?'http://'.$_SERVER['HTTP_HOST'] .'/image/'. $product['image']:'',
		);
		$sum += $product['price'] * $product['quantity'];
		$qty += $product['quantity'];
	}
	
	if($sum != $order_info['total']){
		$sum += $order_info_total = (int) ($order_info['total'] - $sum);
		$request['Products'][] = array(
			"ProductId" => '1',
			"ProductName" => 'Delivery',
			"ProductPrice" => $order_info_total,
			"ProductItemsNum" => 1,
			"ImageUrl" => '',
		);
		$qty++;
	}
	
	$statusUrl = $this->url->link('payment/kaznachey/callback', '', 'SSL');
	$returnUrl = 'http://'.$_SERVER['HTTP_HOST']  . '/kaznachey_result.php';

    $request['PaymentDetails'] = array(
       "MerchantInternalPaymentId"=>"$order_id",
       "MerchantInternalUserId"=>"$order_info[customer_id]",
       "EMail"=>"$order_info[email]",
       "PhoneNumber"=>"$order_info[telephone]",
       "CustomMerchantInfo"=>"",
       "StatusUrl"=>"$statusUrl",
       "ReturnUrl"=>"$returnUrl",
       "BuyerCountry"=>"$order_info[payment_country]",
       "BuyerFirstname"=>"$order_info[payment_firstname]",
       "BuyerPatronymic"=>"1",
       "BuyerLastname"=>"$order_info[payment_lastname]",
       "BuyerStreet"=>"$order_info[payment_address_1]",
       "BuyerZone"=>"$order_info[payment_zone]",
       "BuyerZip"=>"$order_info[payment_zone_id]",
       "BuyerCity"=>"$order_info[payment_city]",

       "DeliveryFirstname"=>"$order_info[shipping_firstname]",
       "DeliveryLastname"=>"$order_info[shipping_lastname]",
       "DeliveryZip"=>"$order_info[shipping_zone_id]",
       "DeliveryCountry"=>"$order_info[shipping_country]",
       "DeliveryPatronymic"=>"1",
       "DeliveryStreet"=>"$order_info[shipping_address_1]",
       "DeliveryCity"=>"$order_info[shipping_city]",
       "DeliveryZone"=>"$order_info[shipping_zone]",
    );
	
	$request["Signature"] = md5(strtoupper($request["MerchantGuid"]) .
		number_format($sum, 2, ".", "") . 
		$request["SelectedPaySystemId"] . 
		$request["PaymentDetails"]["EMail"] . 
		$request["PaymentDetails"]["PhoneNumber"] . 
		$request["PaymentDetails"]["MerchantInternalUserId"] . 
		$request["PaymentDetails"]["MerchantInternalPaymentId"] . 
		strtoupper($request["Language"]) . 
		strtoupper($request["Currency"]) . 
		strtoupper($this->config->get('kaznachey_merchnatSecretKey')));
		
		$response = $this->sendRequestKaznachey(json_encode($request), "CreatePaymentEx");
		$result = json_decode($response, true);

		if($result['ErrorCode'] != 0){
			$this->session->data['error'] = 'Kaznachey payment error'.$result['ErrorCode'];
			$this->response->redirect($this->url->link('checkout/checkout', '', 'SSL'));
		}
		
		echo base64_decode($result["ExternalForm"]);
	
		//Очистка корзины
		unset($this->session->data['cart']);
	}
	
	function GetMerchnatInfo($id = false, $first = false){
		$requestMerchantInfo = Array(
			"MerchantGuid"=>$this->config->get('kaznachey_merchant'),
			"Signature" => md5(strtoupper($this->config->get('kaznachey_merchant')) . strtoupper($this->config->get('kaznachey_merchnatSecretKey')))
		);

		$resMerchantInfo = json_decode($this->sendRequestKaznachey(json_encode($requestMerchantInfo), 'GetMerchatInformation'),true); 
		if($first){
			return $resMerchantInfo["PaySystems"][0]['Id'];
		}elseif($id)
		{
			foreach ($resMerchantInfo["PaySystems"] as $key=>$paysystem)
			{
				if($paysystem['Id'] == $id){
					return $paysystem;
				}
			}
		}else{
			return $resMerchantInfo;
		}
	}

	protected function sendRequestKaznachey($jsonData, $method){
		$curl = curl_init();
		if (!$curl)
			return false;

		curl_setopt($curl, CURLOPT_URL, $this->paymentKaznacheyUrl . $method);
		curl_setopt($curl, CURLOPT_POST, true);
		curl_setopt($curl, CURLOPT_HTTPHEADER,
			array("Expect: ", "Content-Type: application/json; charset=UTF-8", 'Content-Length: '
				. strlen($jsonData)));
		curl_setopt($curl, CURLOPT_POSTFIELDS, $jsonData);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, True);
		$response = curl_exec($curl);
		curl_close($curl);

		return $response;
	}
}