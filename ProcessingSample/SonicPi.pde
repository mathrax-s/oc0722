/*
##| SonicPi Code


live_loop :zoo do
  use_real_time
  a = sync "/osc/trigger/channel0"
  synth :beep, note: a,  release: 0.5
end


*/