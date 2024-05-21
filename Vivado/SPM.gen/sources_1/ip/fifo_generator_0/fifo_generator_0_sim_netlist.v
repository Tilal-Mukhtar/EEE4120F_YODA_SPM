// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue May 21 15:00:24 2024
// Host        : DESKTOP-MNABL7I running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/tmukh/Documents/EEE4120F/SPM/SPM.gen/sources_1/ip/fifo_generator_0/fifo_generator_0_sim_netlist.v
// Design      : fifo_generator_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_generator_0,fifo_generator_v13_2_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_9,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module fifo_generator_0
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
  fifo_generator_0_fifo_generator_v13_2_9 U0
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
