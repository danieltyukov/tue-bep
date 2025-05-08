<Qucs Schematic 25.1.2>
<Properties>
  <View=-99,-678,2785,1627,0.796324,84,350>
  <Grid=10,10,1>
  <DataSet=tgf_without_lines.dat>
  <DataDisplay=tgf_without_lines.dpl>
  <OpenDisplay=0>
  <Script=tgf_without_lines.m>
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
  <Pac P1 1 400 800 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0 "true" 0>
  <C C1 1 620 680 -26 17 0 0 "100 pF" 1 "" 0 "neutral" 0>
  <R R1 1 850 960 15 -26 0 1 "1 MOhm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <MTEE MS4 1 1290 510 -105 -45 0 1 "Subst1" 1 "1.2 mm" 1 "1.2 mm" 1 "1.2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <C C2 1 1520 510 -26 17 0 0 "100 pF" 1 "" 0 "neutral" 0>
  <MLIN MS5 1 1620 510 -26 15 0 0 "Subst1" 1 "1.2 mm" 1 "2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Pac P2 1 1730 560 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0 "true" 0>
  <SPfile X1 1 1170 680 -26 -57 0 0 "/home/danieltyukov/workspace/tue/tue-bep/amplifier_die/TGF2023-2-02-s2p/TGF2023-2-02_12V_50mA.s2p" 1 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <L L1 1 1290 130 10 -26 0 1 "4.7 uH" 1 "" 0>
  <R RD1 1 1290 330 15 -26 0 1 "68 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <MLIN MS8 1 1400 510 -26 15 0 0 "Subst1" 1 "1.2 mm" 1 "2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS16 1 1290 600 15 -26 0 1 "Subst1" 1 "1.2 mm" 1 "5 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <R R2 1 850 410 15 -26 0 1 "10 MOhm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <Vdc VDD1 1 1590 10 -26 -54 0 2 "12 V" 1>
  <Eqn Eqn1 1 450 370 -31 17 0 0 "dBS11=dB(S[1,1])" 1 "yes" 0>
  <Eqn Eqn2 1 450 460 -31 17 0 0 "dBS21=dB(S[2,1])" 1 "yes" 0>
  <Eqn Eqn3 1 590 460 -31 17 0 0 "dBS12=dB(S[1,2])" 1 "yes" 0>
  <Eqn Eqn4 1 590 370 -31 17 0 0 "dBS22=dB(S[2,2])" 1 "yes" 0>
  <GND * 1 1710 10 0 0 0 1>
  <GND * 1 1730 640 0 0 0 0>
  <R RS1 1 1170 1110 15 -26 0 1 "56 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <C C3 1 1290 1110 17 -26 0 1 "100 pF" 1 "" 0 "neutral" 0>
  <GND * 1 1290 1190 0 0 0 0>
  <GND * 1 1170 1170 0 0 0 0>
  <GND * 1 850 1010 0 0 0 0>
  <GND * 1 400 870 0 0 0 0>
  <SUBST Subst1 1 640 180 -30 24 0 0 "7.75" 1 "1 mm" 1 "1 mm" 1 "0" 1 "3.475e-8" 1 "0.15e-6" 1>
  <.SP SP1 1 430 140 0 64 0 0 "lin" 1 "1 MHz" 1 "6 GHz" 1 "200" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <MLIN MS2 1 500 680 -26 15 0 0 "Subst1" 1 "0.5 mm" 1 "1.2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS1 1 750 680 -26 15 0 0 "Subst1" 1 "1 mm" 1 "1.2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS13 1 850 860 15 -26 0 1 "Subst1" 1 "0.5 mm" 1 "1.2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS12 1 1040 680 -26 15 0 0 "Subst1" 1 "1 mm" 1 "1.2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS18 1 1170 830 15 -26 0 1 "Subst1" 1 "1 mm" 1 "1.2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS20 1 1170 1020 15 -26 0 1 "Subst1" 1 "1 mm" 1 "1.2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS21 1 1290 1020 15 -26 0 1 "Subst1" 1 "0.5 mm" 1 "1.2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS14 1 850 560 15 -26 0 1 "Subst1" 1 "0.5 mm" 1 "1.2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS15 1 850 270 15 -26 0 1 "Subst1" 1 "0.5 mm" 1 "1.2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS9 1 1040 10 -26 15 0 0 "Subst1" 1 "1 mm" 1 "1.2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS7 1 1290 230 15 -26 0 1 "Subst1" 1 "0.5 mm" 1 "1.2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS6 1 1290 420 15 -26 0 1 "Subst1" 1 "0.5 mm" 1 "1.2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS17 1 1470 10 -26 15 0 0 "Subst1" 1 "0.5 mm" 1 "1.2 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MCORN MS10 1 850 10 -7 -69 0 1 "Subst1" 1 "1 mm" 1>
  <MCROSS MS3 1 910 680 -26 34 0 0 "Subst1" 1 "1 mm" 1 "0.5 mm" 1 "1 mm" 1 "0.5 mm" 1 "Hammerstad" 0 "Kirschning" 0 "showNumbers" 0>
  <MTEE MS19 1 1170 930 -124 -26 0 1 "Subst1" 1 "1 mm" 1 "1 mm" 1 "0.5 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
  <MTEE MS11 1 1290 10 -26 -105 0 0 "Subst1" 1 "1 mm" 1 "0.5 mm" 1 "0.5 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0 "showNumbers" 0>
