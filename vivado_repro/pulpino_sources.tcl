# Self-contained PULPino source list for vivado_repro/run_pulpino_150mhz.tcl.
# Paths are relative to the repository root. Keep this file synthesis-only:
# no tb/, no vsim/, no DPI, no testbench modules.

set PULPINO_INCLUDE_DIRS {
  rtl/includes
  ips/axi/axi_node
  ips/apb/apb_event_unit/include
  ips/fpu
  ips/apb/apb_i2c
  ips/zero-riscy/include
  ips/riscv/include
  ips/adv_dbg_if/rtl
}

set PULPINO_COMMON_FILES {
  ips/axi/axi_node/apb_regs_top.sv
  ips/axi/axi_node/axi_address_decoder_AR.sv
  ips/axi/axi_node/axi_address_decoder_AW.sv
  ips/axi/axi_node/axi_address_decoder_BR.sv
  ips/axi/axi_node/axi_address_decoder_BW.sv
  ips/axi/axi_node/axi_address_decoder_DW.sv
  ips/axi/axi_node/axi_AR_allocator.sv
  ips/axi/axi_node/axi_ArbitrationTree.sv
  ips/axi/axi_node/axi_AW_allocator.sv
  ips/axi/axi_node/axi_BR_allocator.sv
  ips/axi/axi_node/axi_BW_allocator.sv
  ips/axi/axi_node/axi_DW_allocator.sv
  ips/axi/axi_node/axi_FanInPrimitive_Req.sv
  ips/axi/axi_node/axi_multiplexer.sv
  ips/axi/axi_node/axi_node.sv
  ips/axi/axi_node/axi_node_wrap.sv
  ips/axi/axi_node/axi_node_wrap_with_slices.sv
  ips/axi/axi_node/axi_regs_top.sv
  ips/axi/axi_node/axi_request_block.sv
  ips/axi/axi_node/axi_response_block.sv
  ips/axi/axi_node/axi_RR_Flag_Req.sv

  ips/apb/apb_node/apb_node.sv
  ips/apb/apb_node/apb_node_wrap.sv

  ips/axi/axi_mem_if_DP/axi_mem_if_MP_Hybrid_multi_bank.sv
  ips/axi/axi_mem_if_DP/axi_mem_if_multi_bank.sv
  ips/axi/axi_mem_if_DP/axi_mem_if_DP_hybr.sv
  ips/axi/axi_mem_if_DP/axi_mem_if_DP.sv
  ips/axi/axi_mem_if_DP/axi_mem_if_SP.sv
  ips/axi/axi_mem_if_DP/axi_read_only_ctrl.sv
  ips/axi/axi_mem_if_DP/axi_write_only_ctrl.sv

  ips/axi/axi_spi_slave/axi_spi_slave.sv
  ips/axi/axi_spi_slave/spi_slave_axi_plug.sv
  ips/axi/axi_spi_slave/spi_slave_cmd_parser.sv
  ips/axi/axi_spi_slave/spi_slave_controller.sv
  ips/axi/axi_spi_slave/spi_slave_dc_fifo.sv
  ips/axi/axi_spi_slave/spi_slave_regs.sv
  ips/axi/axi_spi_slave/spi_slave_rx.sv
  ips/axi/axi_spi_slave/spi_slave_syncro.sv
  ips/axi/axi_spi_slave/spi_slave_tx.sv

  ips/axi/axi_spi_master/axi_spi_master.sv
  ips/axi/axi_spi_master/spi_master_axi_if.sv
  ips/axi/axi_spi_master/spi_master_clkgen.sv
  ips/axi/axi_spi_master/spi_master_controller.sv
  ips/axi/axi_spi_master/spi_master_fifo.sv
  ips/axi/axi_spi_master/spi_master_rx.sv
  ips/axi/axi_spi_master/spi_master_tx.sv

  ips/apb/apb_uart_sv/apb_uart_sv.sv
  ips/apb/apb_uart_sv/uart_rx.sv
  ips/apb/apb_uart_sv/uart_tx.sv
  ips/apb/apb_uart_sv/io_generic_fifo.sv
  ips/apb/apb_uart_sv/uart_interrupt.sv

  ips/apb/apb_gpio/apb_gpio.sv

  ips/apb/apb_event_unit/apb_event_unit.sv
  ips/apb/apb_event_unit/generic_service_unit.sv
  ips/apb/apb_event_unit/sleep_unit.sv

  ips/apb/apb_spi_master/apb_spi_master.sv
  ips/apb/apb_spi_master/spi_master_apb_if.sv
  ips/apb/apb_spi_master/spi_master_clkgen.sv
  ips/apb/apb_spi_master/spi_master_controller.sv
  ips/apb/apb_spi_master/spi_master_fifo.sv
  ips/apb/apb_spi_master/spi_master_rx.sv
  ips/apb/apb_spi_master/spi_master_tx.sv

  ips/fpu/hdl/fpu_utils/fpu_ff.sv
  ips/fpu/hdl/fpu_v0.1/fpu_defs.sv
  ips/fpu/hdl/fpu_v0.1/fpexc.sv
  ips/fpu/hdl/fpu_v0.1/fpu_add.sv
  ips/fpu/hdl/fpu_v0.1/fpu_core.sv
  ips/fpu/hdl/fpu_v0.1/fpu_ftoi.sv
  ips/fpu/hdl/fpu_v0.1/fpu_itof.sv
  ips/fpu/hdl/fpu_v0.1/fpu_mult.sv
  ips/fpu/hdl/fpu_v0.1/fpu_norm.sv
  ips/fpu/hdl/fpu_v0.1/fpu_private.sv
  ips/fpu/hdl/fpu_v0.1/riscv_fpu.sv
  ips/fpu/hdl/fpu_v0.1/fp_fma_wrapper.sv
  ips/fpu/hdl/fpu_div_sqrt_tp_nlp/fpu_defs_div_sqrt_tp.sv
  ips/fpu/hdl/fpu_div_sqrt_tp_nlp/control_tp.sv
  ips/fpu/hdl/fpu_div_sqrt_tp_nlp/fpu_norm_div_sqrt.sv
  ips/fpu/hdl/fpu_div_sqrt_tp_nlp/iteration_div_sqrt_first.sv
  ips/fpu/hdl/fpu_div_sqrt_tp_nlp/iteration_div_sqrt.sv
  ips/fpu/hdl/fpu_div_sqrt_tp_nlp/nrbd_nrsc_tp.sv
  ips/fpu/hdl/fpu_div_sqrt_tp_nlp/preprocess.sv
  ips/fpu/hdl/fpu_div_sqrt_tp_nlp/div_sqrt_top_tp.sv
  ips/fpu/hdl/fpu_fmac/fpu_defs_fmac.sv
  ips/fpu/hdl/fpu_fmac/preprocess_fmac.sv
  ips/fpu/hdl/fpu_fmac/booth_encoder.sv
  ips/fpu/hdl/fpu_fmac/booth_selector.sv
  ips/fpu/hdl/fpu_fmac/pp_generation.sv
  ips/fpu/hdl/fpu_fmac/wallace.sv
  ips/fpu/hdl/fpu_fmac/aligner.sv
  ips/fpu/hdl/fpu_fmac/CSA.sv
  ips/fpu/hdl/fpu_fmac/adders.sv
  ips/fpu/hdl/fpu_fmac/LZA.sv
  ips/fpu/hdl/fpu_fmac/fpu_norm_fmac.sv
  ips/fpu/hdl/fpu_fmac/fmac.sv

  ips/apb/apb_pulpino/apb_pulpino.sv
  ips/apb/apb_fll_if/apb_fll_if.sv
  ips/axi/core2axi/core2axi.sv

  ips/apb/apb_timer/apb_timer.sv
  ips/apb/apb_timer/timer.sv

  ips/axi/axi2apb/AXI_2_APB.sv
  ips/axi/axi2apb/AXI_2_APB_32.sv
  ips/axi/axi2apb/axi2apb.sv
  ips/axi/axi2apb/axi2apb32.sv

  ips/apb/apb_i2c/apb_i2c.sv
  ips/apb/apb_i2c/i2c_master_bit_ctrl.sv
  ips/apb/apb_i2c/i2c_master_byte_ctrl.sv
  ips/apb/apb_i2c/i2c_master_defines.sv

  ips/axi/axi_slice_dc/axi_slice_dc_master.sv
  ips/axi/axi_slice_dc/axi_slice_dc_slave.sv
  ips/axi/axi_slice_dc/dc_data_buffer.v
  ips/axi/axi_slice_dc/dc_full_detector.v
  ips/axi/axi_slice_dc/dc_synchronizer.v
  ips/axi/axi_slice_dc/dc_token_ring_fifo_din.v
  ips/axi/axi_slice_dc/dc_token_ring_fifo_dout.v
  ips/axi/axi_slice_dc/dc_token_ring.v

  ips/apb/apb_uart/apb_uart.vhd
  ips/apb/apb_uart/slib_clock_div.vhd
  ips/apb/apb_uart/slib_counter.vhd
  ips/apb/apb_uart/slib_edge_detect.vhd
  ips/apb/apb_uart/slib_fifo.vhd
  ips/apb/apb_uart/slib_input_filter.vhd
  ips/apb/apb_uart/slib_input_sync.vhd
  ips/apb/apb_uart/slib_mv_filter.vhd
  ips/apb/apb_uart/uart_baudgen.vhd
  ips/apb/apb_uart/uart_interrupt.vhd
  ips/apb/apb_uart/uart_receiver.vhd
  ips/apb/apb_uart/uart_transmitter.vhd

  ips/axi/axi_slice/axi_ar_buffer.sv
  ips/axi/axi_slice/axi_aw_buffer.sv
  ips/axi/axi_slice/axi_b_buffer.sv
  ips/axi/axi_slice/axi_buffer.sv
  ips/axi/axi_slice/axi_r_buffer.sv
  ips/axi/axi_slice/axi_slice.sv
  ips/axi/axi_slice/axi_w_buffer.sv

  ips/adv_dbg_if/rtl/adbg_axi_biu.sv
  ips/adv_dbg_if/rtl/adbg_axi_module.sv
  ips/adv_dbg_if/rtl/adbg_lint_biu.sv
  ips/adv_dbg_if/rtl/adbg_lint_module.sv
  ips/adv_dbg_if/rtl/adbg_crc32.v
  ips/adv_dbg_if/rtl/adbg_or1k_biu.sv
  ips/adv_dbg_if/rtl/adbg_or1k_module.sv
  ips/adv_dbg_if/rtl/adbg_or1k_status_reg.sv
  ips/adv_dbg_if/rtl/adbg_top.sv
  ips/adv_dbg_if/rtl/bytefifo.v
  ips/adv_dbg_if/rtl/syncflop.v
  ips/adv_dbg_if/rtl/syncreg.v
  ips/adv_dbg_if/rtl/adbg_tap_top.v
  ips/adv_dbg_if/rtl/adv_dbg_if.sv
  ips/adv_dbg_if/rtl/adbg_axionly_top.sv
  ips/adv_dbg_if/rtl/adbg_lintonly_top.sv

  ips/apb/apb2per/apb2per.sv

  rtl/components/pulp_clock_gating.sv
  rtl/components/cluster_clock_gating.sv
  rtl/components/cluster_clock_inverter.sv
  rtl/components/cluster_clock_mux2.sv
  rtl/components/rstgen.sv
  rtl/components/pulp_clock_inverter.sv
  rtl/components/pulp_clock_mux2.sv
  rtl/components/generic_fifo.sv
  rtl/components/sp_ram.sv

  rtl/axi2apb_wrap.sv
  rtl/periph_bus_wrap.sv
  rtl/core2axi_wrap.sv
  rtl/axi_node_intf_wrap.sv
  rtl/axi_spi_slave_wrap.sv
  rtl/axi_slice_wrap.sv
  rtl/axi_mem_if_SP_wrap.sv
  rtl/core_region.sv
  rtl/instr_ram_wrap.sv
  rtl/sp_ram_wrap.sv
  rtl/boot_code.sv
  rtl/boot_rom_wrap.sv
  rtl/peripherals.sv
  rtl/ram_mux.sv
  rtl/pulpino_top.sv
  rtl/clk_rst_gen.sv
  fpga/rtl/pulpino_wrap.v
}

