# PULPino 150 MHz Vivado Repro

This directory contains a Windows-friendly Vivado flow for checking whether this PULPino checkout meets a 150 MHz main-clock timing target similar to the Karl et al. setup.

It does not modify RTL, does not generate a bitstream, and does not claim the design will meet timing. It only creates reproducible synthesis/implementation reports.

## What This Repo Contains

- Vivado top used by this flow: `pulpino`, the existing FPGA wrapper in `fpga/rtl/pulpino_wrap.v`
- Wrapped SoC top: `pulpino_top` in `rtl/pulpino_top.sv`
- Main clock port: `clk`
- Default core configuration: RI5CY (`USE_ZERO_RISCY=0`, `RISCY_RV32F=0`)
- Not a direct cv32e40p checkout/configuration: there is no `cv32e40p_core` top instantiated here
- Source list: `vivado_repro/pulpino_sources.tcl`, with paths relative to the repository root

Because Karl et al. used PULPino with cv32e40p, timing and LUT/FF results from this checkout cannot be compared directly to that cv32e40p baseline unless the RTL/core configuration is changed outside this repro script.

## Windows Run

From the project root, with Vivado 2020.2 in `PATH`:

```bat
vivado_repro\run_windows.bat -part xczu9eg-ffvb1156-2 -period 6.667 -mode impl
```

PowerShell:

```powershell
.\vivado_repro\run_windows.ps1 -Part xczu9eg-ffvb1156-2 -Period 6.667 -Mode impl
```

If PowerShell blocks local scripts with an execution-policy error, run it with a process-local bypass:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\vivado_repro\run_windows.ps1 -Part xczu9eg-ffvb1156-2 -Period 6.667 -Mode impl
```

This does not change the machine-wide execution policy. The batch wrapper below is also unaffected by PowerShell script policy.

If Vivado is not in `PATH`, pass the executable explicitly:

```bat
vivado_repro\run_windows.bat -vivado "C:\Xilinx\Vivado\2020.2\bin\vivado.bat" -part xczu9eg-ffvb1156-2 -period 6.667 -mode impl
```

```powershell
.\vivado_repro\run_windows.ps1 -Vivado "C:\Xilinx\Vivado\2020.2\bin\vivado.bat" -Part xczu9eg-ffvb1156-2 -Period 6.667 -Mode impl
```

You can also run the Tcl directly:

```bat
vivado -mode batch -source vivado_repro\run_pulpino_150mhz.tcl -tclargs -part xczu9eg-ffvb1156-2 -period 6.667 -mode impl
```

## Reports

Outputs go to `vivado_repro/out` by default:

- `vivado_repro/out/reports/post_synth_timing.rpt`
- `vivado_repro/out/reports/post_synth_util.rpt`
- `vivado_repro/out/reports/post_route_timing.rpt`
- `vivado_repro/out/reports/post_route_util.rpt`
- `vivado_repro/out/reports/post_route_clock_util.rpt`

For the 150 MHz check, use the post-route timing summary. The design meets this specific target when `post_route_timing.rpt` reports `WNS >= 0` and `TNS = 0`.

## Comparison Notes

Use these settings for the Karl-style experiment:

- Vivado: 2020.2 recommended
- FPGA part: `xczu9eg-ffvb1156-2`
- Main clock period: `6.667 ns`
- Mode: `impl`, because post-route WNS/TNS is the meaningful timing result

FPU enablement and the selected core affect LUT/FF/timing. This checkout defaults to RI5CY without FPU, not cv32e40p. Setting `USE_ZERO_RISCY=1` before running selects zero-riscy through the existing top-level generics; `RISCY_RV32F=1` is intentionally rejected by this script because the legacy Xilinx floating-point FMA IP is not generated in this self-contained flow.

The legacy FPGA flow used generated Xilinx memory IP. Since those generated DCPs are not checked into this repository, this repro script writes a small inferred BRAM-compatible `xilinx_mem_8192x32` helper under `vivado_repro/out/generated` at run time. This keeps the run self-contained for synthesis and implementation timing without changing repository RTL.
