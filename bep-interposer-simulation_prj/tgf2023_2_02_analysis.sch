<Qucs Schematic 25.1.2>
<Properties>
  <View=85,-422,1115,944,0.904854,0,0>
  <Grid=10,10,1>
  <DataSet=tgf2023_2_02_analysis.dat>
  <DataDisplay=tgf2023_2_02_analysis.dpl>
  <OpenDisplay=0>
  <Script=tgf2023_2_02_analysis.m>
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
  <Pac P1 1 380 490 15 -21 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0 "true" 0>
  <GND * 1 380 520 0 0 0 0>
  <IProbe Pr2_drain1 1 720 250 -87 -9 0 3>
  <GND * 1 720 120 0 0 0 1>
  <Pac P2 1 910 490 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0 "true" 0>
  <GND * 1 910 520 0 0 0 0>
  <GND * 1 620 470 0 0 0 0>
  <GND * 1 620 120 0 0 0 0>
  <Vdc V1 1 590 120 -26 -54 0 2 "-2.8 V" 1>
  <SPfile X1 1 620 440 -315 -54 0 0 "/home/danieltyukov/workspace/tue/tue-bep/amplifier_die/TGF2023-2-02-s2p/TGF2023-2-02_28V_125mA.s2p" 1 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <Vdc V2 1 720 150 -64 -26 0 3 "28 V" 1>
  <IProbe Pr1_gate1 1 500 220 -78 -9 0 3>
  <DCFeed DC_Feed1 1 500 350 -88 -6 0 3 "1 uH" 0>
  <DCFeed DC_Feed2 1 720 360 -87 -9 0 3 "1 uH" 0>
  <DCBlock DC_Block1 1 440 440 -7 21 0 0 "1 uF" 0>
  <DCBlock DC_Block2 1 800 440 -9 21 0 0 "1 uF" 0>
  <Eqn Eqn1 1 160 -10 -31 17 0 0 "dBS11=dB(S[1,1])" 1 "yes" 0>
  <Eqn Eqn2 1 160 80 -31 17 0 0 "dBS21=dB(S[2,1])" 1 "yes" 0>
  <Eqn Eqn3 1 300 80 -31 17 0 0 "dBS12=dB(S[1,2])" 1 "yes" 0>
  <Eqn Eqn4 1 300 -10 -31 17 0 0 "dBS22=dB(S[2,2])" 1 "yes" 0>
  <.DC DC1 1 140 160 0 38 0 0 "26.85" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "no" 0 "150" 0 "no" 0 "none" 0 "CroutLU" 0>
  <.SP SP1 1 130 240 0 64 0 0 "lin" 1 "10 MHz" 1 "10 GHz" 1 "1000" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
</Components>
<Wires>
  <380 440 380 460 "" 0 0 0 "">
  <380 440 410 440 "" 0 0 0 "">
  <470 440 500 440 "" 0 0 0 "">
  <720 390 720 440 "" 0 0 0 "">
  <720 280 720 330 "" 0 0 0 "">
  <720 180 720 220 "" 0 0 0 "">
  <720 440 770 440 "" 0 0 0 "">
  <830 440 910 440 "" 0 0 0 "">
  <910 440 910 460 "" 0 0 0 "">
  <650 440 720 440 "" 0 0 0 "">
  <500 440 590 440 "" 0 0 0 "">
  <500 380 500 440 "" 0 0 0 "">
  <500 250 500 320 "" 0 0 0 "">
  <500 120 560 120 "" 0 0 0 "">
  <500 120 500 190 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