set PULPINO_RISCV_FILES {
  ips/riscv/include/apu_core_package.sv
  ips/riscv/include/riscv_defines.sv
  ips/riscv/include/riscv_tracer_defines.sv
  ips/riscv/riscv_alu.sv
  ips/riscv/riscv_alu_basic.sv
  ips/riscv/riscv_alu_div.sv
  ips/riscv/riscv_compressed_decoder.sv
  ips/riscv/riscv_controller.sv
  ips/riscv/riscv_cs_registers.sv
  ips/riscv/riscv_debug_unit.sv
  ips/riscv/riscv_decoder.sv
  ips/riscv/riscv_int_controller.sv
  ips/riscv/riscv_ex_stage.sv
  ips/riscv/riscv_hwloop_controller.sv
  ips/riscv/riscv_hwloop_regs.sv
  ips/riscv/riscv_id_stage.sv
  ips/riscv/riscv_if_stage.sv
  ips/riscv/riscv_load_store_unit.sv
  ips/riscv/riscv_mult.sv
  ips/riscv/riscv_prefetch_buffer.sv
  ips/riscv/riscv_prefetch_L0_buffer.sv
  ips/riscv/riscv_core.sv
  ips/riscv/riscv_apu_disp.sv
  ips/riscv/riscv_fetch_fifo.sv
  ips/riscv/riscv_L0_buffer.sv
  ips/riscv/riscv_register_file.sv
}

