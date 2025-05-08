<Qucs Schematic 25.1.2>
<Properties>
  <View=165,134,928,716,1.29845,338,0>
  <Grid=10,10,1>
  <DataSet=circuit_model_of_CPW_structure_v1.dat>
  <DataDisplay=circuit_model_of_CPW_structure_v1.dpl>
  <OpenDisplay=0>
  <Script=circuit_model_of_CPW_structure_v1.m>
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
  <SPfile X1 1 450 240 -26 -57 0 0 "/home/danieltyukov/workspace/tue/tue-bep/rf_die/rf_die_ideal.s2p" 1 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <Pac P1 1 360 290 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0 "true" 0>
  <GND * 1 450 270 0 0 0 0>
  <Pac P2 1 540 290 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0 "true" 0>
  <GND * 1 360 320 0 0 0 0>
  <GND * 1 540 320 0 0 0 0>
  <Pac P3 1 180 520 18 -26 0 1 "3" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0 "true" 0>
  <GND * 1 180 550 0 0 0 0>
  <.SP SP1 1 190 210 0 64 0 0 "lin" 1 "100 MHz" 1 "5 GHz" 1 "50" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn1 1 690 250 -31 17 0 0 "dBS11=dB(S[1,1])" 1 "yes" 0>
  <Eqn Eqn2 1 840 250 -31 17 0 0 "dBS33=dB(S[3,3])" 1 "yes" 0>
  <Eqn Eqn3 1 690 340 -31 17 0 0 "dBS43=dB(S[4,3])" 1 "yes" 0>
  <Eqn Eqn4 1 830 340 -31 17 0 0 "dBS21=dB(S[2,1])" 1 "yes" 0>
  <C C3 1 360 380 -26 17 0 0 "0.138 pF" 1 "" 0 "neutral" 0>
  <L L1 1 280 450 -26 10 0 0 "0.352 nH" 1 "" 0>
  <R R1 1 480 450 -26 15 0 0 "3.12 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <C C1 1 380 500 17 -26 0 1 "8.92 fF" 1 "" 0 "neutral" 0>
  <R R2 1 310 610 15 -26 0 1 "1 TOhm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <C C2 1 450 610 17 -26 0 1 "0 pF" 1 "" 0 "neutral" 0>
  <GND * 1 380 640 0 0 0 0>
  <Pac P4 1 600 520 18 -26 0 1 "4" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0 "true" 0>
  <GND * 1 600 550 0 0 0 0>
</Components>
<Wires>
  <360 240 360 260 "" 0 0 0 "">
  <360 240 420 240 "" 0 0 0 "">
  <480 240 540 240 "" 0 0 0 "">
  <540 240 540 260 "" 0 0 0 "">
  <180 450 180 490 "" 0 0 0 "">
  <180 450 250 450 "" 0 0 0 "">
  <310 450 380 450 "" 0 0 0 "">
  <180 380 180 450 "" 0 0 0 "">
  <180 380 330 380 "" 0 0 0 "">
  <390 380 600 380 "" 0 0 0 "">
  <600 380 600 450 "" 0 0 0 "">
  <510 450 600 450 "" 0 0 0 "">
  <380 450 450 450 "" 0 0 0 "">
  <380 450 380 470 "" 0 0 0 "">
  <380 530 380 560 "" 0 0 0 "">
  <310 560 380 560 "" 0 0 0 "">
  <310 560 310 580 "" 0 0 0 "">
  <310 640 380 640 "" 0 0 0 "">
  <380 560 450 560 "" 0 0 0 "">
  <450 560 450 580 "" 0 0 0 "">
  <380 640 450 640 "" 0 0 0 "">
  <600 450 600 490 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
