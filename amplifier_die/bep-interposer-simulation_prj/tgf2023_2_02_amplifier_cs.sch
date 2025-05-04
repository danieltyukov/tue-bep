<Qucs Schematic 25.1.2>
<Properties>
  <View=-323,-265,2128,1432,0.445448,0,0>
  <Grid=10,10,1>
  <DataSet=tgf2023_2_02_amplifier_cs.dat>
  <DataDisplay=tgf2023_2_02_amplifier_cs.dpl>
  <OpenDisplay=0>
  <Script=tgf2023_2_02_amplifier_cs.m>
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
  <SPfile X1 1 450 300 -26 -57 0 0 "/home/danieltyukov/workspace/tue/tue-bep/amplifier_die/TGF2023-2-02-s2p/TGF2023-2-02_28V_125mA.s2p" 1 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <GND * 1 450 330 0 0 0 0>
  <Pac P1 1 270 350 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0 "true" 0>
  <GND * 1 270 380 0 0 0 0>
  <DCBlock C1 1 330 300 -26 21 0 0 "1 uF" 0>
  <DCFeed L1 1 390 190 -33 -26 0 3 "1 uH" 0>
  <GND * 1 510 -30 0 0 0 0>
  <Vdc V1 1 480 -30 -26 -54 0 2 "-2.782 V" 1>
  <IProbe Pr1_gate 1 390 70 -36 -26 0 3>
  <DCFeed L2 1 610 220 -35 -26 0 3 "1 uH" 0>
  <IProbe Pr2_drain 1 610 110 -80 -26 0 3>
  <Vdc V2 1 610 10 -58 -26 0 3 "1 V" 1>
  <GND * 1 610 -20 0 0 0 1>
  <DCBlock C2 1 690 300 -26 21 0 0 "1 uF" 0>
  <Pac P2 1 800 350 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0 "true" 0>
  <GND * 1 800 380 0 0 0 0>
  <.SP SP1 1 160 60 0 64 0 0 "lin" 1 "6 GHz" 1 "14 GHz" 1 "161" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <.DC DC1 1 160 -30 0 38 0 0 "26.85" 0 "0.001" 0 "1 pA" 0 "1 uV" 0 "no" 0 "150" 0 "no" 0 "none" 0 "CroutLU" 0>
  <Eqn Eqn1 1 -20 260 -31 17 0 0 "dBS11=dB(S[1,1])" 1 "yes" 0>
  <Eqn Eqn3 1 -20 350 -31 17 0 0 "dBS21=dB(S[2,1])" 1 "yes" 0>
  <Eqn Eqn4 1 120 350 -31 17 0 0 "dBS12=dB(S[1,2])" 1 "yes" 0>
</Components>
<Wires>
  <270 300 270 320 "" 0 0 0 "">
  <270 300 300 300 "" 0 0 0 "">
  <360 300 390 300 "" 0 0 0 "">
  <390 220 390 300 "" 0 0 0 "">
  <390 100 390 160 "" 0 0 0 "">
  <390 -30 390 40 "" 0 0 0 "">
  <390 -30 450 -30 "" 0 0 0 "">
  <390 300 420 300 "" 0 0 0 "">
  <480 300 610 300 "" 0 0 0 "">
  <610 250 610 300 "" 0 0 0 "">
  <610 140 610 190 "" 0 0 0 "">
  <610 40 610 80 "" 0 0 0 "">
  <610 300 660 300 "" 0 0 0 "">
  <720 300 800 300 "" 0 0 0 "">
  <800 300 800 320 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
