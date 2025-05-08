<Qucs Schematic 25.1.2>
<Properties>
  <View=-88,-54,2674,1760,0.395366,0,0>
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
  <Pac P1 1 380 490 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0 "true" 0>
  <GND * 1 380 520 0 0 0 0>
  <DCBlock C1 1 440 440 -26 21 0 0 "1 uF" 0>
  <DCFeed L2 1 720 360 -35 -26 0 3 "1 uH" 0>
  <IProbe Pr2_drain1 1 720 250 -80 -26 0 3>
  <Vdc V2 1 720 150 -58 -26 0 3 "1 V" 1>
  <GND * 1 720 120 0 0 0 1>
  <DCBlock C2 1 800 440 -26 21 0 0 "1 uF" 0>
  <Pac P2 1 910 490 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0 "true" 0>
  <GND * 1 910 520 0 0 0 0>
  <.DC DC1 1 270 110 0 38 0 0 "26.85" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "no" 0 "150" 0 "no" 0 "none" 0 "CroutLU" 0>
  <Eqn Eqn1 1 90 400 -31 17 0 0 "dBS11=dB(S[1,1])" 1 "yes" 0>
  <Eqn Eqn2 1 90 490 -31 17 0 0 "dBS21=dB(S[2,1])" 1 "yes" 0>
  <Eqn Eqn3 1 230 490 -31 17 0 0 "dBS12=dB(S[1,2])" 1 "yes" 0>
  <GND * 1 620 470 0 0 0 0>
  <GND * 1 620 120 0 0 0 0>
  <IProbe Pr1_gate1 1 500 220 -36 -26 0 3>
  <SPfile X1 1 620 440 -26 -57 0 0 "/home/danieltyukov/workspace/tue/tue-bep/amplifier_die/TGF2023-2-02-s2p/TGF2023-2-02_12V_50mA.s2p" 1 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <Vdc V1 1 590 120 -26 -54 0 2 "-2.8 V" 1>
  <DCFeed L1 1 500 350 -33 -26 0 3 "1 uH" 0>
  <.SP SP1 1 270 200 0 64 0 0 "lin" 1 "200 MHz" 1 "14 GHz" 1 "161" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
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
  <500 120 500 190 "" 0 0 0 "">
  <500 120 560 120 "" 0 0 0 "">
  <500 380 500 440 "" 0 0 0 "">
  <500 250 500 320 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
