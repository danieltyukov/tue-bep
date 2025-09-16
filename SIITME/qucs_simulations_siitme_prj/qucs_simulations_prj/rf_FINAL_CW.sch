<Qucs Schematic 0.0.19>
<Properties>
  <View=116,54,1961,875,1.18753,0,0>
  <Grid=10,10,1>
  <DataSet=rf_FINAL_CW.dat>
  <DataDisplay=rf_FINAL_CW.dpl>
  <OpenDisplay=0>
  <Script=gsg_cpw_model_nobump.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
</Symbol>
<Components>
  <GND * 1 180 550 0 0 0 0>
  <GND * 1 380 640 0 0 0 0>
  <Pac P1 1 180 520 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0>
  <.SP SP1 1 180 200 0 65 0 0 "lin" 1 "10 MHz" 1 "10 GHz" 1 "1000" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <GND * 1 710 550 0 0 0 0>
  <GND * 1 900 480 0 0 0 0>
  <R R1 1 500 450 -26 15 0 0 "5.54 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <L L1 1 280 450 -26 10 0 0 "0.486 nH" 1 "" 0>
  <C C1 1 380 500 17 -26 0 1 "66.1 fF" 1 "" 0 "neutral" 0>
  <C C2 1 450 610 17 -26 0 1 "66.1 fF" 1 "" 0 "neutral" 0>
  <L L2 1 630 450 -26 10 0 0 "96 pH" 1 "" 0>
  <C C3 1 710 520 17 -26 0 1 "3.6 fF" 1 "" 0 "neutral" 0>
  <R R4 1 790 450 -26 15 0 0 "0.24 mOhm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <Pac P2 1 1040 560 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0>
  <GND * 1 1040 590 0 0 0 0>
  <GND * 1 1180 550 0 0 0 0>
  <R R2 1 310 610 15 -26 0 1 "24.1 MOhm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND * 1 170 810 0 0 0 0>
  <Pac P3 1 170 780 18 -26 0 1 "3" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0>
  <GND * 1 680 740 0 0 0 0>
  <GND * 1 320 810 0 0 0 0>
  <C C4 1 320 780 17 -26 0 1 "498 fF" 1 "" 0 "neutral" 0>
  <R R5 1 440 710 -26 15 0 0 "5.175 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "US" 0>
  <L L3 1 570 710 -26 10 0 0 "267 pH" 1 "" 0>
  <SPfile X1 1 900 450 -26 -57 0 0 "/home/danieltyukov/workspace/tue/tue-bep/s_params_and_scripts/die_direct_measurement_after_calibration.s1p" 1 "rectangular" 0 "linear" 0 "open" 0 "1" 0>
  <SPfile X2 1 1180 520 -26 -57 0 0 "/home/danieltyukov/workspace/tue/tue-bep/s_params_and_scripts/dut_die_bumps_line.s1p" 1 "rectangular" 0 "linear" 0 "open" 0 "1" 0>
  <SPfile X3 1 680 710 -26 -57 0 0 "/home/danieltyukov/workspace/tue/tue-bep/s_params_and_scripts/die_direct_measurement_after_calibration.s1p" 1 "rectangular" 0 "linear" 0 "open" 0 "1" 0>
  <Eqn Eqn1 1 380 190 -31 17 0 0 "dBS11=dB(S[1,1])" 1 "yes" 0>
  <Eqn Eqn2 1 380 280 -31 17 0 0 "dBS22=dB(S[2,2])" 1 "yes" 0>
  <Eqn Eqn3 1 380 360 -31 17 0 0 "dBS33=dB(S[3,3])" 1 "yes" 0>
</Components>
<Wires>
  <180 450 180 490 "" 0 0 0 "">
  <180 450 250 450 "" 0 0 0 "">
  <310 450 380 450 "" 0 0 0 "">
  <380 450 380 470 "" 0 0 0 "">
  <380 530 380 560 "" 0 0 0 "">
  <310 560 380 560 "" 0 0 0 "">
  <310 560 310 580 "" 0 0 0 "">
  <310 640 380 640 "" 0 0 0 "">
  <380 560 450 560 "" 0 0 0 "">
  <450 560 450 580 "" 0 0 0 "">
  <380 640 450 640 "" 0 0 0 "">
  <380 450 470 450 "" 0 0 0 "">
  <660 450 710 450 "" 0 0 0 "">
  <710 450 760 450 "" 0 0 0 "">
  <710 450 710 490 "" 0 0 0 "">
  <530 450 600 450 "" 0 0 0 "">
  <820 450 870 450 "" 0 0 0 "">
  <170 710 170 750 "" 0 0 0 "">
  <600 710 650 710 "" 0 0 0 "">
  <470 710 540 710 "" 0 0 0 "">
  <170 710 320 710 "" 0 0 0 "">
  <320 710 410 710 "" 0 0 0 "">
  <320 710 320 750 "" 0 0 0 "">
  <1040 520 1040 530 "" 0 0 0 "">
  <1040 520 1150 520 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Smith 990 360 200 200 3 #c0c0c0 1 00 1 0 1 1 1 0 4 1 1 0 1 1 315 0 225 "" "" "">
	<"S[1,1]" #0000ff 1 3 0 0 0>
	  <Mkr 1e+07 -55 -266 3 0 0>
	<"S[2,2]" #ff0000 1 3 0 0 0>
	  <Mkr 1e+07 149 -264 3 0 0>
	<"S[3,3]" #ff00ff 0 3 0 0 0>
  </Smith>
  <Rect 560 360 240 160 3 #c0c0c0 1 00 1 0 2e+09 1e+10 1 -10 5 0 1 -1 1 1 315 0 225 "" "" "">
	<"dBS11" #0000ff 1 3 0 0 0>
	  <Mkr 1e+07 10 -210 3 0 0>
	<"dBS22" #ff0000 1 3 0 0 0>
	  <Mkr 1e+07 16 -61 3 0 0>
	<"dBS33" #ff00ff 0 3 0 0 0>
  </Rect>
</Diagrams>
<Paintings>
</Paintings>
