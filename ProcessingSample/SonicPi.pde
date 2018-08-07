/*
##| SonicPi Code



live_loop :zoo do
  
  use_synth :beep
  use_octave choose([0,1])
  s= choose([0,2,5,7,9])
  use_transpose s
  play 48+0,release:choose([0.125,0.25,0.5])
  play 48+4,release:0.125
  play 48+7,release:0.125
  sleep 0.25
  
  play 48,release:0.25
  sleep 0.25
  
  
  play 48,release:choose([0.125,0.25,0.5,1.5,2.0])
  play 48+4,release:0.25
  play 48+7,release:0.25
  sleep 1.0
  
  
  play 48+7,release:0.5
  sleep 0.5
  
end





*/