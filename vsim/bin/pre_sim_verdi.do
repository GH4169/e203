# GUI mode or Batch mode execution branch for different purpose
if {[info command guiIsActive]==""} {
  if {[info command verdiSetFont]==""} {
    run
  }
  echo "Verdi GUI mode"
  dump -add / -depth 0
  
  if {$env(LOAD_SIGNAL_LIST_TIMES) == 0} {
    echo "LOAD_SIGNAL_LIST_TIMES == 0"
    wvRestoreSignal ../run/pre_sim_open_signals.rc
    run
    setenv LOAD_SIGNAL_LIST_TIMES 1 
  }

} else { 
  echo "GUI mode"
  dump -add / -depth 0
  do ./rkv_watchdog_debug_wave.do
}

