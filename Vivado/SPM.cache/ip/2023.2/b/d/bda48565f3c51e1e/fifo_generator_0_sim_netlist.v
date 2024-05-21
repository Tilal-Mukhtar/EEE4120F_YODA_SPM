// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue May 21 15:00:21 2024
// Host        : DESKTOP-MNABL7I running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ fifo_generator_0_sim_netlist.v
// Design      : fifo_generator_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_generator_0,fifo_generator_v13_2_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_9,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clk,
    rst,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    wr_ack,
    empty,
    valid);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 core_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME core_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input clk;
  input rst;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [15:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [15:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  output wr_ack;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output valid;

  wire clk;
  wire [15:0]din;
  wire [15:0]dout;
  wire empty;
  wire full;
  wire rd_en;
  wire rst;
  wire valid;
  wire wr_ack;
  wire wr_en;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [9:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [9:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [9:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "1" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "10" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "16" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "16" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "1" *) 
  (* C_HAS_WR_ACK = "1" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "6" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "4" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "1022" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "10" *) 
  (* C_RD_DEPTH = "1024" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "10" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "10" *) 
  (* C_WR_DEPTH = "1024" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "10" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_9 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(clk),
        .data_count(NLW_U0_data_count_UNCONNECTED[9:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[9:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(rst),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(valid),
        .wr_ack(wr_ack),
        .wr_clk(1'b0),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[9:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
gcDjvJ18gZEH8C+LHMq/N7AaYWSyHgvjIQn585rdUOTVX2orO9n8j6LNiga3BYkS91+lbHAjAieW
oD/8serz9uvKt9uVuyMIE6oOFFScZR6q2wQk1d1Qzq717+8yPCwgBT9HIhfJIHLujHt+cA2l2L5t
tux9aNBdVKkk1MHv7yY=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
exhH3ieiewq538XhQByQWj7PMh1Y+pzdDw+4bALHgOXUMTZleYL0Pvhip/E5VwYBOb3/5i/ElWf3
Vm6OeE9b1Jj8xb7x10akeyRaNdCJYAtTqgb7gFS/crjXeoaYKJgLqCiyaB7LdWR9BiZOWqxEPSxe
/lr/8F8psti0kra2jACCbz94iU3qDIdZWH5kqd21Pp2/YczWpJBQzh+bBz9V+EuMAeZIzY3x2GZy
jOMZPemqiqFhSEcDf09mKK3xKEUxE+TPz82hd9ZrF5OjFst6mWMVye10lkzmY5Hmmx5Y/PVgPx3R
fN0tTAZfIDGH/YUu758U8UWOIcMzBHF6rytqmg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Umfm0FNxPKfdryB9QccnkcrzqkPtalTpE+R0M3D9kxaXOa1YOGT+9jGc1TRZMLcN5NyGN3UIZcH4
LWFVfGg80k9RmFHBDZaHzOXaomQhoPSO++ArXvmvO5zgttfCHEl7jypYkuPgwfQMfjK7YII9Deex
KOC8JtqORVWmhq47cpQ=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cm7WeJnXtFlUdJuJH7wHYfinJTaBhpglyFWD2YwmOuS4fmVA4nXbX0IMaU1F1WGO1VK25KlFf8Nm
w8L6BJ6ZpH12xPIl3J17rMT4/3KHv9tpBWqeC080GeV5nISo8JrhOpIKa4+HBHZ6lYLce8LBAu/Z
EiBmDqw22aLsAuPAzAMh9yuHT5rpX9ykD9u0uZ5UplK05S0TsvYMUqcHNQ2hijt/lbxvUxXHTa+W
GJ5RRQAdw98wG1mc65u16hfZPsLimnw4BHwpyNGOPadShqb78rQihc+YiBTn4lgN1HhquWRGqCYZ
ZEjBmtWOJm8WJSTWtcpFEkmPlOTDmNX82e9mnw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
a1mMNsEVIHwFCxw3sHygQ6eU3z5whgDQI+YHUmPAwU6q4vqfu2NVxu0z42QL1rV1rCsm39SqZ078
EGEqt7XUt6bdvI3yu4dU8gF+jou5njJ2UU34VmbOw/MQt48Hmi+hxtH1/zSlbNe2iOksDFEFTHmW
WGHgPS2bACG/KtAZMYK3gBtbnb9dtu+p5hxiQtwMOFnv9kQGBxcMaciN0yqy2TE5fygwKcNEua29
jiGUF0qgPS1k6qN+zLrYWkaVT0amR1MFXpv0WcwL+xVkxj6bBQhe5D7t5xCIsfLR4xqa5WVpa0dN
FkxGlIoufL17G/cGRr4nV4QP0sqcDCCHYpRoIA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rPFWI49JcHqYFxRrTG2uFixmE4jeIWIero9KijBFo7+FOCC7hJeSlCuNlwb8mBsI0Up57fm7C8t9
tb1l2QCfvy82JqTvEuH49UmS+8/GEnbK1QbVHsDIiv3/8cFn+0zw/VSuVeaN8L0yzeNIo8m59iAq
AQ9wOyqKFEhKKkbn+nVg+hQW3L/P25hisjV06sqmfsA0Rx4bYhFoxEvIw3A4x9LsBIIfDpgDsPzS
NICAEhfA7fWXKK6UsOmuq1NZLTDmFe2zEHijVMovzm/qqvHfu7fCt5POlGtLOPZhXGCDZi0v1yiq
VyT7JTUW5P/rcLgzkfyKToozq36lEkXd6VSaLg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
T4EV2kKcg5a7rlvEGr4AG3uvv0JzSoc0NQb9aIeE2gsKGq0oLel4q0oZ7eO6He8noW5KEowgkY0O
xDnerk/R4qxdSePYeRRmUg3KZ7hAHVEQrHpQ2RbYwK5mUIpQLjxCWRWzBjeWOce2bh0dAMR/4OH6
t95V8b9VWpgepcUXynGvLDv31tVgr+8LtXlgWTNBiJj2mTZ3gEVxpgGRwMGsampw9yKqBKoR+/hg
++FP8JJkrOSdB2bhnNaD4fZotMLkhYDrWvQm9z6rW7fwxA2oEI+oUqi+K+82oiLzeVWy7FhVyzgS
Y273uSE53DWk35UE9A6ebcI/xUl1iGqwdeZihA==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
gZRrJLrBkbil4BLf1tia07NzGL28f+Pk9zyPElbTDf8NEXCsuwTum6RjR5lvY/odzAYHlcKxpG+6
gwjafT2OV5gHqqtPXrRHcVU4p5LEzOOl5p3puqvK+1z2+YpHqxOZIIZPIH9kjtzNgcBmcU7S2sFN
zTxyAYuLL9sAN+AIQ9UrW4MXDWxUtdkwPaSyFIvuKoxOKUD5IXEY9NtBpz1zsABMKNHneOO8pAix
qg8S/uQ/XJ8Qggr+vE7HDUUMCsijNXvqbkLM3xf6dXFpOqanKxd6/GfTcob4sezm/hMOZ2xiXcfS
hsYUMRdO9H6fmhECfszoK2XMsMt6xM+vlLywWJ0I6u468qVFxROkf9vL+ZDq/tMiJOm7E1p+HDif
98f5v1OybtzlZJP9bDMwWYcsCqcDejCMQyYOgPCgg+2jTR1JezxuK7PpjyliT0rnu7FfI/0tRzbL
d5YqO79RN0byWVTTdIlTWzL/qBD8BLVqXzWs3M+up46dGPxbkzv44od4

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
A79lFm/8JnoMxv1MOWkY+AtU24uc6/CeGf6bjoYWLJXkzzHQooKleg9l+jH7oajoC3oVQh/sMXdi
3QmwZ5SKMt6sb03SC5BW7xPky8zyP6w8FRMCI2Tz1/GhozqjIbgSstUfCaemxIgj3rG7GkRYZ/2k
ualG2mpYDNyaxz1lMYaHfm7stH/IQlkCh6HHMbi7ImYJ6pILa828Ls3VREjo7dtXPS2ZDFxreSIH
2SZ3NpLJO0/umchZaUkt1xN0bsxgtGdOzSqGDpTJrU/ltmclBX199pmrXQa5p/q0FSLj2WkB043l
l3x1Rdipn49DvChkvbVzJP9aej4kwSPhvxHnHQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GFpXmWYmUY46GvuVucUW1VOu3+gGtLxYW4Ho/p4wggZ+jWrpUVhz2RSAxu+ufiLHtM9oYgKPaSYT
DOeuIJGTnxGr20Vh6Nn3cc41TyKAf0vxN2fGISEQQWrjh9OOgNcBmJfaHsSq7+5dhCaIWlGrInVr
GD5TqclLzw6cHAuPGxMi2wD4rq16RkDJnQbPf8ptaskWz81NxZfyWAL4T2E24soybpln8+vuF+72
IQYfLQh/dDDsNHKNKwTKAtGjpFS8eVSbYnS+k3Am4loN8JRflh0+c4yGUo4EkuRzUFiIBrJOKylp
qicgwQw7vdbe+yPl6moUlvA1U2CjJ87bsXk5CA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hzklq501x4qEym07A6+Vh+O6T5Q1srpTjckVi/KQ8/P6I6xpFqHBBikoKASz9mkWuvFaf6aly934
etGfnzZuPuKCoMPixevIcq9cgFblu43p0H0FR4BSbqN+A/K2utwAblPur01qwtH9nc1azxOtPedI
3KLsEBUN2ObidzkZIUbiQlQ72wru0lGZ5uN6iiNcLRnEhqjdjWiOHf5qGo+df2QyP6S5zRR7hGOd
N5h9/9towH2UQ++6hnOd4pjtl7PKHWlU92421M+LhruDkz4Bw6c7d7EVdbIcZ3ub+l/OnCyNwQsr
WUo2E+j4vd3zIVA0gzTA1oLX73BJ1oxwQdO3JA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 53840)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
