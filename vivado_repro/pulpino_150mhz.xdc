# Main PULPino clock constraint for the 150 MHz timing check.
# The top used by this repro flow is the existing FPGA wrapper `pulpino`,
# whose primary clock port is `clk`.

if {![info exists ::PULPINO_CLOCK_PERIOD]} {
  set ::PULPINO_CLOCK_PERIOD 6.667
}

set _pulpino_clk_port [get_ports -quiet clk]
if {[llength $_pulpino_clk_port] != 1} {
  error "Expected exactly one top-level clock port named 'clk'; check -top or update vivado_repro/pulpino_150mhz.xdc."
}

create_clock -name clk -period $::PULPINO_CLOCK_PERIOD $_pulpino_clk_port

