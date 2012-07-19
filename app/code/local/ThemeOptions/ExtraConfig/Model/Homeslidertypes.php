<?php class ThemeOptions_ExtraConfig_Model_Homeslidertypes
{
    public function toOptionArray()
    {
        return array(
            array('value'=>'slide', 'label'=>Mage::helper('ExtraConfig')->__('Slide')),
            array('value'=>'fade', 'label'=>Mage::helper('ExtraConfig')->__('Fade'))            
        );
    }

}?>