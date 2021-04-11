# teardown mic
tinymix 'TX DEC0 MUX' 'ZERO'
tinymix 'TX SMIC MUX0' 'ZERO'
tinymix 'TX_AIF1_CAP Mixer DEC0' 0
tinymix 'ADC1_MIXER Switch' 0
tinymix 'ADC2_MIXER Switch' 0
tinymix 'IIR0 INP0 MUX' 'ZERO'
tinymix 'IIR0 INP0 Volume' 84
tinymix 'TX_DEC0 Volume' 84

# teardown headphone
tinymix 'RX INT0_1 MIX1 INP0' 'ZERO'
tinymix 'RX INT1_1 MIX1 INP0' 'ZERO'
tinymix 'RX INT0 DEM MUX' 'NORMAL_DSM_OUT'
tinymix 'RX INT1 DEM MUX' 'NORMAL_DSM_OUT'
tinymix 'RX_COMP1 Switch' 0
tinymix 'RX_COMP2 Switch' 0
tinymix 'HPHL_COMP Switch' 0
tinymix 'HPHR_COMP Switch' 0
tinymix 'HPHL_RDAC Switch' 0
tinymix 'HPHR_RDAC Switch' 0
#teardown earpiece
#tinymix 'RX INT0 DEM MUX' 'NORMAL_DSM_OUT'
#tinymix 'RX INT0_1 MIX1 INP0' 'ZERO'
#tinymix 'EAR_RDAC Switch' 0
#tinymix 'RDAC3_MUX' 'ZERO'
