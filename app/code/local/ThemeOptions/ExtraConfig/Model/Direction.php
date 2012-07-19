<?php class ThemeOptions_ExtraConfig_Model_Direction
{
    public function toOptionArray()
    {
        return array(
            array('value'=>'left', 'label'=>Mage::helper('ExtraConfig')->__('Slide')),
            array('value'=>'opacity', 'label'=>Mage::helper('ExtraConfig')->__('Opacity'))            
        );
    }

}?>