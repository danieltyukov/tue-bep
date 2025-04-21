$ 1 mm CPW on glass – single layer, Au/Ti (100 nm/50 nm)
$ file: cpw_glass_1mm.sch
.Schematic CPW_Glass begin
<Port P1> 1 0 term Z=50
<R R1> 1 2 3.12
<L L1> 2 3 0.352n
<C C3> 3 0 0.129p
<C C1> 3 4 8.9f
<R R2> 4 0 1e12
<Port P2> 3 0 term Z=50

$ ---------- place‑holder 5 GHz RF die ----------
$ Two‑port with fixed S = |S11|=-12 dB, |S21|=-1 dB, 0° phase
$ (edit or replace with your own *.s2p when available)
<SPfile DUT> 5 6 file="rf_die_ideal.s2p"

$ Connect our CPW between test ports and the DUT
<Wire> 1 5
<Wire> 6 3
$ -----------------------------------------------

<SPsim SP1> port1=1 port2=0 port3=3 port4=0
   fstart=0.1 GHz fstop=5 GHz fstep=0.01 GHz
.Schematic end
