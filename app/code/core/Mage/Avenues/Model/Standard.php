<?php
class Mage_avenues_Model_Standard extends Mage_Payment_Model_Method_Abstract
{
    protected $_code  = 'avenues_standard';
    protected $_formBlockType = 'avenues/standard_form';

    
    public function getConfig()
    {
        return Mage::getSingleton('avenues/config');
    }

    public function validate()
    {
        parent::validate();
        $paymentInfo = $this->getInfoInstance();
        if ($paymentInfo instanceof Mage_Sales_Model_Order_Payment) {
            $currency_code = $paymentInfo->getOrder()->getBaseCurrencyCode();
        } else {
            $currency_code = $paymentInfo->getQuote()->getBaseCurrencyCode();
        }
      
        return $this;
    }


    public function getavenuesUrl ()
    {
        return 'https://www.ccavenue.com/shopzone/cc_details.jsp';
    }


    public function createFormBlock($name)
    {
        $block = $this->getLayout()->createBlock('avenues/form_standard', $name);
        $block->setMethod($this->_code);
        $block->setPayment($this->getPayment());

        return $block;
    }

   
    public function getOrderPlaceRedirectUrl()
    {
        return Mage::getUrl('avenues/standard/redirect');
    }

    public function getStandardCheckoutFormFields ()
    {
        $order = $this->getOrder();
        if (!($order instanceof Mage_Sales_Model_Order)) {
            Mage::throwException($this->_getHelper()->__('Cannot retrieve order object'));
        }

        $billingAddress = $order->getBillingAddress();
		$shippingAddress= $order->getShippingAddress();

        $streets = $billingAddress->getStreet();
		$streets = $shippingAddress->getStreet();
        $street = isset($streets[0]) && $streets[0] != ''
                  ? $streets[0]
                  : (isset($streets[1]) && $streets[1] != '' ? $streets[1] : '');

        if ($this->getConfig()->getDescription()) {
            $transDescription = $this->getConfig()->getDescription();
        } else {
            $transDescription = Mage::helper('avenues')->__('Order #%s', $order->getRealOrderId());
        }

        if ($order->getCustomerEmail()) {
            $email = $order->getCustomerEmail();
        } elseif ($billingAddress->getEmail()) {
            $email = $billingAddress->getEmail();
        } else {
            $email = '';
        }


        $fields = array(
						
		                'Merchant_Id'       => $this->getConfig()->getAccountId(),
					    'WorkingKey'        => $this->getConfigData('workingkey'),
                       	'product_price'    => $order->getBaseGrandTotal(),
						'Redirect_Url'           => Mage::getUrl('avenues/standard/success',array('_secure' => true)),
                        'product_name'     => $transDescription,
                        'language'         => $this->getConfig()->getLanguage(),
                        'billing_cust_name'           => $billingAddress->getFirstname()." ".$billingAddress->getLastname(),
                        'billing_cust_address'           => $billingAddress->getStreet(1)."   ".$billingAddress->getStreet(2),
                        'billing_cust_city'             => $billingAddress->getCity(),
                        'billing_cust_state'            => $billingAddress->getRegionCode(),
                        'billing_zip_code'              => $billingAddress->getPostcode(),
                        'billing_cust_country'          => $billingAddress->getCountryModel()->getName(),
                        'billing_cust_tel'            => $billingAddress->getTelephone(),
                        'billing_cust_email'            => $email,
						'delivery_cust_name'           => $shippingAddress->getFirstname()." ".$shippingAddress->getLastname(),
                        'delivery_cust_address'           => $shippingAddress->getStreet(1)."   ".$shippingAddress->getStreet(2),
                        'delivery_cust_city'             => $shippingAddress->getCity(),
                        'delivery_cust_state'            => $shippingAddress->getRegionCode(),
                        'delivery_zip_code'              => $shippingAddress->getPostcode(),
                        'delivery_cust_country'          =>$shippingAddress->getCountryModel()->getName(),
                        'delivery_cust_tel'            => $shippingAddress->getTelephone(),
                        'cb_url'           => $this->getNotificationURL(),
                        'cb_type'          => 'P', // POST method used (G - GET method)
                        'decline_url'      => $this->getFailureURL(),
                      	'cs1'              => $order->getRealOrderId(),    
							
                        'Checksum' => getCheckSum($this->getConfig()->getAccountId(),$order->getBaseGrandTotal(),$order->getRealOrderId(),Mage::getUrl('avenues/standard/success',array('_secure' => true)),$this->getConfigData('workingkey')),
							);
        
		if ($this->getConfig()->getDebug()) {
            $debug = Mage::getModel('avenues/api_debug')
                ->setRequestBody($this->getavenuesUrl()."\n".print_r($fields,1))
                ->save();
            $fields['cs2'] = $debug->getId();
        }

        return $fields;
    }

}


