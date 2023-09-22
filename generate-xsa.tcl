open_project fpga

# Run Synthesis
launch_runs synth_1 -jobs 8
wait_on_run synth_1

# Run Implementation and generate the bitstream
launch_runs impl_1 -jobs 8
wait_on_run impl_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1

# Export xsa
write_hw_platform -fixed -include_bit -force -file ./design_1_wrapper.xsa
