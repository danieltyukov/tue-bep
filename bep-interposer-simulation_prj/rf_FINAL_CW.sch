<Qucs Schematic 25.1.2>
<Properties>
  <View=126,2,1719,892,1.38857,0,0>
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
  <Pac P1 1 180 520 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0 "true" 0>
  <Eqn Eqn1 1 380 200 -31 17 0 0 "dBS11=dB(S[1,1])" 1 "yes" 0>
  <.SP SP1 1 180 200 0 64 0 0 "lin" 1 "10 MHz" 1 "10 GHz" 1 "1000" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <GND * 1 710 550 0 0 0 0>
  <GND * 1 900 480 0 0 0 0>
  <SPfile X1 1 900 450 -26 -57 0 0 "/home/danieltyukov/workspace/tue/tue-bep/s_params_and_scripts/die_direct_measurement_after_calibration.s1p" 1 "rectangular" 0 "linear" 0 "open" 0 "1" 0>
  <R R1 1 500 450 -26 15 0 0 "5.54 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <L L1 1 280 450 -26 10 0 0 "0.486 nH" 1 "" 0>
  <C C1 1 380 500 17 -26 0 1 "66.1 fF" 1 "" 0 "neutral" 0>
  <C C2 1 450 610 17 -26 0 1 "66.1 fF" 1 "" 0 "neutral" 0>
  <L L2 1 630 450 -26 10 0 0 "96 pH" 1 "" 0>
  <C C3 1 710 520 17 -26 0 1 "3.6 fF" 1 "" 0 "neutral" 0>
  <R R4 1 790 450 -26 15 0 0 "0.24 mOhm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <Eqn Eqn2 1 380 290 -31 17 0 0 "dBS22=dB(S[2,2])" 1 "yes" 0>
  <SPfile X2 1 320 720 -26 -57 0 0 "/home/danieltyukov/workspace/tue/tue-bep/s_params_and_scripts/dut_die_bumps_line.s1p" 1 "rectangular" 0 "linear" 0 "open" 0 "1" 0>
  <Pac P2 1 180 760 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0 "true" 0>
  <GND * 1 180 790 0 0 0 0>
  <GND * 1 320 750 0 0 0 0>
  <R R2 1 310 610 15 -26 0 1 "24.1 MOhm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
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
  <180 720 180 730 "" 0 0 0 "">
  <180 720 290 720 "" 0 0 0 "">
</Wires>
<Diagrams>
  <Smith 990 360 200 200 3 #c0c0c0 1 00 1 0 1 1 1 0 4 1 1 0 1 1 315 0 225 1 0 0 "" "" "">
	<"S[1,1]" #0000ff 1 3 0 0 0>
	  <Mkr 1e+07 -55 -266 3 0 0>
	<"S[2,2]" #ff0000 1 3 0 0 0>
	  <Mkr 1e+07 119 -264 3 0 0>
  </Smith>
  <Rect 560 360 240 160 3 #c0c0c0 1 00 1 0 2e+09 1e+10 1 -2.15157 0.5 -1.30562 1 -1 1 1 315 0 225 1 0 0 "" "" "">
	<"dBS11" #0000ff 1 3 0 0 0>
	  <Mkr 1e+07 12 -202 3 0 0>
	<"dBS22" #ff0000 1 3 0 0 0>
	  <Mkr 1e+07 156 -211 3 0 0>
  </Rect>
</Diagrams>
<Paintings>
</Paintings>
