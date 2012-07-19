<?php class ThemeOptions_ExtraConfig_Model_Welcometypes
{
    public function toOptionArray()
    {
        return array(
            array('value'=>'txt', 'label'=>Mage::helper('ExtraConfig')->__('Text')),
            array('value'=>'img', 'label'=>Mage::helper('ExtraConfig')->__('Image'))            
        );
    }

}?>