</Components>
<Wires>
  <400 680 400 770 "" 0 0 0 "">
  <400 680 470 680 "" 0 0 0 "">
  <530 680 590 680 "" 0 0 0 "">
  <650 680 720 680 "" 0 0 0 "">
  <850 710 910 710 "" 0 0 0 "">
  <850 710 850 830 "" 0 0 0 "">
  <850 650 910 650 "" 0 0 0 "">
  <780 680 880 680 "" 0 0 0 "">
  <850 890 850 930 "" 0 0 0 "">
  <850 590 850 650 "" 0 0 0 "">
  <1200 680 1290 680 "" 0 0 0 "">
  <1290 630 1290 680 "" 0 0 0 "">
  <1290 540 1290 570 "" 0 0 0 "">
  <1550 510 1590 510 "" 0 0 0 "">
  <1650 510 1730 510 "" 0 0 0 "">
  <1730 510 1730 530 "" 0 0 0 "">
  <1290 160 1290 200 "" 0 0 0 "">
  <1290 360 1290 390 "" 0 0 0 "">
  <1290 450 1290 480 "" 0 0 0 "">
  <1290 260 1290 300 "" 0 0 0 "">
  <1070 680 1140 680 "" 0 0 0 "">
  <940 680 1010 680 "" 0 0 0 "">
  <1430 510 1490 510 "" 0 0 0 "">
  <1320 510 1370 510 "" 0 0 0 "">
  <850 40 850 240 "" 0 0 0 "">
  <880 10 1010 10 "" 0 0 0 "">
  <1070 10 1260 10 "" 0 0 0 "">
  <1290 40 1290 100 "" 0 0 0 "">
  <850 300 850 380 "" 0 0 0 "">
  <850 440 850 530 "" 0 0 0 "">
  <1320 10 1440 10 "" 0 0 0 "">
  <1500 10 1560 10 "" 0 0 0 "">
  <1620 10 1710 10 "" 0 0 0 "">
  <1730 590 1730 640 "" 0 0 0 "">
  <1170 860 1170 900 "" 0 0 0 "">
  <1200 930 1290 930 "" 0 0 0 "">
  <1290 930 1290 990 "" 0 0 0 "">
  <1170 960 1170 990 "" 0 0 0 "">
  <1170 1050 1170 1080 "" 0 0 0 "">
  <1290 1050 1290 1080 "" 0 0 0 "">
  <1170 710 1170 800 "" 0 0 0 "">
  <1170 1140 1170 1170 "" 0 0 0 "">
  <1290 1140 1290 1190 "" 0 0 0 "">
  <850 990 850 1010 "" 0 0 0 "">
  <400 830 400 870 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