set PULPINO_ZERO_RISCY_FILES {
  ips/zero-riscy/include/zeroriscy_defines.sv
  ips/zero-riscy/include/zeroriscy_tracer_defines.sv
  ips/zero-riscy/zeroriscy_alu.sv
  ips/zero-riscy/zeroriscy_compressed_decoder.sv
  ips/zero-riscy/zeroriscy_controller.sv
  ips/zero-riscy/zeroriscy_cs_registers.sv
  ips/zero-riscy/zeroriscy_debug_unit.sv
  ips/zero-riscy/zeroriscy_decoder.sv
  ips/zero-riscy/zeroriscy_int_controller.sv
  ips/zero-riscy/zeroriscy_ex_block.sv
  ips/zero-riscy/zeroriscy_id_stage.sv
  ips/zero-riscy/zeroriscy_if_stage.sv
  ips/zero-riscy/zeroriscy_load_store_unit.sv
  ips/zero-riscy/zeroriscy_multdiv_slow.sv
  ips/zero-riscy/zeroriscy_multdiv_fast.sv
  ips/zero-riscy/zeroriscy_prefetch_buffer.sv
  ips/zero-riscy/zeroriscy_fetch_fifo.sv
  ips/zero-riscy/zeroriscy_core.sv
  ips/zero-riscy/zeroriscy_register_file_ff.sv
}

