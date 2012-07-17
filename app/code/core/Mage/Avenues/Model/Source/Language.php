<?php

class Mage_avenues_Model_Source_Language
{
    public function toOptionArray()
    {
        return array(
            array('value' => 'EN', 'label' => Mage::helper('avenues')->__('English')),
            array('value' => 'RU', 'label' => Mage::helper('avenues')->__('Russian')),
            array('value' => 'NL', 'label' => Mage::helper('avenues')->__('Dutch')),
            array('value' => 'DE', 'label' => Mage::helper('avenues')->__('German')),
        );
    }
}



