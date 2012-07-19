<?php class ThemeOptions_ExtraConfig_Model_Themecolors
{
    public function toOptionArray()
    {
        return array(
            array('value'=>'original', 'label'=>Mage::helper('ExtraConfig')->__('Original')),
            array('value'=>'blue', 'label'=>Mage::helper('ExtraConfig')->__('Blue')),
            array('value'=>'royalblue', 'label'=>Mage::helper('ExtraConfig')->__('Royal Blue')),
            array('value'=>'orange', 'label'=>Mage::helper('ExtraConfig')->__('Orange')),
            array('value'=>'black', 'label'=>Mage::helper('ExtraConfig')->__('Black'))            
        );
    }

}?>